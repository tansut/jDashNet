using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace JDash.Mvc
{
    public class DashletCssEditor: DashletControl
    {
        public DashletCssEditor Css(string css)
        {
            this.WidgetConfig["baseClass"] = css;
            return this;
        }

        public DashletCssEditor(HtmlHelper helper)
            : base(helper, "cssClass", "model.paneConfig")
        {
            WidgetConfig.Add("$context", "");
        }
    }
}
