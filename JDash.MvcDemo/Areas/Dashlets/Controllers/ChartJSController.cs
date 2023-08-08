using JDash.Helpers;
using JDash.Mvc;
using JDash.MvcDemo.Areas.Dashlets.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;

namespace JDash.MvcDemo.Areas.Dashlets.Controllers
{
    public class ChartJSController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Editor(string id)
        {

            var dashlet = JDashManager.Provider.GetDashlet(id);
            var model = dashlet.config.JsonParsed<ChartJSModel>("model", new ChartJSModel() { });
            return View(model);
        }

        public ActionResult Save(string id, ChartJSModel model)
        {
            var dashlet = JDashManager.Provider.GetDashlet(id);
            dashlet.LoadProperties(model.DashletProperties);
            dashlet.config["model"] = model;
            JDashManager.Provider.SaveDashlet(dashlet);

            return new ConfigResult(dashlet.config);
        }

    }
}
