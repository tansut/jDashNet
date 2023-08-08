using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using EnvDTE;
using EnvDTE100;
using EnvDTE80;
using EnvDTE90;
using JDash.Helpers;

namespace JDash.ToolBox.Installer
{

    public enum VSVersion
    {
        VS2013,VS2012, VS2010, VS2008
    }

    public class DteInfo
    {
        public VSVersion Version { get; set; }
        public DTE Dte { get; set; }
        public bool Active { get; set; }
        public DteInfo(VSVersion version, DTE dte, bool active)
        {
            Dte = dte;
            Version = version;
            Active = active;
        }
    }

    [ComImport(), Guid("00000016-0000-0000-C000-000000000046"),
  InterfaceTypeAttribute(ComInterfaceType.InterfaceIsIUnknown)]
    interface IOleMessageFilter
    {
        [PreserveSig]
        int HandleInComingCall(
            int dwCallType,
            IntPtr hTaskCaller,
            int dwTickCount,
            IntPtr lpInterfaceInfo);

        [PreserveSig]
        int RetryRejectedCall(
            IntPtr hTaskCallee,
            int dwTickCount,
            int dwRejectType);

        [PreserveSig]
        int MessagePending(
            IntPtr hTaskCallee,
            int dwTickCount,
            int dwPendingType);
    }

    public class ProgressChangedEventArgs : EventArgs
    {
        public double Progress { get; set; }
        public double ProgressMax { get; set; }
        public ProgressChangedEventArgs(double progress, double progressMax)
        {
            Progress = progress;
            ProgressMax = progressMax;
        }
    }

    public class Installer : IOleMessageFilter, IDisposable
    {



        public delegate void ProgressChangesHandler(object sender, ProgressChangedEventArgs e);
        public event ProgressChangesHandler ProgressChanges = null;
        private const string tabName = "JDash.Net";
        static IOleMessageFilter oldFilter;

        public Dictionary<VSVersion, string> GetVSEditions()
        {
            var vsVersions = new Dictionary<VSVersion, string>();
            vsVersions.Add(VSVersion.VS2013, "VisualStudio.DTE.12.0");
            vsVersions.Add(VSVersion.VS2012, "VisualStudio.DTE.11.0");
            vsVersions.Add(VSVersion.VS2010, "VisualStudio.DTE.10.0");
            //vsVersions.Add(VSVersion.VS2008, "VisualStudio.DTE.9.0");
            return vsVersions;
        }


        public Installer()
        {
            CoRegisterMessageFilter(this, out oldFilter);
        }

        public void Perform(bool isInstall)
        {
            foreach (var item in GetCurrentVS())
            {
                var dteObject = item.Dte;
                try
                {
                    dteObject.Solution.Close(true);
                    dteObject.Quit();
                    Marshal.ReleaseComObject(dteObject);
                }
                catch
                {
                }
            }
            var perfoms = GetCurrentVS();
            int ctr = 0;
            foreach (var item in perfoms)
            {
                var dteObject = item.Dte;
                if (!item.Active)
                {
                    string tempFile = Path.GetFileNameWithoutExtension(Path.GetTempFileName());
                    string tempDirectory = string.Format("{0}{1}", Path.GetTempPath(), tempFile);
                    dynamic solution = null;
                    string templatePath = null;
                    try
                    {
                        switch (item.Version)
                        {
                            case VSVersion.VS2013:
                                solution = (dteObject.Solution as Solution4);
                                templatePath = solution.GetProjectTemplate("WebApplication40", @"Web\CSharp\1033");
                                break;
                            case VSVersion.VS2012:
                                solution = (dteObject.Solution as Solution4);
                                templatePath = solution.GetProjectTemplate("WebApplication40", @"Web\CSharp\1033");
                                break;
                            case VSVersion.VS2010:
                                solution = (dteObject.Solution as Solution3);
                                templatePath = solution.GetProjectTemplate("WebApplication40.zip", @"Web\CSharp\1033");
                                break;
                            case VSVersion.VS2008:
                                solution = (dteObject.Solution as Solution2);
                                templatePath = solution.GetProjectTemplate("WebApplication40.zip", @"Web\CSharp\1033");
                                break;
                            default:
                                break;
                        }
                    }
                    catch (Exception)
                    {
                        continue;
                    }
                    if (templatePath == null) continue;
                    if (solution == null) throw new InvalidOperationException("Only 2010,2012 and 2013 versions of Visual Studio are supported");

                    var solPath = Path.Combine(tempDirectory, "TempWebApp.sln");
                    solution.AddFromTemplate(templatePath, tempDirectory, "TempWebApp", false);
                    dteObject.Solution.Close(true);
                    var timing = 0;
                    while (!File.Exists(solPath) && timing < 5)
                    {
                        timing++;
                        System.Threading.Thread.Sleep(1000);
                    }
                    solution.Open(solPath);
                }

                Window ToolBoxWnd = dteObject.Windows.Item("{B1E99781-AB81-11D0-B683-00AA00A3EE26}");
                ToolBoxWnd.Visible = true;
                ToolBoxWnd.DTE.ExecuteCommand("View.PropertiesWindow", "");
                ToolBoxTabs tlbTabs = ((EnvDTE.ToolBox)ToolBoxWnd.Object).ToolBoxTabs;
                ToolBoxTab tlbTab = null;
                foreach (ToolBoxTab tab in tlbTabs)
                {
                    if (tab.Name == tabName)
                    {
                        tlbTab = tab;
                        foreach (ToolBoxItem tItem in tlbTab.ToolBoxItems)
                        {
                            if (tItem != null)
                            {
                                try
                                {
                                    tItem.Select();
                                    tlbTab.ToolBoxItems.SelectedItem.Delete();
                                }
                                catch
                                {
                                    break;
                                }
                            }
                            else break;
                        }
                        break;
                    }
                }
                if (isInstall)
                {
                    if (tlbTab == null)
                    {
                        tlbTab = tlbTabs.Add(tabName);
                    }
                    tlbTab.Activate();
                    tlbTab.ToolBoxItems.Item(1).Select();
                    tlbTab.ToolBoxItems.Add("JDash.WebForms.DashboardView", Path.Combine(SettingUtils.GetAssembliesFolder(), "JDash.WebForms.dll"),
                        vsToolBoxItemFormat.vsToolBoxItemFormatDotNETComponent);
                }
                else
                {

                    if (tlbTab != null)
                    {
                        tlbTab.Activate();
                        tlbTab.Delete();
                    }
                }


                ctr++;
                if (ProgressChanges != null)
                {
                    ProgressChanges(this, new ProgressChangedEventArgs(ctr, perfoms.Count()));
                }
                dteObject.Solution.Close(true);
                dteObject.Quit();
                Marshal.ReleaseComObject(dteObject);
                Application.DoEvents();
            }
        }

        public List<DteInfo> GetCurrentVS()
        {
            List<DteInfo> result = new List<DteInfo>();
            var versions = GetVSEditions();
            foreach (var item in versions)
            {
                try
                {

                    DTE dte = (DTE)System.Runtime.InteropServices.Marshal.GetActiveObject(item.Value);
                    result.Add(new DteInfo(item.Key, dte, true));
                }
                catch (COMException)
                {
                    try
                    {
                        System.Type t = System.Type.GetTypeFromProgID(item.Value);
                        DTE dte = (DTE)System.Activator.CreateInstance(t, true);
                        result.Add(new DteInfo(item.Key, dte, false));
                    }
                    catch
                    {

                    }
                }

            }
            if (result.Any())
            {
                return result;
            }
            else
                throw new InvalidOperationException("Only 2010,2012 and 2013 versions of Visual Studio are supported");
        }



        int IOleMessageFilter.HandleInComingCall(int dwCallType, IntPtr hTaskCaller, int dwTickCount, IntPtr lpInterfaceInfo)
        {
            return 0;
        }

        int IOleMessageFilter.RetryRejectedCall(IntPtr hTaskCallee, int dwTickCount, int dwRejectType)
        {
            if (dwRejectType == 2)
                return 50;
            return -1;
        }

        int IOleMessageFilter.MessagePending(IntPtr hTaskCallee, int dwTickCount, int dwPendingType)
        {
            return 2;
        }
        [DllImport("ole32.dll")]
        static extern int CoRegisterMessageFilter(IOleMessageFilter newFilter, out IOleMessageFilter oldFilter);

        public void Dispose()
        {
            GC.SuppressFinalize(this);

            CoRegisterMessageFilter(null, out oldFilter);
            GC.Collect();
            GC.WaitForPendingFinalizers();
        }
    }
}
