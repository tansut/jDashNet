using JDash.Models;
using JDash.Query;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using JDash;
using System.IO;
using JDash.Mvc;
using JDash.Mvc.Util;
using JDash.MvcDemo.Models;
namespace JDash.MvcDemo.Controllers
{
    public class DashboardController : Controller
    {
        public ActionResult ConfigDB()
        {
            return View();
        }

        public ActionResult Index(string id)
        {
            IEnumerable<DashletModuleModel> modules;
            try
            {                
                // Get connection string.
                var connStr = JDashManager.Provider.ConnectionString;
                
                // Try to create metadata.
                var createdMetadata = JDashManager.Provider.CreateMetadata(connStr, true);
                
                // If metadata is not already created initialize demo database.
                if (createdMetadata)
                {
                    var sqlScriptFile = Server.MapPath("~/App_Data/" + JDashManager.Provider.Name + ".sql");
                    if (System.IO.File.Exists(sqlScriptFile))
                    {
                        var script = System.IO.File.ReadAllText(sqlScriptFile);
                        JDashManager.Provider.ExecuteScript(connStr, script);
                    }
                }

                modules = ViewBag.DashletModules = JDashManager.Provider.SearchDashletModules().data;
            }
            catch (Exception exc)
            {
                ViewBag.Exception = exc;
                return View("ConfigDB");
            }
            
            ViewBag.DashletModuleCategories = modules.Select(x => x.metaData.group).Distinct();
            IEnumerable<DashboardModel> dashboards = ViewBag.Dashboards = JDashManager.Provider.GetDashboardsOfUser(JDashManager.CurrentUser);
            ViewBag.CurrentDashboard = id;            
            return View();
        }

        [HttpPost]
        public JsonResult SaveDashboard(DashboardCreationModel model)
        {
            if (string.IsNullOrEmpty(model.id))
            {
                var newDashboard = new DashboardModel();
                setDashboardFromModel(ref newDashboard, model);
                JDashManager.Provider.CreateDashboard(newDashboard);
                return Json(new { id = newDashboard.id });
            }
            else
            {
                var existing = JDashManager.Provider.GetDashboard(model.id);
                setDashboardFromModel(ref existing, model);
                JDashManager.Provider.SaveDashboard(existing);
                return Json(new { id = model.id });
            }

        }

        private void setDashboardFromModel(ref DashboardModel existing, DashboardCreationModel model)
        {
            existing.id = model.id ?? string.Empty;
            existing.title = model.title;
            existing.metaData.group = model.customGroupChecked && !String.IsNullOrEmpty(model.customGroupName) ? model.customGroupName : model.group;
            if (!string.IsNullOrWhiteSpace(model.layoutId))
            {
                var layout = LayoutModel.GetPredefinedGridLayout(model.layoutId);
                existing.layout = layout;
            }
            existing.metaData.description = model.description ?? String.Empty;
            if (!String.IsNullOrEmpty(model.color))
            {
                Config config = new Config();
                config.Add("color", model.color);
                existing.config = config;
            }
        }

        public JsonResult DeleteDashboard(string Id)
        {
            JDashManager.Provider.DeleteDashboard(Id);
            return new JsonResult();
        }

        public string DashboardsMenu()
        {
            var dashboards = JDashManager.Provider.SearchDashboards().data;

            return new ViewRenderer(this.ControllerContext).RenderPartialView("DashboardsMenu", dashboards);

        }

        [HttpGet]
        public string DashboardEditModule(string id)
        {
            var model = new DashboardCreationModel();
            if (!String.IsNullOrWhiteSpace(id))
            {
                model = setModelFromDashboard(JDashManager.Provider.GetDashboard(id));
            }
            return new ViewRenderer(ControllerContext).RenderPartialView("DashboardEditModule", model, new
            {
                DashboardGroups = bindGroups(),
                DashboardColors = DashboardColors
            });
        }

        private IEnumerable<string> bindGroups()
        {
            var dashboards = JDashManager.Provider.SearchDashboards();
            if (dashboards != null)
            {
                var groupedDashboards = dashboards.data.Where(d => d.metaData.group != null && d.metaData.group.Trim() != string.Empty);
                if (groupedDashboards != null)
                {
                    return groupedDashboards.Select(d => d.metaData.group).OrderBy(d => d).Distinct().ToList();
                }
            }
            return null;
        }


        public IEnumerable<string> DashboardColors
        {
            get
            {
                var dict = new List<string>();
                dict.Add("#FF9900");
                dict.Add("#FF4500");
                dict.Add("#DC143C");
                dict.Add("#DC143C");
                dict.Add("#FF9900");
                dict.Add("#FF4500");
                dict.Add("#DC143C");
                dict.Add("#3300CC");
                dict.Add("#99FF00");
                dict.Add("#CCFF00");
                dict.Add("#009900");
                dict.Add("#999900");
                return dict;
            }
        }


        public DashboardCreationModel setModelFromDashboard(DashboardModel dashboard)
        {
            var dashboardCreationModel = new DashboardCreationModel();
            dashboardCreationModel.id = dashboard.id ?? String.Empty;
            dashboardCreationModel.title = dashboard.title;
            dashboardCreationModel.description = dashboard.metaData.description;
            if (dashboard.config != null)
                dashboardCreationModel.color = dashboard.config.ContainsKey("color") ? dashboard.config["color"] : "";
            dashboardCreationModel.group = dashboard.metaData.group;
            return dashboardCreationModel;
        }

    }
}
