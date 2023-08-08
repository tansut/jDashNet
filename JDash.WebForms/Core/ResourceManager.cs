using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.ComponentModel;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using JDash.WebForms.Design;
using JDash.WebForms.Utils;
using JDash.Helpers;
using System.Drawing;

namespace JDash.WebForms
{



    public class ClientConfigEventArgs : EventArgs
    {
        public Dictionary<string, string> Config { get; private set; }

        internal ClientConfigEventArgs(Dictionary<string, string> config)
        {
            this.Config = config;
        }

        internal static string ToJs(Dictionary<string, string> config)
        {
            StringBuilder sb = new StringBuilder();
            foreach(KeyValuePair<string, string> entry in config) {
                sb.Append(string.Format("{0}:  {1},", entry.Key, entry.Value));
            }
            if (sb.Length > 0)
                sb.Remove(sb.Length -1, 1);
            return sb.ToString();
        }
    }


    /// <summary>
    /// Base resource manager control. Every Asp.Net page should contain only one instance of ResourceManager control. 
    /// </summary>
    [Designer(typeof(JDashScriptManagerDesigner)), ParseChildren(true), LicenseProvider(typeof(DashboardLicenseProvider)), ToolboxBitmap(typeof(ResourceManager), "resources.toolboxIcons.resourceManager.bmp")]
    public sealed class ResourceManager : JControl, IPostBackEventHandler, IJPostBackDataHandler
    {
        private const string OnReadyTemplate = "require(['jdash/wf/wf-main', 'klt/domReady!'], function(jdash) {{ {1} jdash.when(jdash.ResMngr.initCompleted(), function() {{ try {{ {0} }} catch(e) {{ console.log('Error: ' + e.stack); }} }})    }})";
        private const string OnReadyTemplateWithoutInit = "require(['jdash/wf/wf-main', 'klt/domReady!'], function(jdash) {{ {0} }})";
        private const string SimpleScriptBlockTemplate = "<script type=\"text/javascript\">{0}</script>";
        private const string ScriptBlockTemplate = "\t<script type=\"text/javascript\">\n\t//<![CDATA[\n\t\t{0}\n\t//]]>\n\t</script>\n";
        private DashboardLicenseManager licenseManager = null;

        public event EventHandler<ClientConfigEventArgs> PrepareClientConfig;
        private List<ThemeInfo> customThemes;
        

        public ResourceManager()
        {
            licenseManager = new DashboardLicenseManager(typeof(ResourceManager), this);
            licenseManager.ValidateLicenseExistence();
            this.LoadPersistedTheme = true;
            this.ClientRoot = "jdash";
        }

        public override void Dispose()
        {
            base.Dispose();
            licenseManager.Dispose();
        }


        /// <summary>
        /// If set true JDash.Net automatically loads persisted theme if available.
        /// Theme data is saved on client side using cookies.
        /// </summary>
        [Category("JDash")]
        public bool LoadPersistedTheme { get; set; }

        /// <summary>
        /// Set a value to load a specified theme before initialization of client side.
        /// </summary>
        [Category("JDash")]
        public string InitialThemeId { get; set; }

        /// <summary>
        /// Set a value to load a specified theme style id before initialization of client side.
        /// </summary>
        [Category("JDash")]
        public string InitialThemeStyleId { get; set; }

        /// <summary>
        /// Set a value for default client root directory. See Developers Guide for more information about client modules.
        /// </summary>
        [Category("JDash")]
        public string ClientRoot { get; set; }

        //public bool SkipIconsLibrary { get; set; }


        protected override string InstanceFuncTemplate
        {
            get
            {
                return "jdash.ResMngr.init({0});";
            }
        }

        protected override void getClientProperties(Dictionary<string, object> dict)
        {
            if (!DesignMode)
            {
                var resourceOverrides = new Dictionary<string, string>();
                resourceOverrides.Add("/resources/themes/default/main.css", Page.ClientScript.GetWebResourceUrl(typeof(ResourceManager), "JDash.WebForms.resources.themes.default.main-embedded.css"));
                resourceOverrides.Add("/resources/themes/flat/main.css", Page.ClientScript.GetWebResourceUrl(typeof(ResourceManager), "JDash.WebForms.resources.themes.flat.main-embedded.css"));
                resourceOverrides.Add("/resources/css/layout/builtin.css", Page.ClientScript.GetWebResourceUrl(typeof(ResourceManager), "JDash.WebForms.resources.css.layout.builtin-embedded.css"));
                dict.Add("resourceOverrides", resourceOverrides);
                dict.Add("id", this.ClientWidgetID);
                dict.Add("loadPersistedTheme", getClientValue(LoadPersistedTheme));
                dict.Add("initialThemeId", getClientValue(InitialThemeId));
                dict.Add("initialThemeStyleId", getClientValue(InitialThemeStyleId));
                dict.Add("jsModuleLocation", getClientValue(ClientRoot));
                if (this.customThemes != null && customThemes.Count > 0)
                {
                    var list = customThemes.Select(p => new KeyValuePair<string, dynamic>(p.Name, new { defaultStyle = p.DefaultStyle, css = p.CssPath, styles = p.Styles }));
                    dict.Add("customThemes", list);
                }
            }
        }

        protected internal override string GetClientConstructor()
        {
            return null;
        }

        /// <summary>
        /// Registers a new theme.
        /// </summary>
        public void RegisterTheme(ThemeInfo theme)
        {
            if (this.customThemes == null)
                this.customThemes = new List<ThemeInfo>();
            this.customThemes.Add(theme);
        }

        /// <summary>
        /// Returns a list of themes available.
        /// </summary>
        [Browsable(false)]
        public List<ThemeInfo> Themes
        {
            get
            {
                var list = new List<ThemeInfo>();
                var defaultTheme = new ThemeInfo("default", "");
                var styles = new Dictionary<string, ThemeStyleInfo>()
                {
                    {"a", new ThemeStyleInfo("Black", "#242424") },
                    {"b", new ThemeStyleInfo("Blue", "#5B92C1") },
                    {"c", new ThemeStyleInfo("Default", "#E3E3E3") },
                   
                    {"d", new ThemeStyleInfo("LightGray", "#E3E3E3") },
                    {"e", new ThemeStyleInfo("Gray", "#b5bdc8") },
                    {"f", new ThemeStyleInfo("Yellow", "#8fc400")},
                };
                defaultTheme.Styles = styles;

                var flatTheme = new ThemeInfo("flat", "") ;
                flatTheme.Styles = new Dictionary<string, ThemeStyleInfo>()
                {
                    {"a", new ThemeStyleInfo("White", "#fff")},
                    {"b", new ThemeStyleInfo("Black", "#000")}
                };
                list.Add(defaultTheme);
                list.Add(flatTheme);
                return list;
            }
        }

        /// <summary>
        /// Changes the theme used by JDash.Net.
        /// </summary>
        /// <param name="themeId">Id of theme</param>
        /// <param name="styleId">Id of theme style</param>
        /// <param name="persistSelection">Set true if you want selected theme to be persisted on client side using cookies.</param>
        public void ChangeTheme(string themeId, string styleId, bool persistSelection = true)
        {
            AddScript(string.Format("jdash.ThemeManager.select('{0}', '{1}', null, {2});", themeId, styleId, persistSelection.ToString().ToLowerInvariant()));
        }

        /// <summary>
        /// Removes persisted theme information on client side.
        /// </summary>
        public void ClearPersistedTheme()
        {
            AddScript("jdash.ThemeManager.clearCookie();");
        }

        /// <summary>
        /// Persists current theme on client side using cookies.
        /// </summary>
        public void PersistTheme()
        {
            AddScript("jdash.ThemeManager.saveToCookie();");
        }




        private readonly SortedList<long, string> scriptOnReadyBag = new SortedList<long, string>();
        List<string> updatePanelIDsToRefresh = null;
        List<Control> updatePanelsToRefresh = null;

        protected internal string BuildScriptBlock()
        {
            return this.BuildScriptBlock(true);
        }

        protected internal string BuildScriptBlock(bool withFunctionTemplate)
        {
            if (this.DesignMode)
            {
                return "";
            }

            StringBuilder source = new StringBuilder(256);
            StringBuilder onready = new StringBuilder(256);

            bool isAsync = RequestManager.IsMicrosoftAjaxRequest;

            if (this.ScriptClientInitBag.Count > 0)
            {
                foreach (KeyValuePair<string, string> item in this.ScriptClientInitBag)
                {
                    onready.Append(item.Value);
                }
            }

            foreach (KeyValuePair<long, string> script in this.ScriptOnReadyBag)
            {
                onready.Append(script.Value);
            }



            source.AppendFormat(ResourceManager.OnReadyTemplate, onready.Replace("</script>", "<\\/script>"), this.initResMngrScript);

            return withFunctionTemplate ? string.Format(isAsync ? ResourceManager.SimpleScriptBlockTemplate : ResourceManager.ScriptBlockTemplate, source.ToString()) : source.ToString();
        }

        private readonly StringBuilder scriptBuilder = new StringBuilder(256);

        internal SortedList<long, string> ScriptOnReadyBag
        {
            get
            {
                return this.scriptOnReadyBag;
            }
        }

        private static long proxyScriptNumber;
        internal static long ScriptOrderNumber
        {
            get
            {
                return System.Threading.Interlocked.Increment(ref proxyScriptNumber);
            }
        }

        internal void RegisterOnReadyScript(long orderNumber, string script)
        {
            if (!string.IsNullOrEmpty(script))
            {
                this.scriptOnReadyBag.Add(orderNumber, script);
            }
        }

        private InsertOrderedDictionary<string, string> scriptClientInitBag = new InsertOrderedDictionary<string, string>();

        internal bool IsClientInitScriptRegistered(string key)
        {
            return this.scriptClientInitBag.ContainsKey(key);
        }

        internal InsertOrderedDictionary<string, string> ScriptClientInitBag
        {
            get
            {
                return this.scriptClientInitBag;
            }
        }

        internal void RegisterClientInitScript(string key, string script)
        {
            if (!this.IsClientInitScriptRegistered(key))
            {
                this.scriptClientInitBag.Add(key, script);
            }
        }

        private void SetIsLast()
        {
            List<JControl> widgets = ControlUtils.FindControls<JControl>(this.Page);

            if (widgets.Count > 0)
            {
                int i = widgets.Count - 1;
                JControl final = widgets[i--];

                while ((!final.Visible) && i >= 0)
                {
                    final = widgets[i--];
                }

                if (!final.Visible)
                {
                    return;
                }

                if (final.HasControls())
                {
                    // Might have to drill down and find last WebControl in the chain.
                }

                final.IsLast = true;
            }

            //if (HttpContext.Current != null)
            //{
            //    HttpContext.Current.Items[ResourceManager.FilterMarker] = true;
            //}
        }

        internal List<string> UpdatePanelIDsToRefresh
        {
            get
            {
                if (this.updatePanelIDsToRefresh == null)
                {
                    this.updatePanelIDsToRefresh = new List<string>();
                }

                return this.updatePanelIDsToRefresh;
            }
        }

        Control triggerUpdatePanel = null;


        internal Control TriggerUpdatePanel
        {
            get
            {
                return this.triggerUpdatePanel;
            }
        }

        string triggerUpdatePanelID = "";

        public string TriggerUpdatePanelID
        {
            get
            {
                return this.triggerUpdatePanelID;
            }
        }

        internal List<Control> UpdatePanelsToRefresh
        {
            get
            {
                if (this.updatePanelsToRefresh == null)
                {
                    this.updatePanelsToRefresh = new List<Control>();
                }

                return this.updatePanelsToRefresh;
            }
        }

        List<Control> allUpdatePanels = null;

        internal List<Control> AllUpdatePanels
        {
            get
            {
                if (this.allUpdatePanels == null)
                {
                    this.allUpdatePanels = ControlUtils.FindControls<Control>(this.Page, "System.Web.UI.UpdatePanel", false);
                }

                return this.allUpdatePanels;
            }
        }

        /// <summary>
        /// Adds an updatepanel to the list of updatepanels which should be updated.
        /// </summary>
        /// <param name="updatePanel">UpdatePanel instance to add.</param>
        public void AddUpdatePanelToRefresh(Control updatePanel)
        {
            if (ReflectionUtils.IsTypeOf(updatePanel, "System.Web.UI.UpdatePanel", false))
            {
                if (!this.UpdatePanelIDsToRefresh.Contains(updatePanel.UniqueID))
                {
                    this.UpdatePanelsToRefresh.Add(updatePanel);
                    this.UpdatePanelIDsToRefresh.Add(updatePanel.UniqueID);
                }
            }
        }

        internal void RemoveUpdatePanelToRefresh(Control updatePanel)
        {
            if (ReflectionUtils.IsTypeOf(updatePanel, "System.Web.UI.UpdatePanel", false))
            {
                if (this.UpdatePanelIDsToRefresh.Contains(updatePanel.UniqueID))
                {
                    this.UpdatePanelsToRefresh.Remove(updatePanel);
                    this.UpdatePanelIDsToRefresh.Remove(updatePanel.UniqueID);
                }
            }
        }

        private void SetUpdatePanels(Control updatePanel)
        {
            this.triggerUpdatePanel = updatePanel;

            if (this.TriggerUpdatePanel != null)
            {
                this.AddUpdatePanelToRefresh(this.triggerUpdatePanel);

                foreach (Control control in this.AllUpdatePanels)
                {
                    if (!control.UniqueID.Equals(this.TriggerUpdatePanel.UniqueID))
                    {
                        PropertyInfo updateMode = control.GetType().GetProperty("UpdateMode");
                        string mode = updateMode.GetValue(control, null).ToString();

                        if (mode.Equals("Always") || ControlUtils.IsChildOfParent(this.TriggerUpdatePanel, control))
                        {
                            this.AddUpdatePanelToRefresh(control);
                        }
                    }
                }
            }
        }

        private bool hasLoadPostData = false;

        /// <summary>
        /// 
        /// </summary>
        protected bool HasLoadPostData
        {
            get
            {
                return this.hasLoadPostData;
            }
            set
            {
                this.hasLoadPostData = value;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        bool IJPostBackDataHandler.HasLoadPostData
        {
            get
            {
                return this.HasLoadPostData;
            }
            set
            {
                this.HasLoadPostData = value;
            }
        }

        public void RaisePostBackEvent(string eventArgument)
        {

        }

        private string initResMngrScript;


        internal void RenderAction(HtmlTextWriter writer)
        {
            if (this.DesignMode)
            {
                //writer.Write(this.BuildStyles().ConcatWith(this.BuildStyleBlock()));
                return;
            }

            if (!Page.IsPostBack)
            {
                getClientProperties(this.ClientProperties);
                var initScript = string.Format(InstanceFuncTemplate, SerializationUtils.Serialize(ClientProperties));
                bool isAsync = RequestManager.IsMicrosoftAjaxRequest;
                initResMngrScript = initScript;
            }

            if (!this.DesignMode)
            {
                this.AddScript("{0}_ScriptBlock".FormatWith(this.ClientID), this.BuildScriptBlock());
            }

            this.Page.ClientScript.RegisterForEventValidation(this.UniqueID);
        }

        private Control microsoftScriptManager = null;

        private Control MicrosoftScriptManager
        {
            get
            {
                if (this.microsoftScriptManager == null)
                {
                    this.microsoftScriptManager = ControlUtils.FindControlByTypeName(this, "System.Web.UI.ScriptManager");
                }

                return this.microsoftScriptManager;
            }
        }

        internal void AddScriptItem(string key, string value, bool addToStart)
        {
            this.AddItem(scriptBuilder, key, value, addToStart);
        }

        internal void AddItem(StringBuilder builder, string key, string value, bool addToStart)
        {
            if (!RequestManager.IsMicrosoftAjaxRequest)
            {
                if (builder != null)
                {
                    if (addToStart)
                    {
                        builder.Insert(0, value);
                    }
                    else
                    {
                        builder.Append(value);
                    }
                }
                else
                {
                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), key, value, false);
                }
            }
        }

        private void AddScript(string key, string value)
        {
            if (string.IsNullOrEmpty(value))
            {
                return;
            }

            Control sm = this.MicrosoftScriptManager;

            if (sm != null && RequestManager.IsMicrosoftAjaxRequest)
            {
                Type t = sm.GetType();

                if (sm.GetType().FullName.Contains("ToolkitScriptManager"))
                {
                    t = sm.GetType().BaseType;
                }

                try
                {
                    Type[] types = { typeof(Control), typeof(Type), typeof(string), typeof(string), typeof(bool) };
                    MethodInfo m = t.GetMethod("RegisterStartupScript", types);

                    object[] args = { this.Page, this.Page.GetType(), key, value, false };
                    m.Invoke(sm, args);
                }
                catch
                {
                    // HACK: Swallow the Exception
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.Page.GetType(), key, value, false);
                //this.AddScriptItem(key, value, false);
            }
        }




        bool IPostBackDataHandler.LoadPostData(string postDataKey, NameValueCollection postCollection)
        {
            this.HasLoadPostData = true;

            if (RequestManager.IsMicrosoftAjaxRequest && this.MicrosoftScriptManager != null)
            {
                this.triggerUpdatePanelID = StringHelper.LeftOf(postCollection[this.MicrosoftScriptManager.UniqueID], '|');

                this.SetUpdatePanels(ControlUtils.FindControl(this.Page.Form, this.TriggerUpdatePanelID));
            }

            return false;
        }

        void IPostBackDataHandler.RaisePostDataChangedEvent() { }

        protected override void Render(HtmlTextWriter writer)
        {
            if (!DesignMode)
            {
                SetIsLast();
            }
            base.Render(writer);
        }


        protected override void HtmlRender(HtmlTextWriter writer)
        {

        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            if (!this.DesignMode)
            {

                Page.ClientScript.GetPostBackEventReference(this, "");

                ResourceManager existingInstance = ResourceManager.GetInstance(this.Page);

                if (existingInstance != null && !DesignMode)
                {
                    throw new InvalidOperationException("Only one ResourceManager is required per Page.");
                }

                this.Page.Items[typeof(ResourceManager)] = this;
                HttpContext.Current.Items[typeof(ResourceManager)] = this;
                this.Page.PreRenderComplete += Page_PreRenderComplete;

            }
        }

        protected void Page_PreRenderComplete(object sender, EventArgs e)
        {
            if (!this.DesignMode && this.Page != null)
            {
                this.SetIsLast();
            }
        }

        /// <summary>
        /// Use to get a reference to the current instance.
        /// </summary>
        /// <returns>Current instance</returns>
        public static ResourceManager GetInstance()
        {
            return ResourceManager.GetInstance(HttpContext.Current);
        }

        /// <summary>
        /// Use to get a reference to the current instance.
        /// </summary>
        /// <param name="page">Page instance on which ResourceManager control is located</param>
        /// <returns>ResourceManager instance.</returns>
        public static ResourceManager GetInstance(Page page)
        {
            if (page == null)
            {
                throw new ArgumentNullException("The Page object can not be found.");
            }

            return page.Items[typeof(ResourceManager)] as ResourceManager;
        }

        /// <summary>
        /// Use to get a reference to the current instance.
        /// </summary>
        /// <param name="context">HttpContext object</param>
        /// <returns>ResourceManager instance.</returns>
        public static ResourceManager GetInstance(HttpContext context)
        {
            if (context == null)
            {
                throw new ArgumentNullException("HttpContext is empty");
            }

            if (context.CurrentHandler is Page)
            {
                ResourceManager rm = ((Page)HttpContext.Current.CurrentHandler).Items[typeof(ResourceManager)] as ResourceManager;

                if (rm != null)
                {
                    return rm;
                }
            }

            return context.Items[typeof(ResourceManager)] as ResourceManager;
        }

        private void createCss(string path)
        {
            HtmlLink myHtmlLink = new HtmlLink();
            myHtmlLink.Href = path;
            myHtmlLink.Attributes.Add("rel", "stylesheet");
            myHtmlLink.Attributes.Add("type", "text/css");
            Page.Header.Controls.Add(myHtmlLink);
        }

        protected override void OnLoad(EventArgs e)
        {

            base.OnLoad(e);
        }


        protected override void OnPreRender(EventArgs e)
        {
            if (!DesignMode)
            {
                if (!Page.IsPostBack)
                    RegisterConfiguration();
                Page.ClientScript.RegisterClientScriptResource(typeof(ResourceManager), "JDash.WebForms.resources.jdash_debug.js");
            }
            else
            {

            }
            base.OnPreRender(e);
        }

        private void RegisterConfiguration()
        {
            var list = new Dictionary<string, string>();
            var normalizedLocation = ClientRoot == "jdash" ? "" : "../" + ClientRoot;
            list.Add("isDebug", "false");
            list.Add("baseUrl", "'/'");
            list.Add("packages", string.Format("[ {{ name: 'jdash', location: '{0}' }}]", normalizedLocation));
            if (PrepareClientConfig != null)
                PrepareClientConfig(this, new ClientConfigEventArgs(list));

            var script = string.Format("var dojoConfig = {{ {0}  }};", ClientConfigEventArgs.ToJs(list));
            Page.ClientScript.RegisterClientScriptBlock(typeof(ResourceManager), "dojoConfig", script, true);
        }

        protected override void CreateChildControls()
        {
            if (DesignMode)
            {
                this.Controls.Clear();
                this.Width = 200;
                HtmlGenericControl div = new HtmlGenericControl("div");
                div.Attributes["style"] = "width: 170px; padding: 15px; background-color: #E2E2E2; border: 1px solid #666666; font-family: Arial, Helvetica, sans-serif; font-size: 10px; font-weight: bold; color: #333333;";
                div.InnerHtml = string.Format("<b>{0} Control {1}</b><br/>{2}", typeof(ResourceManager).Name, AssemblyInfoUtils.AssemblyVersion, AssemblyInfoUtils.Copyright);
                this.Controls.Add(div);
                return;
            }
            base.CreateChildControls();
        }



        internal DashboardLicenseManager GetLicenseManager()
        {
            return licenseManager;
        }

        /// <summary>
        /// Helper method to check if the specified control will be re-rendered on client side.
        /// Returns true if the dom for the control will be updated on client side.
        /// </summary>
        /// <param name="control">The control to check.</param>
        /// <returns></returns>
        public bool ShouldCreateClient(Control control)
        {
            if (!RequestManager.IsMicrosoftAjaxRequest)
                return true;
            else
            {
                var up = ReflectionUtils.GetTypeOfParent(control, "System.Web.UI.UpdatePanel") as UpdatePanel;
                if (up != null && GetIsInUpdatePanelRefresh(up))
                    return true;
                else return false;
            }
        }
    }
}
