using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace JDash.Mvc
{
    public class DashletStylesList: Widget<DashletStylesList>
    {
        protected override string WidgetType
        {
            get
            {
                return "jdash.ui.DashletStylesList";
            }
        }

        public DashletStylesList(HtmlHelper helper)
            : base(helper)
        {
            WidgetConfig.Add("context", "");
        }
    }
}
