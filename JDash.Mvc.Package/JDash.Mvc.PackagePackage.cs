using System;
using System.Diagnostics;
using System.Globalization;
using System.Runtime.InteropServices;
using System.ComponentModel.Design;
using Microsoft.Win32;
using Microsoft.VisualStudio;
using Microsoft.VisualStudio.Shell.Interop;
using Microsoft.VisualStudio.OLE.Interop;
using Microsoft.VisualStudio.Shell;

using JDash.WebForms.Design;
using System.Web.Configuration;
using Kalitte.JDash_Package.Utils;
using JDash.Package.Utils;
using MvcManagement;
using System.Windows.Forms;
using System.IO;

namespace Kalitte.JDash_Package
{
    [PackageRegistration(UseManagedResourcesOnly = true)]
    [InstalledProductRegistration("#110", "#112", "1.0", IconResourceID = 400)]
    [ProvideMenuResource("Menus.ctmenu", 1)]
    [Guid(GuidList.guidJDash_PackagePkgString)]
    public sealed class JDash_PackagePackage : Package
    {
        public JDash_PackagePackage()
        {
        }

        private bool checkProject()
        {
            var proj = Extensions.GetActiveProject();
            if (proj == null)
            {
                MessageBox.Show("Please open / create a web application");
                return false;
            }

            return true;
        }

        protected override void Initialize()
        {
            base.Initialize();
            OleMenuCommandService mcs = GetService(typeof(IMenuCommandService)) as OleMenuCommandService;
            if (null != mcs)
            {
                CommandID managementCommand = new CommandID(GuidList.guidJDash_PackageCmdSet, (int)PkgCmdIDList.cmdidManagement);
                MenuCommand managementMenuItem = new MenuCommand(ManagementCallBack, managementCommand);
                CommandID settingsCommand = new CommandID(GuidList.guidJDash_PackageCmdSet, (int)PkgCmdIDList.cmdidSettings);
                MenuCommand settingsMenuItem = new MenuCommand(SettingsCallBack, settingsCommand);
                mcs.AddCommand(managementMenuItem);
                mcs.AddCommand(settingsMenuItem);
            }
        }
        private void ManagementCallBack(object sender, EventArgs e)
        {
            if (checkProject())
            {
                var path = Path.GetDirectoryName(Extensions.GetActiveProject().FullName);
                var accessUrl = WebDevServerUtils.StartWebDev(SettingUtils.GetManagementFolder(path), null, "", path);
                Process.Start(accessUrl);

                //var startInfo = new ProcessStartInfo("IExplore.exe", accessUrl);
                //System.Diagnostics.Process.Start(startInfo);
            }
        }
        private void SettingsCallBack(object sender, EventArgs e)
        {
            if (checkProject())
            {
                var proj = Extensions.GetActiveProject();
                var path = Path.GetDirectoryName(proj.FullName);
                var config = Extensions.OpenConfigFile(Path.Combine(path, "Web.config"));
                FmProvider.createConfigItems(config);
                FmProvider f = new FmProvider();
                f.vsProject = proj;
                f.configuration = config;
                f.ShowDialog();
            }
        }



    }
}
