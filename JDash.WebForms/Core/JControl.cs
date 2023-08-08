using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JDash.WebForms.Utils;
using JDash.Helpers;
using System.Web.UI.HtmlControls;

namespace JDash.WebForms
{
    /// <summary>
    /// Base abstract class for all controls.
    /// </summary>
    public abstract class JControl : WebControl
    {
        internal bool IsLast { get; set; }
        private ResourceManager resourceManager;
        private bool _inited = false;

        private string[] clientModules;

        private Dictionary<string, object> clientPropertTrackList = new Dictionary<string, object>();


        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            this._inited = true;
        }

        public JControl()
            : base()
        {

        }

        protected void TrackChange(string name, object value)
        {
            if (this._inited)
                clientPropertTrackList[name] = getClientValue(value);
        }

        protected virtual string[] ClientModules
        {
            get
            {
                if (clientModules == null)
                {
                    var attr = this.GetType().GetCustomAttributes(typeof(ClientModulesAttribute), false);
                    if (attr.Length > 0)
                    {
                        clientModules = ((ClientModulesAttribute)attr[0]).Modules;
                    }
                }
                return clientModules;
            }
        }

        protected override HtmlTextWriterTag TagKey
        {
            get
            {
                return HtmlTextWriterTag.Div;
            }
        }



        public virtual void AddScript(string script)
        {
            this.ResourceManager.RegisterOnReadyScript(ResourceManager.ScriptOrderNumber, script);
        }

        protected virtual internal ResourceManager SafeResourceManager
        {
            get
            {
                if (this.resourceManager != null)
                {
                    return this.resourceManager;
                }

                if (!this.DesignMode)
                {
                    if (this.Page != null)
                    {
                        this.resourceManager = ResourceManager.GetInstance(this.Page);
                    }
                    else if (HttpContext.Current != null)
                    {
                        this.resourceManager = ResourceManager.GetInstance(HttpContext.Current);
                    }

                    if (this.resourceManager != null)
                    {
                        return this.resourceManager;
                    }
                }

                if (this is ResourceManager)
                {
                    return this as ResourceManager;
                }
                return this.resourceManager;
            }
        }

        protected internal virtual ResourceManager ResourceManager
        {
            get
            {
                ResourceManager rm = this.SafeResourceManager;

                if (rm == null && this.DesignMode)
                {
                    return new ResourceManager();
                }

                if (rm == null)
                {
                    throw new InvalidOperationException(string.Concat(
                                                            "The ResourceManager Control is missing from this Page.",
                                                            Environment.NewLine,
                                                            Environment.NewLine,
                                                            "Please add the following ResourceManager tag inside the <body> or <form runat=\"server\"> of this Page.",
                                                            Environment.NewLine,
                                                            Environment.NewLine,
                                                            "Example",
                                                            Environment.NewLine,
                                                            Environment.NewLine,
                                                            "    <ext:ResourceManager runat=\"server\" />"));
                }

                return this.resourceManager;
            }
        }

        internal virtual bool GetIsInUpdatePanelRefresh(UpdatePanel panel)
        {
            return this.ResourceManager.UpdatePanelIDsToRefresh.Contains(panel.UniqueID);
        }

        protected virtual bool IsInUpdatePanelRefresh
        {
            get
            {
                if (this.MyUpdatePanel != null)
                {
                    return this.ResourceManager.UpdatePanelIDsToRefresh.Contains(this.MyUpdatePanel.UniqueID);
                }

                return false;
            }
        }

        Control myUpdatePanel = null;

        internal virtual Control MyUpdatePanel
        {
            get
            {
                if (this.myUpdatePanel == null)
                {
                    this.myUpdatePanel = ReflectionUtils.GetTypeOfParent(this, "System.Web.UI.UpdatePanel");
                }

                return this.myUpdatePanel;
            }
        }


        string clientInitScript = "";
        string clientPropertyUpdateScript = "";

        protected virtual string ClientInitScript
        {
            get
            {
                return this.clientInitScript;
            }
        }

        protected internal virtual string ClientInitID
        {
            get
            {
                return this.ClientID.ConcatWith("_ClientInit");
            }
        }

        protected virtual string PropertyUpdateFuncTemplate
        {
            get
            {
                return "jdash.setCmpProperties('{0}', {1});";
            }
        }


        protected virtual string InstanceFuncTemplate
        {
            get
            {
                return "jdash.createCmp({0}, {1}, '{2}');";
            }
        }

        private Dictionary<string, object> clientProperties;

        protected Dictionary<string, object> ClientProperties
        {
            get
            {
                if (clientProperties == null)
                    clientProperties = new Dictionary<string, object>(5);
                return clientProperties;
            }
        }

        protected internal virtual string ClientWidgetID
        {
            get
            {
                return string.Format("{0}Widget", this.ClientID);
            }
        }

        protected object getClientValue(object val)
        {
            if (val == null)
                return null;
            else
            {
                if ((val.GetType()).BaseType.FullName.ToLowerInvariant() == "system.enum")
                    return val.ToString();
                else return val;
            }
        }

        protected virtual void getClientProperties(Dictionary<string, object> dict)
        {
            PropertyInfo[] props = this.GetType().GetProperties(BindingFlags.Instance | BindingFlags.Public);

            dict.Add("id", this.ClientWidgetID);

            foreach (var prop in props)
            {
                var attr = prop.GetCustomAttributes(typeof(ClientPropertyAttribute), false);
                if (attr.Length > 0)
                {
                    var key = ((ClientPropertyAttribute)attr[0]).Name;
                    var value = prop.GetValue(this, null);
                    value = getClientValue(value);
                    dict.Add(key, value);
                }
            }
        }

        internal virtual protected string GetClientPropertyUpdateScript()
        {
            if (clientPropertTrackList.Count > 0)
            {
                return PropertyUpdateFuncTemplate.FormatWith(ClientWidgetID, SerializationUtils.Serialize(clientPropertTrackList));
            }
            else return "";
        }

        internal virtual protected string GetClientConstructor()
        {
            var clientModules = SerializationUtils.Serialize(this.ClientModules);
            getClientProperties(this.ClientProperties);
            return string.Format(InstanceFuncTemplate, clientModules, SerializationUtils.Serialize(ClientProperties), this.ClientID);
        }



        protected internal virtual void OnClientInit(bool reinit)
        {
            if ((this.init && !reinit))
            {
                return;
            }

            this.EnsureChildControls();

            if (!DesignMode)
            {
                this.clientInitScript = this.GetClientConstructor();

            }

            this.init = true;
        }

        protected virtual bool CancelDestroyCheck
        {
            get
            {
                return false;
            }
        }

        protected virtual void SetResources()
        {

            bool isAsync = RequestManager.IsMicrosoftAjaxRequest;
            

            if (isAsync && this.IsInUpdatePanelRefresh)
            {
                this.OnClientInit(false);
                if (!string.IsNullOrEmpty(this.ClientInitScript))
                {
                    string destroyCheck = CancelDestroyCheck ? "{1}" : "jdash.destroyCmp(\"{0}\");{1}";
                    this.ResourceManager.RegisterClientInitScript(this.ClientInitID, destroyCheck.FormatWith(this.ClientWidgetID, this.ClientInitScript));
                }
            }

            if (!isAsync)
            {
                this.OnClientInit(false);
                if (!string.IsNullOrEmpty(this.ClientInitScript))
                {
                    this.ResourceManager.RegisterClientInitScript(this.ClientInitID, this.ClientInitScript);
                }
            }
            this.clientPropertyUpdateScript = this.GetClientPropertyUpdateScript();
            if (isAsync && !this.IsInUpdatePanelRefresh && !string.IsNullOrEmpty(clientPropertyUpdateScript))
            {
                this.ResourceManager.RegisterOnReadyScript(ResourceManager.ScriptOrderNumber, this.clientPropertyUpdateScript);
            }
        }

        protected override void OnPreRender(EventArgs e)
        {
            if (!DesignMode)
            {
                if ((!RequestManager.IsMicrosoftAjaxRequest || this.IsInUpdatePanelRefresh))
                {

                }




                if (this.Visible && !this.preRendered)
                {
                    if (this.Page != null && this is IPostBackDataHandler)
                    {
                        this.Page.RegisterRequiresPostBack(this);
                    }

                    this.preRendered = true;
                }

                if (RequestManager.IsMicrosoftAjaxRequest)
                {
                    this.PreRenderAction();
                }

                if (this.Page != null)
                {
                    base.OnPreRender(e);
                }
            }
            else base.OnPreRender(e);
        }

        internal void RegisterUpdatePanels()
        {
            foreach (Control c in ControlUtils.FindControls<UpdatePanel>(this))
                if (c != null && c is UpdatePanel)
                    RegisterUpdatePanel(c as UpdatePanel);
        }

        internal void RegisterUpdatePanel(UpdatePanel panel)
        {
            MethodInfo m =

               (from methods in typeof(System.Web.UI.ScriptManager).GetMethods(BindingFlags.NonPublic | BindingFlags.Instance)

                where methods.Name.Equals("System.Web.UI.IScriptManagerInternal.RegisterUpdatePanel")

                select methods).First<MethodInfo>();

            m.Invoke(System.Web.UI.ScriptManager.GetCurrent(Page), new object[] { panel });
        }

        private bool rendered;
        private bool preRendered;
        private bool init;

        protected virtual void PreRenderAction()
        {
            if (this.Visible && !this.rendered)
            {
                this.SetResources();

                this.rendered = true;
            }
        }

        protected virtual Control GetDesigntimeControl()
        {
            HtmlGenericControl div = new HtmlGenericControl("div");
            div.Attributes["style"] = "width: 170px; padding: 15px; background-color: #E2E2E2; border: 1px solid #666666; font-family: Arial, Helvetica, sans-serif; font-size: 10px; font-weight: bold; color: #333333;";
            div.InnerHtml = string.Format("<b>{0} Control {1}</b><br/>{2}", this.GetType().Name, AssemblyInfoUtils.AssemblyVersion, AssemblyInfoUtils.Copyright);
            return div;
        }

        protected override void Render(HtmlTextWriter writer)
        {
            if (this.DesignMode)
            {
                var control = GetDesigntimeControl();
                control.RenderControl(writer);
                return;
            }
            if (this.Visible)
            {
                bool isAsync = RequestManager.IsMicrosoftAjaxRequest;

                if (!isAsync)
                {
                    this.PreRenderAction();
                }

                if (isAsync
                    && this.IsInUpdatePanelRefresh)
                {
                    this.Attributes.Add("class", "AsyncRender");
                }

                this.HtmlRender(writer);

            }

            if (this.IsLast)
            {
                this.ResourceManager.RenderAction(writer);
            }
        }

        protected virtual void HtmlRender(HtmlTextWriter writer)
        {
            StringBuilder sb = new StringBuilder(256);
            base.Render(new HtmlTextWriter(new StringWriter(sb)));

            string html = sb.ToString().Trim();
            writer.Write(html);
        }
    }
}
