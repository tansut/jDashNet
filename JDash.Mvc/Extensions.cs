using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace JDash.Mvc
{
    public static class Extensions
    {
        public static JDashBuilder JDash(this HtmlHelper helper)
        {
            return new JDashBuilder(helper);
        }
    }
}
