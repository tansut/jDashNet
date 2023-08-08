using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace JDash.Mvc
{
    public class ThemeStylesList: Widget<ThemeStylesList>
    {
        public ThemeStylesList PersistSelection(bool value)
        {
            WidgetConfig["persistSelection"] = getClientValue(value);
            return this;
        }

        protected override string WidgetType
        {
            get { return "jdash.ui.ThemeStylesList"; }
        }

        public ThemeStylesList(HtmlHelper helper)
            : base(helper)
        {
            WidgetConfig.Add("persistSelection", true);
        }
    }
}
