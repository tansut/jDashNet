using JDash.MvcDemo.Areas.Dashlets.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Net;
using System.Web.Mvc;



namespace JDash.MvcDemo.Areas.Dashlets.Controllers
{


    public class HtmlController : Controller
    {
        public ActionResult Index(string id)
        {
            var dashlet = JDashManager.Provider.GetDashlet(id);
            return View(new HtmlModel() { Html = dashlet.config.Get<string>("html", "") });
        }

        public ActionResult Editor(string id)
        {
            var dashlet = JDashManager.Provider.GetDashlet(id);
            return View(new HtmlModel() { Html = dashlet.config.Get<string>("html", "") });
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Save(string id, HtmlModel model)
        {
            var dashlet = JDashManager.Provider.GetDashlet(id);
            dashlet.LoadProperties(model.DashletProperties);
            dashlet.config["html"] = model.Html;
            JDashManager.Provider.SaveDashlet(dashlet);
            return new EmptyResult();
        }
    }
}
