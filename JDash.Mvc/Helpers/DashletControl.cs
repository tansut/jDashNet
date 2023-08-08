using JDash.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace JDash.Mvc
{
    public class DashletControl: Widget<DashletControl>
    {
        protected override string WidgetType
        {
            get { return "jdash.ui.DashletPropertyEditor"; }
        }

        public DashletControl(HtmlHelper helper, string propertyName, string objectName)
            : base(helper)
        {
            this.WidgetConfig.Add("propertyName", getClientValue(propertyName));
            this.WidgetConfig.Add("objectName", getClientValue(objectName));
            WidgetConfig.Add("context", "");
        }
    }
}
