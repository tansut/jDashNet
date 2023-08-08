using JDash.Models;
using JDash.Query;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace JDash.Mvc.Core
{
    class ControllerBase : Controller
    {
        [HttpPost]
        public virtual ActionResult SearchDashboards(DynamicQuery query)
        {
            var res = JDashManager.Provider.SearchDashboards(query);
            return new JsonNetResult(res);
        }

        [HttpGet]
        public virtual ActionResult GetDashboard(string id)
        {
            var res = JDashManager.Provider.GetDashboard(id);
            return new JsonNetResult(res);
        }

        [HttpPut]
        public virtual ActionResult SaveDashboard(DashboardModel model)
        {
            var res = JDashManager.Provider.SaveDashboard(model);
            return new JsonNetResult(res);
        }

        [HttpPost]
        public virtual ActionResult CreateDashboard(DashboardModel model)
        {
            model.metaData = model.metaData == null ? new MetadataModel() : model.metaData;
            var res = JDashManager.Provider.CreateDashboard(model);
            return new JsonNetResult(res);
        }

        [HttpDelete]
        public virtual ActionResult DeleteDashboard(string id)
        {
            JDashManager.Provider.DeleteDashboard(id);
            return new EmptyResult();
        }

        #region Dashlets

        [HttpPost]
        public virtual ActionResult SearchDashlets(DynamicQuery query)
        {
            var res = JDashManager.Provider.SearchDashlets(query);
            return new JsonNetResult(res);
        }


        [HttpGet]
        public virtual ActionResult GetDashlet(string id)
        {
            var res = JDashManager.Provider.GetDashlet(id);
            return new JsonNetResult(res);
        }


        [HttpGet]
        public virtual ActionResult GetDashboardDashlets(string dashboardId, bool withModules)
        {
            var res = JDashManager.Provider.GetDashboardDashlets(dashboardId, withModules);
            return new JsonNetResult(res);
        }

        [HttpPut]
        public virtual ActionResult SaveDashletConfig(string id, Config config)
        {
            var model = JDashManager.Provider.GetDashlet(id);
            if (model != null)
            {
                model.config = config;
                JDashManager.Provider.SaveDashlet(model);
            }
            return new EmptyResult();
        }
        [HttpPut]
        public virtual ActionResult SaveDashlet(string id, DashletModel model)
        {
            var res = JDashManager.Provider.SaveDashlet(model);
            return new JsonNetResult(res);
        }



        [HttpPost]
        public virtual ActionResult CreateDashlet(DashletCreateAndUpdateModel data)
        {
            data.model.metaData = new MetadataModel();
            JDashManager.Provider.CreateDashlet(data.model, data.positions);
            var res = data.model;
            return new JsonNetResult(res);
        }

        [HttpDelete]
        public virtual ActionResult DeleteDashlet(string id)
        {
            JDashManager.Provider.DeleteDashlet(id);
            return new EmptyResult();
        }
        [HttpPost]
        public virtual ActionResult UpdateDashletPositions(IEnumerable<UpdatePositionModel> positions)
        {
            JDashManager.Provider.UpdateDashletPositions(positions);
            return new EmptyResult();
        }

        #endregion

        #region DashletModules
        [HttpPost]
        public virtual ActionResult SearchDashletModules(DynamicQuery query)
        {
            var res = JDashManager.Provider.SearchDashletModules(query);
            return new JsonNetResult(res);
        }
        [HttpGet]
        public virtual ActionResult GetDashletModule(string id)
        {
            var res = JDashManager.Provider.GetDashletModule(id);
            return new JsonNetResult(res);
        }

        [HttpPut]
        public virtual ActionResult SaveDashletModule(DashletModuleModel model)
        {
            var res = JDashManager.Provider.SaveDashletModule(model);
            return new JsonNetResult(res);
        }

        [HttpPost]
        public virtual ActionResult CreateDashletModule(DashletModuleModel model)
        {
            model.metaData = model.metaData == null ? new MetadataModel() : model.metaData;
            var res = JDashManager.Provider.CreateDashletModule(model);
            return new JsonNetResult(res);
        }

        [HttpDelete]
        public virtual ActionResult DeleteDashletModule(string id)
        {
            JDashManager.Provider.DeleteDashletModule(id);
            return new EmptyResult();
        }

        #endregion
    }
}
