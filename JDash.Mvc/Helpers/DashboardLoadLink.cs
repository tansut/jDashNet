using JDash.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace JDash.Mvc
{

    public class DashboardLoadLink : Widget<DashboardLoadLink>
    {
        protected override string WidgetType
        {
            get { return "jdash.ui.DashboardLoadLink"; }
        }


        public DashboardLoadLink DashboardView(string id)
        {
            WidgetConfig["dashboardView"] = id;
            return this;
        }

        public DashboardLoadLink DashboardId(string id)
        {
            WidgetConfig["dashboardId"] = id;
            return this;
        }

        public DashboardLoadLink Options(dynamic options)
        {
            WidgetConfig["options"] = options;
            return this;
        }

        public DashboardLoadLink(HtmlHelper helper)
            : base(helper)
        {
            this.tag = "a";
        }
    }
}
