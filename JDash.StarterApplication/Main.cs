using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Microsoft.Win32;

namespace JDash.StarterApplication
{
    public partial class Main : Form
    {
        public Main()
        {
            InitializeComponent();
        }

      
        private string path;

        public string InstallPath
        {
            get
            {
                if (string.IsNullOrEmpty(path))
                {
                    path = Registry.GetValue(@"HKEY_CURRENT_USER\SOFTWARE\Kalitte\JDash", "InstallPath", null) as string;
                    if (string.IsNullOrEmpty(path))
                    {
                        MessageBox.Show("Wrong registry info. Please reinstall JDash");
                        path = null;
                    }                   
                }
                return path;
            }
        }


        private void RunApplication(string fileName)
        {
            string execPath;
            if (InstallPath != null)
            {
                execPath = Path.Combine(InstallPath, fileName);
                if (File.Exists(execPath))
                {
                    System.Diagnostics.Process.Start(execPath);
                }
                else
                {
                    MessageBox.Show("Installation files do not exist on file system. Please reinstall JDash");
                }
            }
            
        }

        private void ctlPurchase_Click(object sender, EventArgs e)
        {
            RunApplication(@"Documentation\JDash.Net Purchase.url");
        }

        private void ctlTechnicalSupport_Click(object sender, EventArgs e)
        {
            RunApplication(@"Documentation\JDash.Net Technical Support.url");
        }

        private void ctlSampleApplication_Click(object sender, EventArgs e)
        {
            RunApplication(@"Sample Application\JDash.WebForms.Demo.csproj");
        }

        private void ctlDevelopersGuide_Click(object sender, EventArgs e)
        {
            RunApplication(@"Documentation\JDash.Net Web Forms Developers Guide.pdf");
        }

        private void ctlOfficial_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            RunApplication(@"Documentation\JDash.Net Official Web Site.url");
        }

        private void ctlAPI_Click(object sender, EventArgs e)
        {
            RunApplication(@"Documentation\jdashapi.chm");
        }

        private void button1_Click(object sender, EventArgs e)
        {
            RunApplication(@"Documentation\JDash.Net Custom Development.url");
        }
    }
}
