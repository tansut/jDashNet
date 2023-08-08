using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace JDash.Mvc.Helpers
{
    public class LoadDashboardLink: Widget<LoadDashboardLink>
    {

        public LoadDashboardLink(HtmlHelper helper): base(helper)
        {

        }
        protected override string WidgetType
        {
            get { throw new NotImplementedException(); }
        }
    }
}
