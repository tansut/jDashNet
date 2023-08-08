using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Management;
using System.Net;
using System.Net.NetworkInformation;
using System.Runtime.InteropServices;
using System.Text;
using System.Text.RegularExpressions;
using EnvDTE;
using Microsoft.Win32;
using System.Windows.Forms;

namespace JDash.WebForms.Utils
{

    internal enum VSVersion
    {
        VS2013, VS2012, VS2010, VS2008
    }

    internal static class WebDevServerUtils
    {

        public static Dictionary<VSVersion, string> GetVSEditions()
        {
            var vsVersions = new Dictionary<VSVersion, string>();
            vsVersions.Add(VSVersion.VS2013, "VisualStudio.DTE.12.0");
            vsVersions.Add(VSVersion.VS2012, "VisualStudio.DTE.11.0");
            vsVersions.Add(VSVersion.VS2010, "VisualStudio.DTE.10.0");
            vsVersions.Add(VSVersion.VS2008, "VisualStudio.DTE.9.0");
            return vsVersions;
        }

        public static KeyValuePair<VSVersion, DTE> GetCurrentVS()
        {
            var versions = GetVSEditions();
            DTE dte;
            foreach (var item in versions)
            {
                try
                {
                    dte = (DTE)System.Runtime.InteropServices.Marshal.GetActiveObject(item.Value);
                    return new KeyValuePair<VSVersion, DTE>(item.Key, dte);
                }
                catch (COMException)
                {
                    continue;
                }
            }
            return new KeyValuePair<VSVersion, DTE>(VSVersion.VS2013, null);


        }

        public static string GetWebDevServerPath()
        {
            List<string> paths = new List<string>();
            string programFiles;
            if (8 == IntPtr.Size || (!String.IsNullOrEmpty(Environment.GetEnvironmentVariable("PROCESSOR_ARCHITEW6432"))))
            {
                programFiles = Environment.GetEnvironmentVariable("ProgramFiles(x86)");
            }
            programFiles = Environment.GetEnvironmentVariable("ProgramFiles");
            programFiles = Path.Combine(programFiles, @"Common Files\Microsoft Shared\DevServer\");
            var vsVersions = GetVSEditions();
            foreach (var item in vsVersions)
            {
                if (item.Key != VSVersion.VS2008)
                {

                    if (item.Key == VSVersion.VS2013)
                    {
                        paths.Add(Path.Combine(Path.Combine(programFiles, "12.0"), "WebDev.WebServer40.exe"));
                    }
                    else if (item.Key == VSVersion.VS2012)
                    {
                        paths.Add(Path.Combine(Path.Combine(programFiles, "11.0"), "WebDev.WebServer40.exe"));
                    }
                    else
                    {
                        paths.Add(Path.Combine(Path.Combine(programFiles, "10.0"), "WebDev.WebServer40.exe"));
                    }
                }
                else
                    paths.Add(Path.Combine(Path.Combine(programFiles, "9.0"), "WebDev.WebServer.exe"));

            }
            if (!paths.Any())
            {
                throw new InvalidOperationException(" ** Only 2008,2010,2012 and 2013 versions of Visual Studio are supported **");
            }
            foreach (var path in paths)
            {
                if (File.Exists(path))
                {
                    return path;
                }
            }
            throw new InvalidOperationException("No installed web development server");
        }

        public static int? IsInstanceRunning(string applicationPath)
        {
            int? result = null;
            const string query = "select CommandLine,ProcessId from Win32_Process where Name='WebDev.WebServer.EXE' or Name='WebDev.WebServer40.EXE'";
            using (ManagementObjectSearcher searcher = new ManagementObjectSearcher(query))
            {
                using (ManagementObjectCollection results = searcher.Get())
                {
                    foreach (ManagementObject process in results)
                    {
                        if (process["CommandLine"] != null && process["CommandLine"].ToString().Contains(applicationPath))
                        {
                            Regex rgx = new Regex(@"/port:(\d+)");
                            var match = rgx.Match(process["CommandLine"].ToString());
                            if (match.Success)
                            {
                                return int.Parse(match.Groups[1].Value);
                            }
                        }
                    }
                }
            }
            return result;
        }

        public static int GetAvailablePort(int rangeStart, int rangeEnd, IPAddress ip, bool includeIdlePorts)
        {
            List<ushort> excludedPorts = new List<ushort>();
            IPGlobalProperties ipProps = IPGlobalProperties.GetIPGlobalProperties();
            Func<IPAddress, bool> isIpAnyOrLoopBack = i => IPAddress.Any.Equals(i) || IPAddress.IPv6Any.Equals(i) || IPAddress.Loopback.Equals(i) || IPAddress.IPv6Loopback.Equals(i);
            excludedPorts.AddRange(ipProps.GetActiveTcpConnections().Where(w => w.LocalEndPoint.Port >= rangeStart && w.LocalEndPoint.Port <= rangeEnd && (isIpAnyOrLoopBack(ip) || w.LocalEndPoint.Address.Equals(ip) || isIpAnyOrLoopBack(w.LocalEndPoint.Address)) && (!includeIdlePorts || w.State != TcpState.TimeWait)).Select(s => (ushort)s.LocalEndPoint.Port));
            excludedPorts.AddRange(ipProps.GetActiveTcpListeners().Where(w => w.Port >= rangeStart && w.Port <= rangeEnd && (isIpAnyOrLoopBack(ip) || w.Address.Equals(ip) || isIpAnyOrLoopBack(w.Address))).Select(s => (ushort)s.Port));
            excludedPorts.AddRange(ipProps.GetActiveUdpListeners().Where(w => w.Port >= rangeStart && w.Port <= rangeEnd && (isIpAnyOrLoopBack(ip) || w.Address.Equals(ip) || isIpAnyOrLoopBack(w.Address))).Select(s => (ushort)s.Port));
            excludedPorts.Sort();
            for (int port = rangeStart; port <= rangeEnd; port++)
            {
                if (!excludedPorts.Contains((ushort)port))
                {
                    return port;
                }
            }
            return 0;
        }

        public static void StartIISExpressFromPath(string path, int port = 7329)
        {
            var iis = new System.Diagnostics.Process();
            var fileName = Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles) + @"\IIS Express\iisexpress.exe";
            if (!File.Exists(fileName))
            {
                OpenFileDialog of = new OpenFileDialog();
                of.Title = "Locate IIS Express";
                of.FileName = "iisexpress.exe";
                of.Filter = "Executables|*.exe";
                if (of.ShowDialog() == DialogResult.Yes)
                    fileName = of.FileName;
            }
            iis.StartInfo.FileName = fileName;
            iis.StartInfo.Arguments = string.Format("/path:\"{0}\" /port:{1}", path, port);
            iis.StartInfo.CreateNoWindow = true;
            iis.StartInfo.UseShellExecute = false;
            iis.Start();
            System.Threading.Thread.Sleep(5000);
        }

        public static string StartWebDev(string applicationPath, int? port, string virtualPath)
        {

            int avaliablePort = 0;

            int? runningPort = null;

            var vs = GetCurrentVS();

            if (vs.Key == VSVersion.VS2013)
            {
                while (avaliablePort == 0)
                {
                    avaliablePort = GetAvailablePort(10000, 50000, IPAddress.Loopback, false);
                }
                StartIISExpressFromPath(applicationPath, avaliablePort);
            }
            else
            {
                //virtualPath = "JDash";
                try
                {
                    runningPort = IsInstanceRunning(applicationPath);
                }
                catch
                {

                }


                if (runningPort.HasValue)
                {
                    avaliablePort = runningPort.Value;
                }
                else
                {

                    if (port.HasValue)
                    {
                        if (GetAvailablePort(port.Value, port.Value, IPAddress.Loopback, false) == port.Value)
                        {
                            avaliablePort = port.Value;
                        }
                        else throw new ArgumentException("Selected port is not avaliable");
                    }
                    else
                    {
                        while (avaliablePort == 0)
                        {
                            avaliablePort = GetAvailablePort(10000, 50000, IPAddress.Loopback, false);
                        }
                    }

                    // port hazır

                    string arguments = String.Format(CultureInfo.InvariantCulture, " /port:{0} /path:\"{1}\" /vpath:\"/{2}\"", avaliablePort, applicationPath, virtualPath);
                    Debug.Print("Starting ...");
                    using (System.Diagnostics.Process proc = new System.Diagnostics.Process())
                    {
                        proc.StartInfo = new ProcessStartInfo
                        {
                            FileName = GetWebDevServerPath(),
                            Arguments = arguments,
                            CreateNoWindow = true
                        };
                        bool started = proc.Start();
                        if (!started)
                        {
                            throw new Exception("Error starting server");
                        }
                    }
                }
            }

            if (string.IsNullOrWhiteSpace(virtualPath))
                return string.Format("http://localhost:{0}/default.aspx", avaliablePort);
            else return string.Format("http://localhost:{0}/{1}/default.aspx", avaliablePort, virtualPath.Trim("/".ToCharArray()));

        }
    }
}
