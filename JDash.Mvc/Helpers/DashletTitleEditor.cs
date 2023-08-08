using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace JDash.Mvc
{
    public class DashletTitleEditor: DashletControl
    {
        public DashletTitleEditor(HtmlHelper helper)
            : base(helper, "title", "")
        {
        }
    }
}
