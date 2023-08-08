using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace JDash.Helpers
{
    public class FileHelper
    {
        // Methods
        public static string ReadFile(string path)
        {
            using (StreamReader reader = new StreamReader(path))
            {
                string str = reader.ReadToEnd();
                reader.Close();
                return str;
            }
        }

        public static void WriteFile(string path, string value)
        {
            StreamWriter writer = new StreamWriter(path);
            writer.Write(value);
            writer.Close();
        }

        public static void WriteToEnd(string path, string value)
        {
            WriteFile(path, ReadFile(path).Trim() + value.Trim());
        }

        public static void WriteToStart(string path, string value)
        {
            WriteFile(path, value.Trim() + ReadFile(path).Trim());
        }
    }





}
