using JDash.Mvc;
using JDash.MvcDemo.Areas.Dashlets.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace JDash.MvcDemo.Areas.Dashlets.Controllers
{
    public class SparkLineController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Editor(string id)
        {
            var dashlet = JDashManager.Provider.GetDashlet(id);
            var type = dashlet.config.Get<string>("type", "Cpu Utilization");
            var value = dashlet.config.Get<string>("value", "10.2");
            return View(new SparkLineModel() { Type = type, Value=value });
        }
        [HttpPost]
        [ValidateInput(true)]
        public ActionResult Save(string id, SparkLineModel model)
        {
            var dashlet = JDashManager.Provider.GetDashlet(id);
            dashlet.LoadProperties(model.DashletProperties);
            dashlet.config["type"] = model.Type;
            dashlet.config["value"] = model.Value;
            JDashManager.Provider.SaveDashlet(dashlet);
            return new JsonNetResult(new { config = dashlet.config });
        }
    }
}
