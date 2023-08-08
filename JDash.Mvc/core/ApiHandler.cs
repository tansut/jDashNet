using JDash.Mvc.api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Http.Dispatcher;
using System.Web.Mvc;
using System.Web.Routing;

namespace JDash.Mvc.Core
{




    internal class ApiRouteHandler : IRouteHandler
    {
        IHttpHandler IRouteHandler.GetHttpHandler(RequestContext requestContext)
        {
            return new ApiHandler();
        }
    }

    internal class ApiHandler : IHttpHandler
    {
        public bool IsReusable
        {
            get { return true; }
        }

        public void ProcessRequest(HttpContext context)
        {
            IHttpHandler handler = new MvcHttpHandler();
            handler.ProcessRequest(context);            
        }
    }
}
