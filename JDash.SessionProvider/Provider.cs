using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using JDash.Provider;
using JDash.Extensions;
using JDash.Models;
using System.Linq.Expressions;
using JDash.Query;
using System.Reflection;
using JDash.Helpers;
namespace JDash.SessionProvider
{
    public class Provider : JDashProvider
    {

        private static long randomNum = 100000;

        internal static long RandomNum
        {
            get
            {
                return System.Threading.Interlocked.Increment(ref randomNum);
            }
        }

        private static object synObj = new object();

        public override string CurrentUser
        {
            get
            {
                return HttpContext.Current.Session.SessionID;
            }
        }

        private bool SessionInited
        {
            get
            {
                return HttpContext.Current.Session["sessionID"] != null;
            }
        }

        private string SessionID
        {
            get
            {
                return (string)HttpContext.Current.Session["sessionID"];
            }
            set
            {
                HttpContext.Current.Session["sessionID"] = value;
            }
        }

        public void InitializeSession(string sourceProvider)
        {
            if (!SessionInited)
            {
                lock (synObj)
                {
                    if (SessionInited)
                        return;

                    var activeProvider = JDashManager.Providers[sourceProvider];
                    var allDashboardModels = activeProvider.SearchDashboards().data;
                    var allDashletModules = activeProvider.SearchDashletModules().data;
                    var allDashlets = activeProvider.SearchDashlets().data;

                    foreach (var item in allDashboardModels)
                    {
                        this.CreateDashboard(item);
                    }

                    foreach (var item in allDashletModules)
                    {
                        this.CreateDashletModule(item);
                    }

                    foreach (var item in allDashlets)
                    {
                        this.CreateDashlet(item);
                    }
                    SessionID = HttpContext.Current.Session.SessionID;
                }
            }
        }


        public void setSession<T>(IEnumerable<T> items)
        {
            HttpContext.Current.Session[getSessionType(typeof(T))] = items;
        }

        public List<T> getFromSession<T>()
        {
            string sessionDefination = getSessionType(typeof(T));
            var results = HttpContext.Current.Session[sessionDefination] as IEnumerable<T>;
            if (results == null)
            {
                results = new List<T>();
            }
            return results.ToList();
        }

        private string getSessionType(Type itemType)
        {
            return string.Format("jdash-{0}", itemType.Name.ToString());
        }

        private string GetEntityName(Type type)
        {
            return type.FullName.ToLower();
        }

        public override DashboardModel GetDashboard(string id)
        {
            var dashboards = getFromSession<DashboardModel>();
            int did = int.Parse(id);
            try
            {
                return dashboards.Single(p => p.id == id);
            }
            catch (InvalidOperationException)
            {
                throw new ArgumentException("Invalid Dashboard Id");
            }
        }

        public override DashboardModel CreateDashboard(DashboardModel model)
        {
            model.EnsureLayout();
            var dashboards = getFromSession<DashboardModel>();
            if (string.IsNullOrWhiteSpace(model.id)) model.id = RandomNum.ToString();
            dashboards.Add(model);
            setSession<DashboardModel>(dashboards);
            return model;
        }

        public override DashboardModel SaveDashboard(DashboardModel model)
        {
            model.EnsureLayout();
            var dashboards = getFromSession<DashboardModel>();
            DashboardModel dashboard = null;
            try
            {
                dashboard = dashboards.Single(p => p.id == model.id);
            }
            catch (InvalidOperationException)
            {
                throw new ArgumentException("Invalid Dashboard Id");
            }
            dashboards.Remove(dashboard);
            dashboards.Add(model);
            setSession<DashboardModel>(dashboards);
            return model;
        }

        public override void DeleteDashboard(string id)
        {

            var dashboards = getFromSession<DashboardModel>();
            var did = int.Parse(id);
            var type = GetEntityName(typeof(DashboardModel));
            dashboards = dashboards.Where(d => d.id != id).ToList();
            setSession<DashboardModel>(dashboards);
        }


        public override DashletModuleModel GetDashletModule(string id)
        {
            var dashletModules = getFromSession<DashletModuleModel>();
            try
            {
                return dashletModules.Single(p => p.id == id);
            }
            catch (InvalidOperationException)
            {
                throw new ArgumentException("Invalid Module Id");
            }
        }



        public override DashletModuleModel CreateDashletModule(DashletModuleModel model)
        {
            var type = GetEntityName(typeof(DashletModuleModel));
            var dashletModules = getFromSession<DashletModuleModel>();
            if (string.IsNullOrWhiteSpace(model.id)) model.id = RandomNum.ToString(); 
            dashletModules.Add(model);
            setSession<DashletModuleModel>(dashletModules);
            return model;
        }

        public override void DeleteDashletModule(string id)
        {
            var type = GetEntityName(typeof(DashletModuleModel));
            var mid = int.Parse(id);
            var dashletModules = getFromSession<DashletModuleModel>();
            dashletModules = dashletModules.Where(p => p.id != id).ToList();
            setSession<DashletModuleModel>(dashletModules);
        }

        public override DashletModuleModel SaveDashletModule(DashletModuleModel model)
        {
            var dashletModules = getFromSession<DashletModuleModel>();
            var mid = int.Parse(model.id);
            DashletModuleModel module = null;
            try
            {
                module = dashletModules.Single(p => p.id == model.id);
            }
            catch (InvalidOperationException)
            {
                throw new ArgumentException("Invalid Module Id");
            }
            dashletModules.Remove(module);
            dashletModules.Add(model);
            setSession<DashletModuleModel>(dashletModules);
            return model;
        }




        public override DashletModel GetDashlet(string sid)
        {
            var dashlets = getFromSession<DashletModel>();
            try
            {
                return dashlets.Single(p => p.id == sid);
            }
            catch (InvalidOperationException)
            {
                throw new ArgumentException("Invalid Dashlet Id");
            }
        }


        public override void DeleteDashlet(string sid)
        {
            var type = GetEntityName(typeof(DashletModel));
            var dashlets = getFromSession<DashletModel>();
            DashletModel dashelt = null;
            try
            {
                dashelt = dashlets.Single(p => p.id == sid);
            }
            catch (InvalidOperationException)
            {
                throw new ArgumentException("Invalid Dashlet Id");
            }
            dashlets = dashlets.Where(p => p.id != sid).ToList();
            setSession<DashletModel>(dashlets);
        }


        public override void UpdateDashletPositions(IEnumerable<UpdatePositionModel> positions)
        {

            var allDashlets = getFromSession<DashletModel>();

            foreach (var pos in positions)
            {
                var dashlet = allDashlets.Single(p => p.id == pos.id);
                dashlet.position = pos.position;
            }
            //setSession<DashletModel>(allDashlets);
        }

        public override DashletModel SaveDashlet(DashletModel model)
        {
            var dashlets = getFromSession<DashletModel>();
            var modId = int.Parse(model.id);
            DashletModel dashlet;
            try
            {
                dashlet = dashlets.Single(p => p.id == model.id);
            }
            catch (InvalidOperationException)
            {
                throw new ArgumentException("Invalid Dashlet Id");
            }
            dashlets.Remove(dashlet);
            dashlets.Add(model);
            setSession<DashletModel>(dashlets);
            return model;
        }




        public override void StartTransaction()
        {
        }

        public override void Rollback()
        {
        }

        public override void Commit()
        {
        }



        public override bool CreateMetadata(string connectionString, bool checkMetadata = false)
        {
            return false;
        }

        public override string GetScript()
        {
            return string.Empty;
        }

        public override Query.DynamicResult<DashboardModel> SearchDashboards(Query.DynamicQuery query = null)
        {
            var list = getFromSession<DashboardModel>();
            return new DynamicResult<DashboardModel>() { data = list, meta = new MetadataResult() { count = list.Count } };
        }

        public override Query.DynamicResult<DashletModuleModel> SearchDashletModules(Query.DynamicQuery query = null)
        {
            var list = getFromSession<DashletModuleModel>();
            return new DynamicResult<DashletModuleModel>() { data = list, meta = new MetadataResult() { count = list.Count } };
        }




        public override DashletModel CreateDashlet(DashletModel model, IEnumerable<UpdatePositionModel> positions = null)
        {
            manageConfigs(model);
            var type = GetEntityName(typeof(DashletModel));
            var dashlets = getFromSession<DashletModel>();
            if (string.IsNullOrWhiteSpace(model.id)) model.id = RandomNum.ToString();
            dashlets.Add(model);
            if (positions != null)
                UpdateDashletPositions(positions);
            setSession<DashletModel>(dashlets);
            return model;
        }

        public override Dictionary<string, Query.DynamicResult<object>> GetDashboardDashlets(string dashboardId, bool withModules)
        {
            var dashId = int.Parse(dashboardId);
            Dictionary<string, DynamicResult<object>> result = new Dictionary<string, DynamicResult<object>>();
            var dashlets = getFromSession<DashletModel>().Where(p => p.dashboardId == dashboardId).ToList();
            var dashletResult = new DynamicResult<object>(dashlets, null);
            result.Add("dashlets", dashletResult);
            if (withModules && dashlets.Any())
            {
                var moduleIds = getFromSession<DashletModel>().Select(s => s.moduleId).Distinct();
                var modules = getFromSession<DashletModuleModel>().Where(s => moduleIds.Contains(s.id)).ToList();
                var modulesResult = new DynamicResult<object>(modules, null);
                result.Add("modules", modulesResult);
            }
            else
            {
                var mdls = new DynamicResult<object>();
                mdls.data = new List<DashletModuleModel>();
                result.Add("modules", mdls);
            }
            return result;
        }

        public override Query.DynamicResult<DashletModel> SearchDashlets(Query.DynamicQuery query = null)
        {
            throw new NotSupportedException();
        }


        public override IEnumerable<TagRelationModel> GetAllTagsRelations()
        {
            throw new NotSupportedException();
        }



        public override IEnumerable<TagModel> GetAllTags()
        {
            throw new NotSupportedException();
        }


        public override IEnumerable<DashboardModel> GetDashboardsOfUser(string username)
        {
            return this.SearchDashboards().data;
        }

        public override void ExecuteScript(string connectionString, string script, string statementSplit = "\r\n")
        {
            throw new NotSupportedException();
        }
    }
}
