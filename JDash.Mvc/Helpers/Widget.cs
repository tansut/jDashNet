using JDash.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace JDash.Mvc
{

    public enum InitializeMode
    {
        Declerative,
        JavaScript
    }

    public abstract class Widget<T> : DomElement<T> where T : Widget<T>
    {
        private ResourceManager resourceManager;
        private Dictionary<string, dynamic> config = null;
        protected InitializeMode InitializeMode = InitializeMode.Declerative;

        protected abstract string WidgetType
        {
            get;
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

        public Dictionary<string, dynamic> WidgetConfig
        {
            get
            {
                if (config == null)
                {
                    config = new Dictionary<string, dynamic>();
                    return config;
                }
                else return config;
            }
        }

        public override T Css(string css)
        {
            this.WidgetConfig["baseClass"] = css;
            return (T)this;
        }

        protected override string CssValue()
        {
            dynamic val;
            if (this.WidgetConfig.TryGetValue("baseClass", out val))
                return (string)val;
            else return "";
        }


        //public T WidgetID(string id)
        //{
        //    this.WidgetConfig["id"] = id;
        //    return (T)this;
        //}


        protected string ClientWidgetID
        {
            get
            {
                //dynamic val = null;
                //if (WidgetConfig.TryGetValue("id", out val))
                //    return (string)val;
                //else return "";
                return this.id;
            }
        }

        protected override void RenderAttributes(TagBuilder tb)
        {
            base.RenderAttributes(tb);
            //tb.Attributes.Add("id", this.ClientWidgetID);
            if (this.InitializeMode == Mvc.InitializeMode.JavaScript)
                this.RenderClientInitScript();
            else
            {
                tb.Attributes.Add("data-jdash-type", this.WidgetType);
                tb.Attributes.Add("data-jdash-params", Serialization.JsonStringify(this.WidgetConfig));
            }
        }

        protected virtual void RenderClientInitScript()
        {
            var script = string.Format("mvc.createUiControl('{0}', {1}, '{2}');", this.WidgetType, Serialization.JsonStringify(this.WidgetConfig), this.ClientWidgetID + "Container");
            this.ResourceManager.RegisterClientInitScript(this.ClientWidgetID, script);
        }


        protected Widget(System.Web.Mvc.HtmlHelper helper, string id = null): base(helper)
        {
            if (string.IsNullOrEmpty(id))
                ID(Utils.UniqueID);
        }



        protected virtual internal ResourceManager ResourceManager
        {
            get
            {
                if (this.resourceManager != null)
                {
                    return this.resourceManager;
                }

                if (this is ResourceManager)
                {
                    return this as ResourceManager;
                }
                this.resourceManager = ResourceManager.GetInstance();
                if (this.resourceManager == null)
                {
                    this.resourceManager = new ResourceManager(this.helper);
                }
                return this.resourceManager;
            }
        }

        protected internal virtual void AddScript(string format, params object [] prms) 
        {
            this.AddScript(string.Format(format, prms));
        }

        protected internal virtual void AddScript(string script)
        {
            this.ResourceManager.RegisterOnReadyScript(ResourceManager.ScriptOrderNumber, script);
        }
    }
}
