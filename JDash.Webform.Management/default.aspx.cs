using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDash.Webform.Management
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var applicationPath = HttpContext.Current.Request.QueryString["applicationPath"];

            Response.Redirect(string.Format("{0}{1}", "~/Pages/DashletModule/DashletModule.aspx", string.IsNullOrEmpty(applicationPath) ? string.Empty : string.Format("?applicationPath={0}", applicationPath)));
        }
    }
}