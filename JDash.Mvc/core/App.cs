using JDash.Configuration;
using JDash.Mvc.api;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Reflection;
using System.Security.Policy;
using System.Text;
using System.Web.Http;
using System.Web.Http.Dispatcher;
using System.Web.Mvc;
using System.Web.Routing;

namespace JDash.Mvc.Core
{



    public class JDashAssembliesResolver : DefaultAssembliesResolver
    {
        public override ICollection<Assembly> GetAssemblies()
        {
            ICollection<Assembly> baseAssemblies = base.GetAssemblies();
            List<Assembly> assemblies = new List<Assembly>(baseAssemblies);
            var controllersAssembly = Assembly.GetExecutingAssembly();
            baseAssemblies.Add(controllersAssembly);
            return assemblies;
        }
    }


    public static class App
    {
        internal static void expirecheck()
        {
            return;
            var expDate = new DateTime(2014, 9, 13);
            if (DateTime.Now.Date >= expDate)
                throw new UnauthorizedAccessException("Expired");
        }

        internal static string ApiPath(bool clientBased)
        {
            DashboardSettingsSection section =
                ConfigurationManager.GetSection("JDash") as DashboardSettingsSection;
            var apiPath = string.IsNullOrEmpty(section.ApiPath) ? "jdash/api/" : section.ApiPath;
            //var url = UrlHelper.GenerateContentUrl("~/", );
            if (!clientBased)
                return "jdash/api/";
            return apiPath;
        }

        public static string AssemblyVersion
        {
            get
            {
                return Assembly.GetExecutingAssembly().GetName().Version.ToString();
            }
        }

        public static void Initialize()
        {
            App.expirecheck();


            //RouteTable.Routes.Insert(0,
            //    new Route("{root}/jdash/nls/{file}.js",
            //    new RouteValueDictionary(new { }),
            //    new RouteValueDictionary(new { }),
            //    new NlsResourceRouteHandler()
            //));

            GlobalConfiguration.Configuration.Services.Replace(typeof(IAssembliesResolver), new JDashAssembliesResolver());

            DashboardSettingsSection section = ConfigurationManager.GetSection("JDash") as DashboardSettingsSection;

            if (section != null && section.JDashController)
            {
                RouteTable.Routes.MapHttpRoute(
                    name: "JDashApi",
                    routeTemplate: ApiPath(false) + "{action}/{id}",
                    defaults: new { Controller = "JDash", id = RouteParameter.Optional }
                );
            }
        }
    }
}
