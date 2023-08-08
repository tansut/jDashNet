using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using JDash.WebForms.Utils;

namespace JDash.WebForms
{
    /// <summary>
    /// Allows a user to change style of dashlet.
    /// </summary>
    [ToolboxBitmap(typeof(DashletStylesList), "resources.toolboxIcons.dashletStyleList.bmp")]
    public class DashletStylesList: JDashletControl
    {
        protected override System.Web.UI.Control GetDesigntimeControl()
        {
            HtmlGenericControl div = new HtmlGenericControl("div");
            div.InnerHtml = "<a style='display:inline-block;height:24px;width: 24px;margin-right: 2px;cursor: pointer;border-radius:4px;background-color: rgb(36, 36, 36);' title='Black'></a><a style='display:inline-block;height:24px;width: 24px;margin-right: 2px;cursor: pointer;border-radius:4px;background-color: rgb(91, 146, 193);' title='Blue'></a><a style='display:inline-block;height:24px;width: 24px;margin-right: 2px;cursor: pointer;border-radius:4px;background-color: rgb(227, 227, 227);' title='Default'></a><a style='display:inline-block;height:24px;width: 24px;margin-right: 2px;cursor: pointer;border-radius:4px;background-color: rgb(187, 187, 187);' title='LightGray'></a><a style='display:inline-block;height:24px;width: 24px;margin-right: 2px;cursor: pointer;border-radius:4px;background-color: rgb(179, 179, 179);' title='Gray'></a><a style='display:inline-block;height:24px;width: 24px;margin-right: 2px;cursor: pointer;border-radius:4px;background-color: rgb(250, 219, 78);' title='Yellow'></a>";
            return div;
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
                return "jdash.createDashletStylesList({0}, '{1}');";
            }
        }

    }
}
