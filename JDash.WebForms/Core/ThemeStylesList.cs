using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web.UI.HtmlControls;
using JDash.WebForms.Utils;

namespace JDash.WebForms
{
    /// <summary>
    /// Allows user to change theme of JDash.Net.
    /// </summary>
    /// 
    [ToolboxBitmap(typeof(ThemeStylesList), "resources.toolboxIcons.themeStyleList.bmp")]
    public class ThemeStylesList : JControl
    {
        protected override System.Web.UI.Control GetDesigntimeControl()
        {
            HtmlGenericControl div = new HtmlGenericControl("div");
            div.InnerHtml = "<a style='display:inline-block;height:24px;width: 24px;margin-right: 2px;cursor: pointer;border-radius:4px;background-color: rgb(36, 36, 36);' title='Black'></a><a style='display:inline-block;height:24px;width: 24px;margin-right: 2px;cursor: pointer;border-radius:4px;background-color: rgb(91, 146, 193);' title='Blue'></a><a style='display:inline-block;height:24px;width: 24px;margin-right: 2px;cursor: pointer;border-radius:4px;background-color: rgb(227, 227, 227);' title='Default'></a><a style='display:inline-block;height:24px;width: 24px;margin-right: 2px;cursor: pointer;border-radius:4px;background-color: rgb(187, 187, 187);' title='LightGray'></a><a style='display:inline-block;height:24px;width: 24px;margin-right: 2px;cursor: pointer;border-radius:4px;background-color: rgb(179, 179, 179);' title='Gray'></a><a style='display:inline-block;height:24px;width: 24px;margin-right: 2px;cursor: pointer;border-radius:4px;background-color: rgb(250, 219, 78);' title='Yellow'></a>";
            return div;
        }

        //public string ThemeId
        //{
        //    get
        //    {
        //        return ViewState["themeId"] == null ?
        //            null :
        //            (string)ViewState["themeId"];
        //    }
        //    set
        //    {
        //        ViewState["themeId"] = value;
        //        base.TrackChange("themeId", value);
        //    }
        //}


        public bool PersistSelection
        {
            get
            {
                return ViewState["persistSelection"] == null ?
                    true :
                    (bool)ViewState["persistSelection"];
            }
            set
            {
                ViewState["persistSelection"] = value;
                base.TrackChange("persistSelection", value);
            }
        }

        protected override void getClientProperties(Dictionary<string, object> dict)
        {
            dict.Add("id", this.ClientWidgetID);
            //dict.Add("themeId", this.ThemeId);
            dict.Add("persistSelection", getClientValue(PersistSelection));
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
                return "jdash.createThemeStylesList({0}, '{1}');";
            }
        }
    }
}
