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

namespace JDash.Mvc.StarterApplication
{
    public partial class Main : Form
    {
        public Main()
        {
            InitializeComponent();
        }

        public static void RunApplication(string fileName)
        {
            string execPath;
            execPath = Path.Combine(Application.StartupPath, fileName);
            if (File.Exists(execPath))
            {
                System.Diagnostics.Process.Start(execPath);
            }
            else
            {
                MessageBox.Show("Installation files do not exist on file system. Please reinstall JDash");
            }
        }
        private void ctlDevelopersGuide_Click(object sender, EventArgs e)
        {
            RunApplication(@"../Documentation/JDashNetMvcDevelopersGuide.pdf");
            
        }

        private void ctlSampleApplication_Click(object sender, EventArgs e)
        {
            RunApplication(@"../Sample Application\JDash.MvcDemo.csproj");
        }

        private void ctlAPI_Click(object sender, EventArgs e)
        {
           
        }

        private void button1_Click(object sender, EventArgs e)
        {
            RunApplication(@"../Documentation/JDash.Net Custom Development.url");
        }

        private void ctlTechnicalSupport_Click(object sender, EventArgs e)
        {
            RunApplication(@"../Documentation/JDash.Net Technical Support.url");
        }

        private void ctlPurchase_Click(object sender, EventArgs e)
        {
            RunApplication(@"../Documentation/JDash.Net Purchase.url");
        }

        private void Main_Load(object sender, EventArgs e)
        {
           
        }
    }
}
