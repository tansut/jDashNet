using JDash.Mvc;
using JDash.MvcDemo.Areas.Dashlets.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace JDash.MvcDemo.Areas.Dashlets.Controllers
{
    public class WeatherBoardController : Controller
    {
        //
        // GET: /Dashlets/WeatherBoard/

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Editor(string id)
        {
            var dashlet = JDashManager.Provider.GetDashlet(id);
            var isCurrentCity=dashlet.config.JsonParsed<bool>("isCurrentCity", true);
            var city = dashlet.config.JsonParsed<string>("city", "");
            var model = dashlet.config.JsonParsed<WeatherBoardModel>("model", new WeatherBoardModel() {IsCurrentCity=isCurrentCity,City=city });
            return View(model);
        }
        [HttpPost]
        public ActionResult Save(string id, WeatherBoardModel model)
        {
            var dashlet = JDashManager.Provider.GetDashlet(id);
            dashlet.LoadProperties(model.DashletProperties);
            dashlet.config["city"] = model.City;
            dashlet.config["isCurrentCity"] = model.IsCurrentCity;
            JDashManager.Provider.SaveDashlet(dashlet);
            return new JsonNetResult(new { config = dashlet.config });
        }
    }
}
