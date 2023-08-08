using JDash.Mvc;
using JDash.MvcDemo.Areas.Dashlets.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace JDash.MvcDemo.Areas.Dashlets.Controllers
{
    public class JVectorMapController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Editor(string id)
        {

            var dashlet = JDashManager.Provider.GetDashlet(id);
            var model = dashlet.config.JsonParsed<JVectorMapModel>("model", new JVectorMapModel() { });
            return View(model);
        }

        public ActionResult Save(string id, JVectorMapModel model)
        {
            var dashlet = JDashManager.Provider.GetDashlet(id);
            dashlet.config["model"] = model;
            JDashManager.Provider.SaveDashlet(dashlet);
            return new JsonNetResult(new { config = dashlet.config });
        }

        

    }
}
