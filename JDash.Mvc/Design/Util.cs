using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace JDash.Mvc.Design
{
    internal static class Util
    {
        public static void OpenUrl(string url)
        {

            System.Diagnostics.Process proc = new System.Diagnostics.Process();

            System.Diagnostics.ProcessStartInfo startInfo = new System.Diagnostics.ProcessStartInfo(url);

            proc.StartInfo = startInfo;

            proc.Start();
        }
    }
}
