using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using JDash.Helpers;

namespace JDash.ToolBox.Installer
{
    public partial class Form1 : Form
    {
        string[] args;
        Installer installer;
        public Form1(string[] args)
        {
            InitializeComponent();
            this.args = args;
            installer = new Installer();
            installer.ProgressChanges += installer_ProgressChanges;
        }

        void installer_ProgressChanges(object sender, ProgressChangedEventArgs e)
        {
            var max = ctlProgressBar.Maximum;
            ctlProgressBar.Value = e.Progress == e.ProgressMax ? max : (int)((e.Progress / e.ProgressMax) * max);
            ctlProgressBar.Refresh();
            Application.DoEvents();
        }


        private void Form1_Shown(object sender, EventArgs e)
        {
            if (MessageBox.Show("All visual studio solutions will be closed during the toolbox controls installation. Are you sure ?", "JDash.Net Toolbox Controls Installation", MessageBoxButtons.YesNo) == System.Windows.Forms.DialogResult.Yes)
            {
                if (!args.Any())
                {
                    installer.Perform(true);
                }
                else
                {
                    if (args[0] == "-i" || args[0] == "/i")
                    {
                        installer.Perform(true);
                    }
                    if (args[0] == "-u" || args[0] == "/u")
                    {
                        installer.Perform(false);
                    }
                }
            }
            else
            {
                MessageBox.Show(string.Format("You can manually install toolbox controls after installation by running \"{0}\\JDash.ToolBox.Installer.exe\".\nTo uninstall run with \"-u\" parameter.", SettingUtils.GetAssembliesFolder()));
            }
            Application.DoEvents();
            Application.Exit();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
    }
}
