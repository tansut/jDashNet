using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace JDash.Mvc.Management.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        public ActionResult Index()
        {
            HttpContext.Application["appPath"] = HttpContext.Request.QueryString["applicationPath"];
            return View();
        }

    }
}
