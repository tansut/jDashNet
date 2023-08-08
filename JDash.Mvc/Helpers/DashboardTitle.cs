using JDash.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace JDash.Mvc
{

    public class DashboardTitle : Widget<DashboardTitle>
    {
        protected override string WidgetType
        {
            get { return "jdash.ui.DashboardTitle"; }
        }



        public DashboardTitle InitialContent(string value)
        {
            WidgetConfig["initialContent"] = value;
            return this;
        }

        public DashboardTitle DashboardView(string id)
        {
            WidgetConfig["dashboardView"] = id;
            return this;
        }


        public DashboardTitle(HtmlHelper helper)
            : base(helper)
        {
            this.tag = "span";
        }
    }
}
