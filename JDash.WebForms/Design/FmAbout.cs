/*  ----------------------------------------------------------------------------
 *  Kalitte Professional Information Technologies
 *  ----------------------------------------------------------------------------
 *  Dynamic Dashboards
 *  ----------------------------------------------------------------------------
 *  File:       FmAbout.cs
 *  ----------------------------------------------------------------------------
 */

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Linq;
using System.Reflection;
using System.Windows.Forms;

namespace JDash.WebForms.Design
{
    partial class FmAbout : Form
    {
        DashboardLicenseManager licenceManager = null;
        public FmAbout()
        {
            InitializeComponent();
            this.labelProductName.Text = AssemblyProduct;
            this.labelVersion.Text = String.Format("Version {0}", AssemblyVersion);
            this.labelCopyright.Text = AssemblyCopyright;
            this.labelCompanyName.Text = AssemblyCompany;
            this.textBoxDescription.Text = AssemblyDescription;
        }

        #region Assembly Attribute Accessors

        public string AssemblyTitle
        {
            get
            {
                object[] attributes = Assembly.GetExecutingAssembly().GetCustomAttributes(typeof(AssemblyTitleAttribute), false);
                if (attributes.Length > 0)
                {
                    AssemblyTitleAttribute titleAttribute = (AssemblyTitleAttribute)attributes[0];
                    if (titleAttribute.Title != "")
                    {
                        return titleAttribute.Title;
                    }
                }
                return System.IO.Path.GetFileNameWithoutExtension(Assembly.GetExecutingAssembly().CodeBase);
            }
        }

        public string AssemblyVersion
        {
            get
            {
                return Assembly.GetExecutingAssembly().GetName().Version.ToString();
            }
        }

        public string AssemblyDescription
        {
            get
            {
                object[] attributes = Assembly.GetExecutingAssembly().GetCustomAttributes(typeof(AssemblyDescriptionAttribute), false);
                if (attributes.Length == 0)
                {
                    return "";
                }
                return ((AssemblyDescriptionAttribute)attributes[0]).Description;
            }
        }

        public string AssemblyProduct
        {
            get
            {
                object[] attributes = Assembly.GetExecutingAssembly().GetCustomAttributes(typeof(AssemblyProductAttribute), false);
                if (attributes.Length == 0)
                {
                    return "";
                }
                return ((AssemblyProductAttribute)attributes[0]).Product;
            }
        }

        public string AssemblyCopyright
        {
            get
            {
                object[] attributes = Assembly.GetExecutingAssembly().GetCustomAttributes(typeof(AssemblyCopyrightAttribute), false);
                if (attributes.Length == 0)
                {
                    return "";
                }
                return ((AssemblyCopyrightAttribute)attributes[0]).Copyright;
            }
        }

        public string AssemblyCompany
        {
            get
            {
                object[] attributes = Assembly.GetExecutingAssembly().GetCustomAttributes(typeof(AssemblyCompanyAttribute), false);
                if (attributes.Length == 0)
                {
                    return "";
                }
                return ((AssemblyCompanyAttribute)attributes[0]).Company;
            }
        }
        #endregion

        private void FmAbout_Load(object sender, EventArgs e)
        {

        }

        private void showLicense(License lic)
        {
            if (lic == null || lic is DemoLicense)
                textBoxDescription.Text = Environment.NewLine + "DEMO LICENSE IS USED";
            else if (lic is DashboardLicense)
            {
                DashboardLicense dlic = (DashboardLicense)lic;
                textBoxDescription.Text = textBoxDescription.Text +
                    string.Format("Registered Name: {0}\r\nPurchase Date:{1}\r\nProduct ID:{2}\r\nLicence Type: {3}\r\nLicense Key: {4}\r\n",
                    dlic.RegistrationName, dlic.PurchaseDate.ToShortDateString(), dlic.ProductID, dlic.LicenseType.ToString(),                   
                    dlic.LicenseKey);
                if (dlic.LicenseType == LicenseTypeInfo.Domain)
                    textBoxDescription.Text = textBoxDescription.Text + "Domain: " + dlic.Domain;
            }
        }

        public void Execute(ResourceManager instance)
        {
            Execute(instance.GetLicenseManager());
        }

        private void okButton_Click(object sender, EventArgs e)
        {
            licenceManager.ValidateLicenseExistence();
        }

        private void btnRegisterBuy_Click(object sender, EventArgs e)
        {
            try
            {
                if (licenceManager.IsTrial())
                {
                    Util.OpenUrl("http://www.jdash.net/purchase");                    
                }
                else
                {
                    try
                    {
                        licenceManager.RegisterProduct();
                        Close();
                    }
                    catch (Exception exc)
                    {
                        MessageBox.Show(exc.Message + " - " + exc.StackTrace);
                        //MessageBox.Show(exc.StackTrace);
                        //MessageBox.Show(exc.InnerException.Message);
                    }
                    Close();
                }
            }
            catch (Exception exc)
            {
                MessageBox.Show(exc.Message + " - " + exc.StackTrace);
            }
        }

        internal void Execute(DashboardLicenseManager dashboardLicenseManager)
        {
            licenceManager = dashboardLicenseManager;
            License lic = licenceManager.GetLicense();
            showLicense(lic);

            if (licenceManager.IsTrial())
            {
                btnRegisterBuy.Text = "Purchase a License";
                btnRegisterBuy.Visible = true;
            }
            else if (!licenceManager.RegistrationDone())
            {
                btnRegisterBuy.Text = "Register Your Product";
                btnRegisterBuy.Visible = true;
            }
            ShowDialog();
        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            Util.OpenUrl("http://www.jdash.net");
        }

        private void linkLabel2_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            Util.OpenUrl("http://forum.jdash.net");
        }

        private void linkLabel3_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            Util.OpenUrl("http://www.jdash.net/Docs/JDashNetDevelopersGuide.pdf");
        }

        private void textBoxDescription_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
