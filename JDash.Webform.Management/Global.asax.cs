using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace JDash.Webform.Management
{
    public class Global : System.Web.HttpApplication
    {

        private void SetUserLocale()
        {
            string Lang;
            HttpRequest Request = HttpContext.Current.Request;
            if (Request.UserLanguages == null)
                Lang = "tr-TR";
            else Lang = Request.UserLanguages[0];

            if (Lang != null)
            {
                try
                {
                    CultureInfo culture = new CultureInfo(Lang);
                    System.Threading.Thread.CurrentThread.CurrentCulture = culture;
                    Thread.CurrentThread.CurrentUICulture = culture;
                }
                catch
                { ;}
            }
        }

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            SetUserLocale();
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {
            //var error = Server.GetLastError();
            //throw error;
        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}