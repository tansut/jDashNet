using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using JDash.WebForms.Utils;

namespace JDash.WebForms
{
    /// <summary>
    /// Allows user to edit a dashlet property.
    /// </summary>    
    [ToolboxBitmap(typeof(DashletPropertyEditor), "resources.toolboxIcons.dashletPropertyEditor.bmp")]
    public abstract class DashletPropertyEditor : JDashletControl
    {
        protected override System.Web.UI.Control GetDesigntimeControl()
        {
            HtmlGenericControl div = new HtmlGenericControl("input");
            div.Attributes["type"] = "text";
            div.Attributes["width"] = "200px";
            return div;
        }

        protected override void AddAttributesToRender(System.Web.UI.HtmlTextWriter writer)
        {
            var save = this.CssClass;
            this.CssClass = "";
            base.AddAttributesToRender(writer);
            this.CssClass = save;
            
        }

        /// <summary>
        /// client side name of property to edit.
        /// </summary>
        public string PropertyName
        {
            get;
            set;
        }

        /// <summary>
        /// Inner object path.
        /// </summary>
        public string ObjectName
        {
            get;
            set;
        }

        protected override void getClientProperties(Dictionary<string, object> dict)
        {
            dict.Add("propertyName", getClientValue(PropertyName));
            dict.Add("objectName", getClientValue(ObjectName));
            base.getClientProperties(dict);
        }

        protected internal override string GetClientConstructor()
        {
            getClientProperties(this.ClientProperties);
            return string.Format(InstanceFuncTemplate, SerializationUtils.Serialize(ClientProperties), this.ClientID);
        }

        protected override string InstanceFuncTemplate
        {
            get
            {
                return "jdash.createDashletPropertyEditor({0}, '{1}');";
            }
        }
    }
}
