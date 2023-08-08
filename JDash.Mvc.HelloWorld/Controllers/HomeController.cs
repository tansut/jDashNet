using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using JDash.Models;
using System.Web;
using System.Web.Mvc;

namespace JDash.Mvc.HelloWorld.Controllers
{
    public class HomeController : Controller
    {
public ActionResult Index()
{
   //  Try to get a dashboard, if not create a default dashboard
    var user = Thread.CurrentPrincipal.Identity.Name;

    var dashboard = JDashManager.Provider.GetDashboardsOfUser(user).FirstOrDefault();
    if (dashboard == null)
    {
        dashboard = new DashboardModel()
        {
            title = "My Dashboard",
        };

        dashboard.metaData.created = DateTime.Now;
        dashboard.metaData.createdBy = user;
        JDashManager.Provider.CreateDashboard(dashboard);
    }

    var modules = JDashManager.Provider.SearchDashletModules().data;
    if (!modules.Any(p => p.title == "Hello World"))
    {
        var newModule = new DashletModuleModel();
        newModule.title = "Hello World";
        newModule.path = "[MVCDefault]";

        newModule.config.Add("mvcConfig", new
        {
            controller = "/Dashlets/HelloWorld",
        });

        newModule.paneConfig.Add("builtInCommands",
                new string[] { "restore", "maximize", "remove", "clone" });


        JDashManager.Provider.CreateDashletModule(newModule);
    }

    // Get a list of dashlet modules
    ViewBag.DashletModules = JDashManager.Provider.SearchDashletModules().data;
    ViewBag.CurrentDashboard = dashboard.id;

    return View();
}

    }
}
