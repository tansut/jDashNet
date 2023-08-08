using JDash.Models;
using JDash.Query;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace JDash.Mvc.Management.Areas.manapi.Controllers
{
    public class JDashManagementController : ApiController
    {
        #region DashletModules
        [HttpPost]
        public virtual DynamicResult<DashletModuleModel> SearchDashletModules(DynamicQuery query)
        {
            var provider = ProviderManager.CurrentProvider;
            return provider.SearchDashletModules(query);
        }
        [HttpGet]
        public virtual DashletModuleModel GetDashletModule(string id)
        {
            var provider = ProviderManager.CurrentProvider;
            return provider.GetDashletModule(id);
        }

        [HttpPut]
        public virtual DashletModuleModel SaveDashletModule(DashletModuleModel model)
        {
            var provider = ProviderManager.CurrentProvider;
            return provider.SaveDashletModule(model);
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
            var provider = ProviderManager.CurrentProvider;
            provider.DeleteDashletModule(id);
        }

        //[HttpGet]
        //public virtual List<string> GetDashletGroups()
        //{
        //    return ProviderManager.CurrentProvider.SearchDashletModules().data.Where(x => !string.IsNullOrEmpty(x.metaData.group)).Select(x => x.metaData.group).Distinct().ToList();
        //}

        #endregion
    }
}
