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
using JDash.Configuration;
using System.Xml;
using System.Web.Configuration;

using JDash.Package.Utils;
using JDash.Mvc.Core;

namespace JDash.WebForms.Design
{
    public partial class FmProvider : Form
    {

        private ConfigurationSection cs = null;
        public System.Configuration.Configuration configuration = null;
        public EnvDTE.Project vsProject;

        public FmProvider()
        {
            InitializeComponent();
            AppDomain.CurrentDomain.AssemblyResolve += CurrentDomain_AssemblyResolve;
        }



        private void FmProvider_Load(object sender, EventArgs e)
        {


            try
            {
                //ctlReopen.Visible = auto;
                //this.SurfaceDesigner = designer;
                ctlProviderList.Items.Clear();
                if (configuration != null)
                {
                    foreach (ConnectionStringSettings item in configuration.ConnectionStrings.ConnectionStrings)

                        ctlConList.Items.Add(item.Name);



                    ConfigurationSection section = configuration.Sections.Get("JDash");
                    cs = section;

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
                if (exc.InnerException is System.IO.FileNotFoundException)
                    MessageBox.Show("Unable to load JDash assemblies. Please add a reference to JDash.dll, build your project and re-open this window");
                else MessageBox.Show(exc.Message + ":" + exc.StackTrace);
            }
            // ShowDialog();
        }

        Assembly CurrentDomain_AssemblyResolve(object sender, ResolveEventArgs args)
        {
            if (args.Name.ToLowerInvariant().StartsWith("jdash"))
            {
                var path = Path.GetDirectoryName(configuration.FilePath);

                var assName = args.Name.Split(',')[0] + ".dll";

                var outPath = Path.Combine(vsProject.ConfigurationManager.ActiveConfiguration.Properties.Item("OutputPath").Value.ToString(), assName);

                var assPath = Path.Combine(path, outPath);
                try
                {
                    var jdashass = Assembly.LoadFrom(assPath);
                    return jdashass;
                }
                catch (Exception)
                {

                    OpenFileDialog of = new OpenFileDialog();
                    of.Filter = "DLL|*.dll";
                    of.Title = "Locate " + assName;
                    if (of.ShowDialog() == System.Windows.Forms.DialogResult.OK)
                    {
                        try
                        {
                            var jdashass = Assembly.LoadFrom(of.FileName);
                            return jdashass;
                        }
                        catch
                        {
                            return null;
                        }
                    }
                    else return null;
                }


            }
            else return args.RequestingAssembly;
        }



        private static void AddHttpHandler(System.Configuration.Configuration configuration)
        {

            HttpHandlersSection section = (HttpHandlersSection)configuration.GetSection("system.web/httpHandlers");
            if (section == null)
            {
                section = new HttpHandlersSection();
                ConfigurationSectionGroup group =
                    configuration.GetSectionGroup("system.web");
                if (group == null)
                {
                    configuration.SectionGroups.Add("system.web",
                        new ConfigurationSectionGroup());
                }
                group.Sections.Add("httpHandlers", section);
            }
            if (section != null)
            {
                bool flag = false;
                foreach (HttpHandlerAction action in section.Handlers)
                {
                    if (action.Type.StartsWith(typeof(NlsHandler).FullName))
                    {
                        flag = true;
                        break;
                    }
                }
                if (!flag)
                {
                    HttpHandlerAction httpHandlerAction = new HttpHandlerAction("nls/*.js", typeof(NlsHandler).FullName + ",JDash.Mvc", "GET", false);
                    section.Handlers.Add(httpHandlerAction);
                    try
                    {
                        configuration.Save(ConfigurationSaveMode.Modified);
                    }
                    catch (Exception exc)
                    {
                        ShowWebConfigSaveErrorMessage(exc);
                    }
                }


            }


        }


        private static string getDefaultWebServerSection()
        {
            return "<system.webServer>" + Environment.NewLine +
                   "<handlers />" + Environment.NewLine +
                   "<modules />" + Environment.NewLine +
                   "</system.webServer>";
        }

        private static void AppendAttributeNode(XmlDocument xmlDocument, XmlNode xmlNode, string name, string value)
        {
            XmlAttribute node = xmlDocument.CreateAttribute(name);
            node.Value = value;
            xmlNode.Attributes.Append(node);
        }
        public static void ShowWebConfigSaveErrorMessage(Exception exc)
        {
            MessageBox.Show("It seems web.config file is already opened in VS.Net. Plese close this window, close web.config file and re-open this window.\n Vs.Net Error says:" + exc.Message);
        }



        private static void AddIIS7Handler(System.Configuration.Configuration configuration)
        {
            
            ConfigurationSection section2 = configuration.GetSection("system.webServer");
            if (section2 == null)
            {
                
                
            }
            if ((section2 != null) && (section2.SectionInformation != null))
            {
                string rawXml = section2.SectionInformation.GetRawXml();
                XmlDocument xmlDocument = new XmlDocument();
                XmlDocumentFragment fragment = xmlDocument.CreateDocumentFragment();
                if (string.IsNullOrEmpty(rawXml))
                    rawXml = getDefaultWebServerSection();

                //var serverSection = xmlDocument.CreateNode(XmlNodeType.Element, "system.webServer", "");
                var serverSection = xmlDocument.SelectSingleNode("system.webServer");
                if (serverSection == null)
                {
                    serverSection = xmlDocument.CreateNode(XmlNodeType.Element, "system.webServer", "");
                    fragment.AppendChild(serverSection);
                }

                XmlNode modulesNode = fragment.SelectSingleNode("system.webServer/modules");

                if (modulesNode == null)
                {
                    var mnode = xmlDocument.CreateNode(XmlNodeType.Element, "modules", "");
                    var mattr = xmlDocument.CreateAttribute("runAllManagedModulesForAllRequests");
                    mattr.Value = "true";
                    mnode.Attributes.Append(mattr);
                    serverSection.AppendChild(mnode);
                }
                else
                {
                    var attr = modulesNode.Attributes["runAllManagedModulesForAllRequests"];
                    if (attr == null)
                    {
                        attr = xmlDocument.CreateAttribute("runAllManagedModulesForAllRequests");
                        attr.Value = "true";
                        modulesNode.Attributes.Append(attr);
                    }
                    else
                    {
                        attr.Value = "true";
                    }
                }

                XmlNode node = fragment.SelectSingleNode("system.webServer/handlers");
                if (node == null)
                {

                    node = xmlDocument.CreateNode(XmlNodeType.Element, "handlers", "");
                    serverSection.AppendChild(node);

                }
                if ((node != null) && (node.SelectSingleNode("add[@type=\"" + typeof(NlsHandler).FullName + ",JDash.Mvc" + "\"]") == null))
                {

                    if (node.SelectSingleNode("remove[@name=\"JDashNlsHandler\"]") == null)
                    {
                        XmlNode node2 = xmlDocument.CreateElement("remove");
                        AppendAttributeNode(xmlDocument, node2, "name", "JDashNlsHandler");
                        XmlNode refChild = node.SelectSingleNode("add[1]");
                        if (refChild != null)
                        {
                            node.InsertBefore(node2, refChild);
                        }
                        else
                        {
                            node.AppendChild(node2);
                        }
                    }

                    XmlNode oldChild = node.SelectSingleNode("add[@name=\"JDashNlsHandler\"]");

                    if (oldChild != null)
                    {
                        node.RemoveChild(oldChild);
                    }
                    XmlNode xmlNode = xmlDocument.CreateElement("add");
                    AppendAttributeNode(xmlDocument, xmlNode, "name", "JDashNlsHandler");
                    AppendAttributeNode(xmlDocument, xmlNode, "verb", "GET");
                    AppendAttributeNode(xmlDocument, xmlNode, "path", "nls/*.js");
                    AppendAttributeNode(xmlDocument, xmlNode, "type", typeof(NlsHandler).FullName + ",JDash.Mvc");
                    node.AppendChild(xmlNode);
                    section2.SectionInformation.SetRawXml(fragment.InnerXml);
                    try
                    {
                        configuration.Save(ConfigurationSaveMode.Modified);
                    }
                    catch (Exception exc)
                    {
                        ShowWebConfigSaveErrorMessage(exc);
                    }
                }

            }
        }

        private static void AddConfigSections(System.Configuration.Configuration configuration)
        {
            ConfigurationSection section = null;

            if (configuration != null)
            {
                try
                {
                    section = configuration.Sections.Get("JDash");

                    if (section == null)
                    {
                        DashboardSettingsSection cs = new DashboardSettingsSection();
                        cs.DefaultProvider = "SQLDashboardProvider";
                        cs.AuthorizationEnabled = false;
                        cs.PrivilegedRoles = "";
                        ProviderSettings sql = new ProviderSettings("SQLDashboardProvider", "JDash.SqlProvider.Provider, JDash.SqlProvider");
                        cs.Providers.Add(sql);
                        //ProviderSettings mysql = new ProviderSettings("MySQLDashboardProvider", "JDash.MySqlProvider.Provider, JDash.MySqlProvider");
                        //cs.Providers.Add(mysql);

                        configuration.Sections.Add("JDash", cs);
                        var vsVersion = WebDevServerUtils.GetCurrentVS();
                        if (vsVersion.Key != VSVersion.VS2013)
                        {
                            if (MessageBox.Show("If you are using old Asp.Net Development Server instead of IIS Express for debugging purposes, system.web/httpHandlers will be added to web.config file.\n" + "Using Asp.Net Development Server ?", "Confirm",  MessageBoxButtons.YesNo) == DialogResult.Yes)
                                AddHttpHandler(configuration);
                        }

                        AddIIS7Handler(configuration);

                        try
                        {
                            configuration.Save(ConfigurationSaveMode.Modified);
                            MessageBox.Show("JDash configuration created successfully for web.config file.");
                        }
                        catch (Exception exc)
                        {
                            MessageBox.Show("It seems web.config file is already opened in VS.Net. Plese close this window, close web.config file and re-open this window.\n Vs.Net Error says:" + exc.Message);
                            throw;
                        }
                    }

                }
                catch (Exception)
                {


                }



            }

        }

        internal static void createConfigItems(System.Configuration.Configuration configuration)
        {
            if (configuration != null)
            {
                AddConfigSections(configuration);
                var ide = WebDevServerUtils.GetCurrentVS();
                //if (ide.Key != VSVersion.VS2012 && ide.Key != VSVersion.VS2013)
                //    AddHttpHandler(configuration);
                //AddIIS7Handler(configuration);
            }
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
            if (type == null)
            {


                try
                {
                    type = Type.GetType(typeString);
                }
                catch (Exception exc)
                {
                    MessageBox.Show(exc.Message + ":" + exc.StackTrace);
                }
            }
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

        public static void OpenUrl(string url)
        {

            System.Diagnostics.Process proc = new System.Diagnostics.Process();

            System.Diagnostics.ProcessStartInfo startInfo = new System.Diagnostics.ProcessStartInfo(url);

            proc.StartInfo = startInfo;

            proc.Start();
        }


        private void linkLabel2_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            OpenUrl("http://www.jdash.net/Docs/JDashNetMvcDevelopersGuide.pdf");
        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            OpenUrl("http://www.jdash.net/demo?id=475");
        }

        private void linkLabel3_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            //var accessUrl = WebDevServerUtils.StartWebDev(SettingUtils.GetManagementFolder(), null, "JDash");
            //System.Diagnostics.Process.Start(accessUrl);
        }

        private void FmProvider_FormClosed(object sender, FormClosedEventArgs e)
        {

        }

        private void ctlType_Click(object sender, EventArgs e)
        {

        }


    }
}
