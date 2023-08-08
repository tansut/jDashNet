using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.Design.WebControls;
using System.Web.UI.Design;
using System.Web.Configuration;
using System.Configuration;
using System.Windows.Forms;
using System.ComponentModel.Design;
using System.Xml;
using JDash.Configuration;
using System.IO;
using Microsoft.Win32;
using JDash.WebForms.Utils;
using System.Web.UI.HtmlControls;
using System.Web.UI;
using System.Diagnostics;
using EnvDTE;
using System.ComponentModel;
using JDash.Helpers;
using System.Web;

namespace JDash.WebForms.Design
{
    public class JDashScriptManagerDesigner : ControlDesigner
    {
        private static bool configurationChecked = false;

        DesignerVerbCollection verbs = new DesignerVerbCollection();

        internal new object GetService(Type serviceType)
        {
            return base.GetService(serviceType);
        }

        private void AddPageControls()
        {
            IWebApplication service = this.GetService(typeof(IWebApplication)) as IWebApplication;
            if (service != null)
            {
                System.Configuration.Configuration configuration = service.OpenWebConfiguration(false);
                if (configuration != null)
                {
                    PagesSection section = (PagesSection)configuration.GetSection("system.web/pages");
                    if (section == null)
                    {
                        ConfigurationSectionGroup sysWebSection = configuration.GetSectionGroup("system.web");
                        if (sysWebSection == null)
                        {
                            configuration.SectionGroups.Add("system.web",new ConfigurationSectionGroup());
                        }
                        sysWebSection.Sections.Add("pages", section);
                    }
                    bool exists = false;
                    foreach (TagPrefixInfo item in section.Controls)
                    {
                        if (item.TagPrefix == "jdash")
                            exists = true;
                    }
                    if (!exists)
                        section.Controls.Add(new TagPrefixInfo("jdash", "JDash.WebForms", "JDash.WebForms", null, null));
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


        private void AddConfigSections()
        {
            IWebApplication service = this.GetService(typeof(IWebApplication)) as IWebApplication;
            ConfigurationSection section = null;
            if (service != null)
            {
                System.Configuration.Configuration configuration = service.OpenWebConfiguration(false);
                if (configuration != null)
                {
                    section = configuration.Sections.Get("JDash");
                    if (section == null)
                    {
                        DashboardSettingsSection cs = new DashboardSettingsSection();
                        cs.DefaultProvider = "SQLDashboardProvider";
                        cs.AuthorizationEnabled = false;
                        cs.PrivilegedRoles = "";

                        ProviderSettings sql = new ProviderSettings("SQLDashboardProvider", "JDash.SqlProvider.Provider, JDash.SqlProvider, Culture=neutral, PublicKeyToken=b5fa106e3affb7e3");
                        cs.Providers.Add(sql);
                        configuration.Sections.Add("JDash", cs);
                        try
                        {
                            configuration.Save(ConfigurationSaveMode.Modified);
                        }
                        catch (Exception exc)
                        {
                            ShowWebConfigSaveErrorMessage(exc);
                        }
                        new FmProvider().Execute(this, true);
                    }

                }
            }
        }

        public override void Initialize(System.ComponentModel.IComponent component)
        {
            base.Initialize(component);
            if (!configurationChecked)
            {
                try
                {

                    var ide = WebDevServerUtils.GetCurrentVS();
                    AddConfigSections();
                    AddPageControls();
                    if (ide.Key != VSVersion.VS2012 && ide.Key != VSVersion.VS2013)
                        AddHttpHandler();
                    AddIIS7Handler();
                    configurationChecked = true;

                }
                catch (Exception exc)
                {
                    MessageBox.Show("Errors adding configuration section items. " + exc.Message + Environment.NewLine + "Please add web.config sections manually." + exc.StackTrace);
                }
            }
            verbs.Clear();
            verbs.Add(new DesignerVerb("JDash Settings", new EventHandler(OnVerb)));
            verbs.Add(new DesignerVerb("Management Portal", new EventHandler(OnVerb)));
            verbs.Add(new DesignerVerb("About", new EventHandler(OnVerb)));
            new DashboardLicenseManager(typeof(ResourceManager), component).IsDesignTimeLicenseValid();
        }

        private static void AppendAttributeNode(XmlDocument xmlDocument, XmlNode xmlNode, string name, string value)
        {
            XmlAttribute node = xmlDocument.CreateAttribute(name);
            node.Value = value;
            xmlNode.Attributes.Append(node);
        }



        protected void OnVerb(object sender, EventArgs e)
        {

            DesignerVerb verb = sender as DesignerVerb;
            if (verb.Text == "JDash Settings")
            {
                new FmProvider().Execute(this);
            }
            else if (verb.Text == "Management Portal")
            {

                try
                {
                    var projectPath = "";
                    IWebApplication service = this.GetService(typeof(IWebApplication)) as IWebApplication;
                    if (service != null)
                    {
                        IProjectItem pItem = service.GetProjectItemFromUrl("");
                        projectPath = pItem.PhysicalPath;
                    }
                    //MessageBox.Show(projectPath);
                    var url = WebDevServerUtils.StartWebDev(SettingUtils.GetManagementFolder(projectPath), null,"");
                    //MessageBox.Show(accessUrl);
                    var queryString = string.Format("applicationPath={0}", HttpUtility.UrlEncode(projectPath));

                    var accessUrl = url + "?" + queryString;
                    var startInfo = new ProcessStartInfo("IExplore.exe", accessUrl);
                    System.Diagnostics.Process.Start(startInfo);
                }
                catch (Exception ee)
                {
                    MessageBox.Show(ee.Message + ee.StackTrace);
                }
            }
            else if (verb.Text == "About")
            {
                new FmAbout().Execute((ResourceManager)base.Component);
            }
        }

        public void ShowWebConfigSaveErrorMessage(Exception exc)
        {
            MessageBox.Show("It seems web.config file is already opened in VS.Net. Plese close this window, close web.config file and re-open this window.\n Vs.Net Error says:" + exc.Message);
        }

        private void AddHttpHandler()
        {

            IWebApplication service = this.GetService(typeof(IWebApplication)) as IWebApplication;
            if (service != null)
            {
                System.Configuration.Configuration configuration = service.OpenWebConfiguration(false);
                if (configuration != null)
                {
                    #region HttpHandler
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
                            if (action.Type == typeof(NlsHandler).FullName)
                            {
                                flag = true;
                                break;
                            }
                        }
                        if (!flag)
                        {
                            HttpHandlerAction httpHandlerAction = new HttpHandlerAction("nls/*.js", typeof(NlsHandler).FullName, "GET", false);
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

                    #endregion

                }


            }
        }

        private string getDefaultWebServerSection()
        {
            return "<system.webServer>" + Environment.NewLine +
                   "<handlers />" + Environment.NewLine +
                   "<modules />" + Environment.NewLine +
                   "</system.webServer>";
        }

        private void AddIIS7Handler()
        {
            IWebApplication service = this.GetService(typeof(IWebApplication)) as IWebApplication;
            if (service != null)
            {
                System.Configuration.Configuration configuration = service.OpenWebConfiguration(false);
                if (configuration != null)
                {

                    ConfigurationSection section2 = configuration.GetSection("system.webServer");
                    if ((section2 != null) && (section2.SectionInformation != null))
                    {
                        string rawXml = section2.SectionInformation.GetRawXml();
                        XmlDocument xmlDocument = new XmlDocument();
                        XmlDocumentFragment fragment = xmlDocument.CreateDocumentFragment();
                        if (string.IsNullOrEmpty(rawXml))
                            rawXml = getDefaultWebServerSection();

                        XmlNode node = fragment.SelectSingleNode("system.webServer/handlers");
                        if (node == null)
                        {
                            var serverSection = xmlDocument.CreateNode(XmlNodeType.Element, "system.webServer", "");

                            node = xmlDocument.CreateNode(XmlNodeType.Element, "handlers", "");
                            serverSection.AppendChild(node);
                            fragment.AppendChild(serverSection);
                        }
                        if ((node != null) && (node.SelectSingleNode("add[@type=\"" + typeof(NlsHandler).AssemblyQualifiedName + "\"]") == null))
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
                            AppendAttributeNode(xmlDocument, xmlNode, "type", typeof(NlsHandler).AssemblyQualifiedName);
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

            }
        }

        public override DesignerVerbCollection Verbs
        {
            get
            { return verbs; }
        }
    }
}
