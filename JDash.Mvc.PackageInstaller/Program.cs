using JDash.Mvc.PackageInstaller.Utils;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading;

namespace JDash.Mvc.PackageInstaller
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                var jDashMvcPackageId = "33687403-8ca4-493a-a8df-3d6cfe9396a8";

                if (args.Length == 0)
                {
                    Console.WriteLine("Trying to install Vs.Net package ...");

                    var packagePath = Path.Combine(Directory.GetParent(Assembly.GetEntryAssembly().Location).FullName, "JDash.Mvc.Package.vsix");

                    if (File.Exists(packagePath))
                        ExecuteVsixInstaller(String.Format("/q {0}", "\"" + packagePath + "\""));
                    else
                        Console.WriteLine("VSIX File not found...");
                }
                else if (args[0] == "/uninstall")
                {
                    Console.WriteLine("Trying to uninstall Vs.Net package ...");
                    ExecuteVsixInstaller(String.Format("/q /uninstall:{0}", jDashMvcPackageId));
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }


        }

        private static void ExecuteVsixInstaller(string arguments)
        {
            var versions = new string[] { "11", "12" };
            foreach (var version in versions)
            {
                var vsInstallationPath = Helper.GetVisualStudioInstallationPath(version);
                if (!String.IsNullOrEmpty(vsInstallationPath))
                {
                    var vsixInstallerPath = Path.Combine(vsInstallationPath, "VSIXInstaller.exe");
                    if (File.Exists(vsixInstallerPath))
                    {

                        Process p = new Process();
                        p.StartInfo.UseShellExecute = true;
                        p.StartInfo.FileName = vsixInstallerPath;
                        p.StartInfo.Arguments = arguments;
                        p.Start();
                        p.EnableRaisingEvents = true;
                        p.WaitForExit();
                        if (p.ExitCode != 0)
                        {
                            throw new Exception("Exit code: "+p.ExitCode);
                        }

                    }
                }
            }
        }



    }
}
