/*  ----------------------------------------------------------------------------
 *  Kalitte Professional Information Technologies
 *  ----------------------------------------------------------------------------
 *  Dynamic Dashboards
 *  ----------------------------------------------------------------------------
 *  File:       FmProvider.cs
 *  ----------------------------------------------------------------------------
 */

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Web.UI.Design;
using System.Configuration;
using System.Collections.Specialized;
using System.Data.SqlClient;
using System.Resources;
using System.Reflection;
using System.IO;
using System.Diagnostics;
using JDash.WebForms.Utils;
using JDash.Helpers;

namespace JDash.WebForms.Design
{
    public partial class FmProvider : Form
    {

        private ConfigurationSection cs = null;
        private System.Configuration.Configuration configuration = null;
        private IWebApplication application = null;
        private JDashScriptManagerDesigner SurfaceDesigner;

        public FmProvider()
        {
            InitializeComponent();
        }

        private void FmProvider_Load(object sender, EventArgs e)
        {

        }

        internal void Execute(JDashScriptManagerDesigner designer, bool auto = false)
        {
            try
            {
                ctlReopen.Visible = auto;
                this.SurfaceDesigner = designer;
                ctlProviderList.Items.Clear();
                application = designer.GetService(typeof(IWebApplication)) as IWebApplication;

                if (application != null)
                {
                    configuration = application.OpenWebConfiguration(false);
                    if (configuration != null)
                    {
                        ConfigurationSection section = configuration.Sections.Get("JDash");
                        cs = section;

                        foreach (ConnectionStringSettings item in configuration.ConnectionStrings.ConnectionStrings)

                            ctlConList.Items.Add(item.Name);


                    }
                }


                if (cs != null)
                {
                    if (cs.ElementInformation.Properties["authorizationEnabled"] != null)
                        ctlAuthorization.Checked = cs.ElementInformation.Properties["authorizationEnabled"].Value.ToString() == "true";

                    if (cs.ElementInformation.Properties["defaultProvider"] != null)
                        ctlDefaultProvider.Text = cs.ElementInformation.Properties["defaultProvider"].Value.ToString();
                    else ctlDefaultProvider.Text = "";

                    if (cs.ElementInformation.Properties["privilegedRoles"] != null && cs.ElementInformation.Properties["privilegedRoles"].Value != null)
                        ctlprivRoles.Text = cs.ElementInformation.Properties["privilegedRoles"].Value.ToString();
                    else ctlprivRoles.Text = "";

                    if (cs.ElementInformation.Properties["knownRoleProvider"] != null && cs.ElementInformation.Properties["knownRoleProvider"].Value != null)
                        ctlKnownRole.Text = cs.ElementInformation.Properties["knownRoleProvider"].Value.ToString();
                    else ctlKnownRole.Text = "";


                    if (cs.ElementInformation.Properties["roleProvider"] != null && cs.ElementInformation.Properties["roleProvider"].Value != null)
                        ctlCustomRole.Text = cs.ElementInformation.Properties["roleProvider"].Value.ToString();
                    else ctlCustomRole.Text = "";



                    var x = cs.ElementInformation.Properties["providers"].Value;
                    ProviderSettingsCollection providers = cs.ElementInformation.Properties["providers"].Value as ProviderSettingsCollection;

                    ctlProviderList.Items.Clear();
                    foreach (ProviderSettings item in providers)
                        if (item.Name != "SessionDashboardProvider")
                            ctlProviderList.Items.Add(item.Name);

                    if (providers.Count > 0)
                    {
                        ctlProviderList.SelectedIndex = 0;
                        ctlProviderList.SelectedItem = providers[0].Name;
                        showCurrentProvider();
                    }
                }
            }
            catch (Exception exc)
            {

                MessageBox.Show(exc.Message + ":" + exc.StackTrace);
            }
            ShowDialog();
        }

        private void showCurrentProvider()
        {
            if (cs == null)
                return;


            string selectedProviderName = ctlProviderList.SelectedItem.ToString();

            ProviderSettingsCollection providers = cs.ElementInformation.Properties["providers"].Value as ProviderSettingsCollection;

            ProviderSettings setings = providers[selectedProviderName];

            ctlAppName.Text = setings.Parameters["applicationName"];

            if (string.IsNullOrEmpty(ctlAppName.Text))
                ctlAppName.Text = "DashboardApp";

            ctlType.Text = setings.Type;

            string conStr = setings.Parameters["connectionString"];

            ctlConList.SelectedItem = string.Empty;
            foreach (string item in ctlConList.Items)
            {
                if (item == conStr)
                    ctlConList.SelectedItem = item;
            }
        }

        private void ctlProviderList_SelectedIndexChanged(object sender, EventArgs e)
        {
            showCurrentProvider();
        }





        private bool GetProvider(out object provider)
        {
            var sqlProv = JDash.SqlProvider.Provider.MembershipRoleProvider;
            var mySqlProv = JDash.MySqlProvider.Provider.MembershipRoleProvider;
            provider = null;
            string selectedProviderName = ctlProviderList.SelectedItem.ToString();

            ProviderSettingsCollection providers = cs.ElementInformation.Properties["providers"].Value as ProviderSettingsCollection;

            ProviderSettings setings = providers[selectedProviderName];

            Type type = null;
            switch (setings.Name.ToLowerInvariant())
            {
                case "sqldashboardprovider":
                    {
                        type = typeof(JDash.SqlProvider.Provider);
                        break;
                    }
                case "mysqldashboardprovider":
                    {
                        type = typeof(JDash.MySqlProvider.Provider);
                        break;
                    }
            }
            string typeString = setings.Type;
            if (type == null) MessageBox.Show("It seems " + typeString + " cannot be created. Please check\n1. Reference this assembly to your project\n2. rebuild your project and try again.\nCannot create instance from " + typeString);
            else
            {
                object createdInstance = Activator.CreateInstance(type);
                //provider = (DashboardProvider)createdInstance;
                //if (provider == null)
                //{
                //    MessageBox.Show("Successfully created instance but cannot cast it to a valid provider");
                //}
                provider = createdInstance;

            }
            return provider != null;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(ctlConList.Text))
                    MessageBox.Show("Please select a connection first");
                else if (MessageBox.Show("This will create meta data of JDash.Net" +
                    "Continue ?", "Confirm", MessageBoxButtons.OKCancel) == DialogResult.OK)
                {
                    ctlSave_Click(null, EventArgs.Empty);
                    string selectedProviderName = ctlProviderList.SelectedItem.ToString();

                    ProviderSettingsCollection providers = cs.ElementInformation.Properties["providers"].Value as ProviderSettingsCollection;

                    ProviderSettings setings = providers[selectedProviderName];

                    string typeString = setings.Type;

                    object provider;

                    if (GetProvider(out provider))
                    {
                        ConnectionStringSettings conn = configuration.ConnectionStrings.ConnectionStrings[ctlConList.Text];
                        if (conn == null)
                            MessageBox.Show("Please specify a valid connection.");
                        else
                        {
                            try
                            {
                                MethodInfo CreateMetadata = (from methods in provider.GetType().GetMethods(BindingFlags.Instance | BindingFlags.Public)

                                                             where methods.Name.EndsWith("CreateMetadata")

                                                             select methods).First<MethodInfo>();

                                CreateMetadata.Invoke(provider, new object[] { conn.ConnectionString, null });
                                MessageBox.Show("Metadata is created successfully");

                            }
                            catch (Exception exc)
                            {
                                MessageBox.Show(conn.ConnectionString);
                                MessageBox.Show(exc.Message);
                                if (exc.InnerException != null)
                                    MessageBox.Show(exc.InnerException.Message);

                            }
                        }
                    }
                }
            }
            catch (Exception exc)
            {
                MessageBox.Show(exc.Message + Environment.NewLine + exc.StackTrace);
            }
        }

        private void ctlSave_Click(object sender, EventArgs e)
        {
            string selectedProviderName = ctlProviderList.SelectedItem.ToString();
            ProviderSettingsCollection providers = cs.ElementInformation.Properties["providers"].Value as ProviderSettingsCollection;
            ProviderSettings provider = providers[selectedProviderName];


            if (string.IsNullOrEmpty(ctlAppName.Text))
                provider.Parameters.Remove("applicationName");
            else
                provider.Parameters["applicationName"] = ctlAppName.Text;

            if (ctlConList.SelectedItem == null)
                provider.Parameters.Remove("connectionString");
            else
                provider.Parameters["connectionString"] = ctlConList.SelectedItem == null ? null : ctlConList.SelectedItem.ToString();

            provider.Parameters.Remove("authorizationEnabled");
            provider.Parameters.Add("authorizationEnabled", ctlAuthorization.Checked.ToString().ToLowerInvariant());
            cs.SectionInformation.ForceSave = true;

            try
            {
                configuration.Save(ConfigurationSaveMode.Full);
                if (sender != null)
                    MessageBox.Show("Provider settings saved.");
            }
            catch (Exception exc)
            {
                MessageBox.Show("It seems web.config file is already opened in VS.Net. Plese close this window, close web.config file and re-open this window.\n Vs.Net Error says:" + exc.Message);
            }



        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            Close();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            try
            {
                cs.ElementInformation.Properties["authorizationEnabled"].Value = ctlAuthorization.Checked;
                cs.ElementInformation.Properties["defaultProvider"].Value = ctlDefaultProvider.Text;
                cs.ElementInformation.Properties["privilegedRoles"].Value = ctlprivRoles.Text;
                cs.ElementInformation.Properties["knownRoleProvider"].Value = ctlKnownRole.Text;
                cs.ElementInformation.Properties["roleProvider"].Value = ctlCustomRole.Text;
                cs.SectionInformation.ForceSave = true;
                ctlSave_Click(null, e);
                Close();
            }
            catch (Exception exc)
            {
                MessageBox.Show("It seems errors occured during save. Please make manual modifications inside web.config file. Error is:" + exc.Message + exc.StackTrace);
                if (exc.InnerException != null)
                    MessageBox.Show(exc.InnerException.Message);
            }


        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }



        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }



        private void ctlGetScript_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(ctlConList.Text))
                    MessageBox.Show("Please select a connection first");
                else
                {
                    ctlSave_Click(null, EventArgs.Empty);
                    object provider;
                    if (GetProvider(out provider))
                    {
                        try
                        {
                            MethodInfo getScript = (from methods in provider.GetType().GetMethods(BindingFlags.Instance | BindingFlags.Public)

                                                    where methods.Name.EndsWith("GetScript")

                                                    select methods).First<MethodInfo>();


                            string sql = getScript.Invoke(provider, new object[] { }) as string;

                            string file = Path.GetTempFileName() + ".txt";
                            File.WriteAllText(file, sql);
                            Process.Start(file);
                        }
                        catch (Exception exc)
                        {
                            MessageBox.Show(exc.Message);
                        }
                    }
                }
            }
            catch (Exception exc)
            {
                MessageBox.Show(exc.Message + Environment.NewLine + exc.StackTrace);
            }
        }




        private void linkLabel2_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            Util.OpenUrl("http://www.jdash.net/Docs/JDashNetDevelopersGuide.pdf");
        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            Util.OpenUrl("http://www.jdash.net/demo?id=475");
        }

        private void linkLabel3_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            var accessUrl = WebDevServerUtils.StartWebDev(SettingUtils.GetManagementFolder(), null, "JDash");
            System.Diagnostics.Process.Start(accessUrl);
        }


    }
}
