using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace JDash.Mvc.Management
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            config.Routes.MapHttpRoute(
                    name: "DefaultApi",
                    routeTemplate: "{area}/{controller}/{id}",
                    defaults: new { id = RouteParameter.Optional }
                );

            config.Routes.MapHttpRoute(
            name: "manapi",
            routeTemplate: "manapi/{action}/{id}",
            defaults: new { Controller = "JDashManagement", id = RouteParameter.Optional }
        );
        }
    }
}
