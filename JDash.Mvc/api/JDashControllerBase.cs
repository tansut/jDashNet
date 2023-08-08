using JDash.Models;
using JDash.Query;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Http;


namespace JDash.Mvc.api
{
    public class JDashController : ApiController
    {

  

        [HttpPost]
        public virtual DynamicResult<DashboardModel> SearchDashboards(DynamicQuery query)
        {
            return JDashManager.Provider.SearchDashboards(query);
        }

        [HttpGet]
        public virtual DashboardModel GetDashboard(string id)
        {
            return JDashManager.Provider.GetDashboard(id);
        }

        [HttpPut]
        public virtual DashboardModel SaveDashboard(DashboardModel model)
        {
            return JDashManager.Provider.SaveDashboard(model);
        }

        [HttpPost]
        public virtual DashboardModel CreateDashboard(DashboardModel model)
        {
            model.metaData = model.metaData == null ? new MetadataModel() : model.metaData;
            return JDashManager.Provider.CreateDashboard(model);
        }

        [HttpDelete]
        public virtual void DeleteDashboard(string id)
        {
            JDashManager.Provider.DeleteDashboard(id);
        }

        #region Dashlets

        [HttpPost]
        public virtual DynamicResult<DashletModel> SearchDashlets(DynamicQuery query)
        {
            return JDashManager.Provider.SearchDashlets(query);
        }


        [HttpGet]
        public virtual DashletModel GetDashlet(string id)
        {
            return JDashManager.Provider.GetDashlet(id);
        }


        [HttpGet]
        public virtual Dictionary<string, DynamicResult<object>> GetDashboardDashlets(string dashboardId, bool withModules)
        {
            return JDashManager.Provider.GetDashboardDashlets(dashboardId, withModules);
        }

        [HttpPut]
        public virtual void SaveDashletConfig(string id, Config config)
        {
            var model = this.GetDashlet(id);
            if (model != null)
            {
                model.config = config;
                JDashManager.Provider.SaveDashlet(model);
            }
        }
        [HttpPut]
        public virtual DashletModel SaveDashlet(string id, DashletModel model)
        {
            return JDashManager.Provider.SaveDashlet(model);
        }



        [HttpPost]
        public virtual DashletModel CreateDashlet(DashletCreateAndUpdateModel data)
        {
            data.model.metaData = new MetadataModel();
            JDashManager.Provider.CreateDashlet(data.model, data.positions);
            return data.model;

        }

        [HttpDelete]
        public virtual void DeleteDashlet(string id)
        {
            JDashManager.Provider.DeleteDashlet(id);
        }
        [HttpPost]
        public virtual void UpdateDashletPositions(IEnumerable<UpdatePositionModel> positions)
        {
            JDashManager.Provider.UpdateDashletPositions(positions);
        }

        #endregion

        #region DashletModules
        [HttpPost]
        public virtual DynamicResult<DashletModuleModel> SearchDashletModules(DynamicQuery query)
        {
            return JDashManager.Provider.SearchDashletModules(query);
        }
        [HttpGet]
        public virtual DashletModuleModel GetDashletModule(string id)
        {
            return JDashManager.Provider.GetDashletModule(id);
        }

        [HttpPut]
        public virtual DashletModuleModel SaveDashletModule(DashletModuleModel model)
        {
            return JDashManager.Provider.SaveDashletModule(model);
        }

        [HttpPost]
        public virtual DashletModuleModel CreateDashletModule(DashletModuleModel model)
        {
            model.metaData = model.metaData == null ? new MetadataModel() : model.metaData;
            return JDashManager.Provider.CreateDashletModule(model);
        }

        [HttpDelete]
        public virtual void DeleteDashletModule(string id)
        {
            JDashManager.Provider.DeleteDashletModule(id);
        }

        #endregion
    }
}
