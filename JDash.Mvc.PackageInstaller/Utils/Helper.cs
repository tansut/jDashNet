using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace JDash.Mvc.PackageInstaller.Utils
{
    class Helper
    {
        public static string GetVisualStudioInstallationPath(string version)
        {
            string installationPath = null;
            if (Environment.Is64BitOperatingSystem)
            {
                installationPath = (string)Registry.GetValue(
                   string.Format("HKEY_LOCAL_MACHINE\\SOFTWARE\\Wow6432Node\\Microsoft\\VisualStudio\\{0}.0\\", version),
                    "InstallDir",
                    null);
            }
            else
            {
                installationPath = (string)Registry.GetValue(
           string.Format("HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\VisualStudio\\{0}.0\\", version),
                  "InstallDir",
                  null);
            }
            return installationPath;

        }
    }
}
