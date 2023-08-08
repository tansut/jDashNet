using JDash;
using JDash.Models;
using JDash.Mvc.Management;
using JDash.Provider;
using JDash.Query;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Filters;

namespace JDashMvc.Management.Controllers
{

    public class JDashManagementController : ApiController
    {
        private JDashProvider currentProvider;

        public JDashProvider CurrentProvider
        {
            get
            {
                var currentProvider = ProviderManager.CurrentProvider;
                if (currentProvider == null)
                {
                    var resp = new HttpResponseMessage(HttpStatusCode.BadRequest)
                    {
                        ReasonPhrase = "Cannot connect to the configuration database or Unable to connect to database.Check database connection information and make sure the database server is running."
                    };
                    throw new HttpResponseException(resp);
                }
                else
                {
                    return currentProvider;
                }
            }
        }

        [HttpPost]
        public virtual DynamicResult<DashletModuleModel> SearchDashletModules(DynamicQuery query)
        {
            return CurrentProvider.SearchDashletModules(query);
        }
        [HttpGet]
        public virtual DashletModuleModel GetDashletModule(string id)
        {
            return CurrentProvider.GetDashletModule(id);
        }
        [HttpPut]
        public virtual DashletModuleModel SaveDashletModule(DashletModuleModel model)
        {
            return CurrentProvider.SaveDashletModule(model);
        }
        [HttpPost]
        public virtual DashletModuleModel CreateDashletModule(DashletModuleModel model)
        {
            model.metaData = model.metaData == null ? new MetadataModel() : model.metaData;
            return CurrentProvider.CreateDashletModule(model);
        }
        [HttpDelete]
        public virtual void DeleteDashletModule(string id)
        {
            CurrentProvider.DeleteDashletModule(id);
        }
        [HttpGet]
        public virtual List<string> GetDashletGroups()
        {
            return CurrentProvider.SearchDashletModules().data.Where(x => !string.IsNullOrEmpty(x.metaData.group)).Select(x => x.metaData.group).Distinct().ToList();
        }


    }

}
