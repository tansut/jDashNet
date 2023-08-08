using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Web;
using System.Windows.Forms;
using Microsoft.Win32;

namespace JDash.Helpers
{
    public static class SettingUtils
    {
        public static string GetInstallationPath(bool forManagement = false)
        {
            var path = Registry.GetValue(@"HKEY_CURRENT_USER\SOFTWARE\Kalitte\JDash", "InstallPath", null) as string;
            if (forManagement)
                return path;
            if (string.IsNullOrEmpty(path))
            {
                path = Path.GetDirectoryName(System.Reflection.Assembly.GetCallingAssembly().Location);
            }
            return path;
        }

        public static string GetAssembliesFolder()
        {
            return Path.Combine(GetInstallationPath(), "Bin");
        }

        private static string GetManagementFolderFromDialog()
        {
            FolderBrowserDialog ofd = new FolderBrowserDialog();
            ofd.Description = "Please select JDash Management Folder";
            if (ofd.ShowDialog() == DialogResult.OK)
            {
                var file = ofd.SelectedPath.Trim();
                if (Directory.Exists(file))
                {
                    return file;
                }
            }
            return null;
        }
        
        public static string GetManagementFolder(string defaultPath = "")
        {
            var path = GetInstallationPath(true);

            if (string.IsNullOrEmpty(path))
                path = defaultPath;

            //path = Path.Combine(Directory.GetParent(path).FullName, "packages\\JDash.WebForms\\Management");

            path = Path.Combine(path, "Management");


            if (string.IsNullOrEmpty(path) || !Directory.Exists(path))
            {
                if (HttpContext.Current != null)
                {
                    return path;
                }
                path = Registry.GetValue(@"HKEY_CURRENT_USER\SOFTWARE\Kalitte\JDash", "ManagementPath", null) as string;
                if (string.IsNullOrEmpty(path))
                {
                    var file = GetManagementFolderFromDialog();
                    if (!string.IsNullOrEmpty(file))
                    {
                        var key = Registry.CurrentUser.CreateSubKey(@"SOFTWARE\Kalitte\JDash");
                        key.SetValue("ManagementPath", file);
                        path = file;
                    }
                }
                return path;
            }
            return path;
        }


        public static DateTime GetBuildDate()
        {
            string filePath = System.Reflection.Assembly.GetCallingAssembly().Location;
            const int c_PeHeaderOffset = 60;
            const int c_LinkerTimestampOffset = 8;
            byte[] b = new byte[2048];
            System.IO.Stream s = null;

            try
            {
                s = new System.IO.FileStream(filePath, System.IO.FileMode.Open, System.IO.FileAccess.Read);
                s.Read(b, 0, 2048);
            }
            finally
            {
                if (s != null)
                {
                    s.Close();
                }
            }

            int i = System.BitConverter.ToInt32(b, c_PeHeaderOffset);
            int secondsSince1970 = System.BitConverter.ToInt32(b, i + c_LinkerTimestampOffset);
            DateTime dt = new DateTime(1970, 1, 1, 0, 0, 0);
            dt = dt.AddSeconds(secondsSince1970);
            dt = dt.AddHours(TimeZone.CurrentTimeZone.GetUtcOffset(dt).Hours);
            return dt;
        }
    }
}
