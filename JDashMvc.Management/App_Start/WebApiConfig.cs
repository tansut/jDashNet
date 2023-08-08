using JDashMvc.Management.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using System.Web.Mvc;

namespace JDashMvc.Management
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
            config.Routes.MapHttpRoute(
               name: "manapi",
               routeTemplate: "manapi/{action}/{id}",
               defaults: new { controller="JDashManagement",id = RouteParameter.Optional }
           );
          
        }
   
    }
}
