using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.SessionState;

namespace JDash.MvcDemo
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        private bool IsWebApiRequest()
        {
            return HttpContext.Current.Request.AppRelativeCurrentExecutionFilePath.StartsWith("~/jdash/api");
        }

        protected void Application_PostAuthorizeRequest()
        {
            if (useSessionProvider && IsWebApiRequest())
            {
                HttpContext.Current.SetSessionStateBehavior(SessionStateBehavior.Required);
            }
        }

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            WebApiConfig.Register(GlobalConfiguration.Configuration);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        private bool useSessionProvider
        {
            get
            {
                return HttpContext.Current.Request.Url.Host.ToLowerInvariant().EndsWith("jdash.net");
            }
        }


        protected void Session_Start(object sender, EventArgs e)
        {
            if (useSessionProvider)
            {
                JDashManager.ChangeProvider("SessionStateProvider");
                var sessionProvider = JDashManager.Providers["SessionStateProvider"];
                sessionProvider.GetType().GetMethod("InitializeSession").Invoke(sessionProvider,
                    new object[] { "SQLDashboardProvider" });
            }
        }


        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }
    }
}