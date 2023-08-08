using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Web;
using System.Reflection;
using System.Diagnostics;
using JDash.Mvc.Core;
namespace MvcManagement
{
    public static class SettingUtils
    {
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
            var path = Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles) + @"\Kalitte\JDash Asp.Net MVC\Management";
            if (!Directory.Exists(path))
            {
                string fileVersion = App.AssemblyVersion;
                path = Path.Combine(Path.GetDirectoryName(defaultPath), "packages\\JDash.Mvc." + fileVersion + "\\lib\\Management");
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
