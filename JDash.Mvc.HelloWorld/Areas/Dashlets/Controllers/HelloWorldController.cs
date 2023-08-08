using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace JDash.Mvc.HelloWorld.Areas.Dashlets.Controllers
{
    public class HelloWorldController : Controller
    {
        //
        // GET: /Dashlets/HelloWorld/

        public ActionResult Index()
        {
            return View();
        }

    }
}
