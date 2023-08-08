using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using JDash.Provider;
using JDash.OracleProvider.Models;
using System.Data.EntityClient;
using JDash.Models;
using JDash.OracleProvider.Extensions;
using JDash.Extensions;
using System.Threading;
using System.Web;
using JDash.Exceptions;
using JDash.Query;
using JDash.Helpers;
using System.Reflection;
using System.Linq.Expressions;
using System.IO;
using Oracle.DataAccess.Client;
using System.Data;

namespace JDash.OracleProvider
{
    public class Provider : JDashProvider
    {
        LocalDataStoreSlot dataContextSlot = Thread.GetNamedDataSlot("dataContext");

        public Provider()
        {

        }

        internal Entities DataContext
        {
            get
            {
                Entities dataContext = null;


                if (HttpContext.Current == null)
                {
                    object data = Thread.GetData(dataContextSlot);
                    if (data == null)
                    {
                        data = new Entities(this.ConnectionString);
                        Thread.SetData(dataContextSlot, data);
                    }
                    dataContext = (Entities)data;
                }
                else if (HttpContext.Current.Items.Contains("__datacontext"))
                    dataContext = (Entities)HttpContext.Current.Items["__datacontext"];
                else
                {
                    dataContext = new Entities(this.ConnectionString);
                    if (HttpContext.Current != null)
                        HttpContext.Current.Items["__datacontext"] = dataContext;
                }

                return dataContext;

            }
        }


        public override void Initialize(string name, System.Collections.Specialized.NameValueCollection config)
        {
            base.Initialize(name, config);
            EntityConnectionStringBuilder entityBuilder = new EntityConnectionStringBuilder();
            entityBuilder.ProviderConnectionString = this.ConnectionString;
            entityBuilder.Provider = "Oracle.DataAccess.Client";
            entityBuilder.Metadata = @"res://*/Models.OracleDBModel.csdl|res://*/Models.OracleDBModel.ssdl|res://*/Models.OracleDBModel.msl";
            this.ConnectionString = entityBuilder.ToString();
        }
        private string GetEntityName(Type type)
        {
            return type.Name.ToLower();
        }




        public override DashboardModel GetDashboard(string id)
        {
            var did = int.Parse(id);
            DASHBOARD entity = null;
            try
            {
                entity = DataContext.DASHBOARD.Single(p => p.ID == did);
            }
            catch (InvalidOperationException)
            {
                throw new ArgumentException("Given dashboard id was not present in the dashboards");
            }
            CheckEntityAuthorization<DASHBOARD>(entity.ID, entity.CREATEDBY, Permission.view);
            return entity.ToDashboardModel(DataContext);

        }

        private void CheckEntityAuthorization<T>(int entityId, string createdUser, Permission permission)
        {
            if (DoAuthorization && !IsCurrentUserAdmin)
            {
                if (createdUser != CurrentUser)
                {
                    var everyOneAuth = AuthTarget.everyOne.ToString();
                    var roleNameAuth = AuthTarget.roleName.ToString();
                    var userNameAuth = AuthTarget.userName.ToString();
                    var perm = permission.ToString();
                    string[] userRoles = new string[0];
                    if (RoleProvider != null)
                        userRoles = RoleProvider.GetRolesForUser(CurrentUser);
                    var roleImplemented = userRoles.Any();
                    var type = GetEntityName(typeof(T));
                    if (!DataContext.ENTITYAUTH.Where(w => (w.ENTITYID == entityId && w.ENTITYTYPE == type && w.PERMISSION == perm)
                        && ((w.AUTHTYPE == everyOneAuth) || (w.AUTHTYPE == roleNameAuth && roleImplemented && userRoles.Contains(w.ROLEORUSER)) || (w.AUTHTYPE == userNameAuth && w.ROLEORUSER == CurrentUser))).Any())
                    {

                        string message = string.Format("Current user does not have the rights to {0} the {1}", permission.ToString(), type);
                        throw new UnauthorizedDataAccessException(message, CurrentUser, type, perm);
                    }
                }
            }
        }


        //edit
        public override DashboardModel CreateDashboard(DashboardModel model)
        {
            var dashboard = new Models.DASHBOARD();
            model.EnsureLayout();
            dashboard.AssignFrom(model);
            var type = GetEntityName(typeof(DASHBOARD));
            DataContext.DASHBOARD.AddObject(dashboard);
            DataContext.SaveChanges();
            if (model.authorization != null && model.authorization.Any())
                SaveControlAuth(model.authorization, dashboard.ID, type, false);
            if (model.metaData != null && model.metaData.tags != null && model.metaData.tags.Any())
                SaveControlTags(model.metaData.tags, dashboard.ID, type, true);
            dashboard.AssignTo(model, DataContext);
            return model;
        }


        public override DashboardModel SaveDashboard(DashboardModel model)
        {

            int dashid;
            if (int.TryParse(model.id, out dashid))
            {
                model.EnsureLayout();
                var dashboard = DataContext.DASHBOARD.Single(p => p.ID == dashid);
                var type = GetEntityName(typeof(DASHBOARD));
                CheckEntityAuthorization<DASHBOARD>(dashboard.ID, dashboard.CREATEDBY, Permission.edit);
                dashboard.AssignFrom(model);
                if (model.authorization != null && model.authorization.Any())
                    SaveControlAuth(model.authorization, dashid, type, false);
                else DeleteControlAuth(dashid, type);
                if (model.metaData != null && model.metaData.tags != null && model.metaData.tags.Any())
                    SaveControlTags(model.metaData.tags, dashid, type, false);
                else DeleteControlTagRelations(dashid, type);
                DataContext.SaveChanges();
                dashboard.AssignTo(model, DataContext);
            }
            return model;

        }

        public override void DeleteDashboard(string id)
        {
            var dashId = int.Parse(id);
            var type = GetEntityName(typeof(DASHBOARD));
            var dashboard = DataContext.DASHBOARD.Single(p => p.ID == dashId);
            CheckEntityAuthorization<DASHBOARD>(dashboard.ID, dashboard.CREATEDBY, Permission.delete);
            DataContext.DeleteObject(dashboard);
            DeleteControlTagRelations(dashId, type);
            DeleteControlAuth(dashId, type);
            DataContext.SaveChanges();
        }

        private void DeleteControlTagRelations(int controlID, string tcm)
        {

            var existingTagsRelations = DataContext.TAGRELATION.Where(p => p.CONTROLID == controlID && p.CONTROLLER == tcm).ToList();
            foreach (var item in existingTagsRelations)
            {
                DataContext.TAGRELATION.DeleteObject(item);
            }
        }

        private void DeleteControlAuth(int controlID, string tcm)
        {

            var existingControlAuth = DataContext.ENTITYAUTH.Where(p => p.ENTITYID == controlID && p.ENTITYTYPE == tcm).ToList();
            foreach (var item in existingControlAuth)
            {
                DataContext.ENTITYAUTH.DeleteObject(item);
            }
        }

        private void SaveControlAuth(List<KeyValuePair<string, PermissionModel>> auths, int controlID, string tcm, bool autoSave)
        {
            var controller = tcm.ToString();
            DeleteControlAuth(controlID, tcm);
            foreach (var auth in auths)
            {
                DataContext.ENTITYAUTH.AddObject(new ENTITYAUTH() { ENTITYID = controlID, ENTITYTYPE = tcm, ROLEORUSER = auth.Key, PERMISSION = auth.Value.permission.ToString(), AUTHTYPE = auth.Value.authTarget.ToString() });
            }
            if (autoSave)
                DataContext.SaveChanges();
        }

        private void SaveControlTags(IEnumerable<string> tags, int controlID, string tcm, bool autoSave)
        {
            var controller = tcm.ToString();
            DeleteControlTagRelations(controlID, tcm);
            foreach (var tag in tags)
            {
                var tagItem = DataContext.TAG.SingleOrDefault(p => p.TAGNAME == tag);
                if (tagItem == null)
                {
                    tagItem = new TAG();
                    tagItem.TAGNAME = tag;
                    tagItem.TAGRELATION.Add(new TAGRELATION() { CONTROLID = controlID, CONTROLLER = controller });
                    DataContext.TAG.AddObject(tagItem);
                }
                else
                {
                    DataContext.TAGRELATION.AddObject(new TAGRELATION() { CONTROLID = controlID, CONTROLLER = controller, TAGID = tagItem.ID });
                }
            }
            if (autoSave)
                DataContext.SaveChanges();
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


        public override DashletModuleModel CreateDashletModule(DashletModuleModel model)
        {
            var item = new Models.DASHLETMODULE();
            var type = GetEntityName(typeof(DASHLETMODULE));
            item.AssignFrom(model);
            DataContext.DASHLETMODULE.AddObject(item);
            DataContext.SaveChanges();
            if (model.authorization != null && model.authorization.Any())
                SaveControlAuth(model.authorization, item.ID, type, false);
            if (model.metaData != null && model.metaData.tags != null && model.metaData.tags.Any())
                SaveControlTags(model.metaData.tags, item.ID, GetEntityName(typeof(DASHLETMODULE)), true);
            item.AssignTo(model, DataContext);
            return model;
        }

        public override void DeleteDashletModule(string id)
        {

            int moduleID = int.Parse(id);
            var type = GetEntityName(typeof(DASHLETMODULE));
            var dashletModule = DataContext.DASHLETMODULE.Single(p => p.ID == moduleID);
            CheckEntityAuthorization<DASHLETMODULE>(dashletModule.ID, dashletModule.CREATEDBY, Permission.delete);
            DataContext.DeleteObject(dashletModule);
            DeleteControlAuth(moduleID, type);
            DeleteControlTagRelations(moduleID, type);
            DataContext.SaveChanges();
        }

        public override DashletModuleModel SaveDashletModule(DashletModuleModel model)
        {
            int moduleID = int.Parse(model.id); ;
            DASHLETMODULE dashmodule = new DASHLETMODULE();
            var type = GetEntityName(typeof(DashletModel));
            dashmodule = DataContext.DASHLETMODULE.Single(p => p.ID == moduleID);
            CheckEntityAuthorization<DASHLETMODULE>(dashmodule.ID, dashmodule.CREATEDBY, Permission.edit);
            dashmodule.AssignFrom(model);
            if (model.authorization != null && model.authorization.Any())
                SaveControlAuth(model.authorization, moduleID, type, false);
            else DeleteControlAuth(moduleID, type);
            if (model.metaData != null && model.metaData.tags != null && model.metaData.tags.Any())
                SaveControlTags(model.metaData.tags, moduleID, type, false);
            else DeleteControlTagRelations(moduleID, type);
            DataContext.SaveChanges();

            dashmodule.AssignTo(model, DataContext);
            return model;
        }



        public override DashletModuleModel GetDashletModule(string id)
        {
            var did = int.Parse(id);
            var dashletModule = DataContext.DASHLETMODULE.Single(p => p.ID == did);
            CheckEntityAuthorization<DASHLETMODULE>(dashletModule.ID, dashletModule.CREATEDBY, Permission.view);
            return dashletModule.ToDashletModuleModel(DataContext);
        }

        public override DashletModel GetDashlet(string id)
        {
            var dashlet = DataContext.DASHLET.Single(p => p.ID == int.Parse(id));
            CheckEntityAuthorization<DASHLET>(dashlet.ID, dashlet.CREATEDBY, Permission.view);
            return dashlet.ToDashletModel(DataContext);
        }

        private void manageConfigs(DashletModel model)
        {
            var module = model.module ?? this.GetDashletModule(model.moduleId);

            if (module.paneConfig != null)
            {
                foreach (var item in module.paneConfig)
                {
                    if (model.paneConfig == null)
                        model.paneConfig = new Config();
                    if (item.Value != null && !model.paneConfig.ContainsKey(item.Key))
                        model.paneConfig[item.Key] = item.Value;
                }
            }

            if (module.dashletConfig != null)
            {
                foreach (var item in module.dashletConfig)
                {
                    if (model.config == null)
                        model.config = new Config();
                    if (item.Value != null && !model.paneConfig.ContainsKey(item.Key))
                        model.config[item.Key] = item.Value;
                }
            }
        }

        public override DashletModel CreateDashlet(DashletModel model, IEnumerable<UpdatePositionModel> positions = null)
        {
            manageConfigs(model);
            var dashlet = new Models.DASHLET();
            dashlet.AssignFrom(model);
            var type = GetEntityName(typeof(DASHLET));
            DataContext.DASHLET.AddObject(dashlet);
            if (positions != null && positions.Any()) UpdateDashletPositions(positions);
            else DataContext.SaveChanges();
            if (model.authorization != null && model.authorization.Any())
                SaveControlAuth(model.authorization, dashlet.DASHBOARDID, type, false);
            if (model.metaData != null && model.metaData.tags != null && model.metaData.tags.Any())
                SaveControlTags(model.metaData.tags, dashlet.DASHBOARDID, GetEntityName(typeof(DASHLET)), true);
            model.id = dashlet.ID.ToString();
            dashlet.AssignTo(model, DataContext);
            return model;
        }

        public override void DeleteDashlet(string id)
        {
            var dashletId = int.Parse(id);
            var dashlet = DataContext.DASHLET.Single(p => p.ID == dashletId);
            var type = GetEntityName(typeof(DASHLET));
            CheckEntityAuthorization<DASHLET>(dashlet.ID, dashlet.CREATEDBY, Permission.delete);
            DataContext.DeleteObject(dashlet);
            DataContext.SaveChanges();
            DeleteControlAuth(dashletId, type);
            DeleteControlTagRelations(dashletId, type);
        }

        public override DashletModel SaveDashlet(DashletModel model)
        {

            var dashId = int.Parse(model.id);
            var dashlet = DataContext.DASHLET.Single(p => p.ID == dashId);
            var type = GetEntityName(typeof(DASHLET));
            CheckEntityAuthorization<DASHLET>(dashlet.ID, dashlet.CREATEDBY, Permission.edit);
            dashlet.AssignFrom(model);

            if (model.authorization != null && model.authorization.Any())
                SaveControlAuth(model.authorization, dashId, type, false);
            else DeleteControlAuth(dashId, type);
            if (model.metaData != null && model.metaData.tags != null && model.metaData.tags.Any())
                SaveControlTags(model.metaData.tags, dashId, type, false);
            else DeleteControlTagRelations(dashId, type);
            DataContext.SaveChanges();
            dashlet.AssignTo(model, DataContext);
            return model;
        }




        public override void UpdateDashletPositions(IEnumerable<UpdatePositionModel> positions)
        {

            var ids = positions.Select(p => p.id.ToInt()).ToList();
            var dashlets = DataContext.DASHLET.Where(p => ids.Contains(p.ID)).ToList();
            var dasboards = dashlets.Select(s => s.DASHBOARD).Distinct().ToList();
            foreach (var dashboard in dasboards)
            {
                CheckEntityAuthorization<DASHBOARD>(dashboard.ID, dashboard.CREATEDBY, Permission.edit);
            }
            foreach (var item in dashlets)
            {
                var newPos = positions.Where(p => p.id.ToInt() == item.ID).Single();
                item.POSITION = Serialization.JsonStringify(newPos.position);
            }
            DataContext.SaveChanges();
        }


        public override Dictionary<string, DynamicResult<object>> GetDashboardDashlets(string dashboardId, bool withModules)
        {
            var dashId = int.Parse(dashboardId);
            var entity = DataContext.DASHBOARD.Single(p => p.ID == dashId);
            CheckEntityAuthorization<DASHBOARD>(entity.ID, entity.CREATEDBY, Permission.view);
            Dictionary<string, DynamicResult<object>> result = new Dictionary<string, DynamicResult<object>>();
            var dashlets = DataContext.DASHLET.Where(p => p.DASHBOARDID == dashId).ToList();
            var dashletResult = new DynamicResult<object>(dashlets.Select(s => s.ToDashletModel(DataContext)).ToList(), null);
            result.Add("dashlets", dashletResult);
            if (withModules && dashlets.Any())
            {
                var modules = dashlets.Select(s => s.DASHLETMODULE).Distinct();
                var modulesResult = new DynamicResult<object>(modules.Select(s => s.ToDashletModuleModel(DataContext)).ToList(), null);
                result.Add("modules", modulesResult);
            }
            else
            {
                result.Add("modules", new DynamicResult<object>());
            }
            return result;
        }


        public override IEnumerable<TagModel> GetAllTags()
        {
            return DataContext.TAG.ToList().Select(p => p.ToTagModel()).ToList();
        }


        private static MethodInfo orderByMethod =
      MethodOf(() => Enumerable.OrderBy(default(IEnumerable<object>), default(Func<object, object>)))
          .GetGenericMethodDefinition();

        private static MethodInfo orderByDescendingMethod =
            MethodOf(() => Enumerable.OrderByDescending(default(IEnumerable<object>), default(Func<object, object>)))
                .GetGenericMethodDefinition();

        private static MethodInfo thenByMethod =
            MethodOf(() => Enumerable.ThenBy(default(IOrderedEnumerable<object>), default(Func<object, object>)))
                .GetGenericMethodDefinition();

        private static MethodInfo thenByDescendingMethod =
            MethodOf(() => Enumerable.ThenByDescending(default(IOrderedEnumerable<object>), default(Func<object, object>)))
                .GetGenericMethodDefinition();

        private static MethodInfo MethodOf<T>(Expression<Func<T>> method)
        {
            MethodCallExpression mce = (MethodCallExpression)method.Body;
            MethodInfo mi = mce.Method;
            return mi;
        }
        private IQueryable<T> FilterEntity<T>(DynamicQuery query) where T : class
        {
            var result = DataContext.CreateObjectSet<T>().AsQueryable();
            if (DoAuthorization)
            {
                result = GetPermissionQuery(result);

            }
            if (query != null)
            {
                if (query.filter != null)
                {
                    result = ApplyFilters(query.filter, result);
                }
                if (query.sort != null)
                {
                    result = ApplyOrders(query.sort, result).AsQueryable();
                }
                else
                {
                    if (query.paging != null)
                    {
                        result = ApplyOrders(new Sort[] { new Sort() { field = "id", op = SortDirection.asc } }, result).AsQueryable();
                    }
                }
            }
            return result;

        }
        private MemberExpression GetPropertyExpression<T>(string propertyName, Expression param)
        {
            PropertyInfo property = typeof(T).GetProperty(propertyName);
            if (property == null)
                return null;
            Expression iterate = param;
            string[] parts = propertyName.Split('.');
            foreach (var pr in parts)
            {
                iterate = Expression.PropertyOrField(iterate, pr);
            }
            if (iterate != param)
                return (MemberExpression)iterate;
            else return Expression.MakeMemberAccess(param, property);
        }

        private Dictionary<string, string> mixMetaDictionary(Dictionary<string, string> dictionary)
        {

            foreach (string key in metaDataFieldDictionary.Keys)
            {
                dictionary.Add(key, metaDataFieldDictionary[key]);
            }
            return dictionary;
        }

        private Dictionary<string, string> metaDataFieldDictionary
        {
            get
            {
                return new Dictionary<string, string>(){ 
                 {"metaData.group","GROUPNAME"},
                 {"metaData.description","DESCRIPTION"},
                 {"metaData.createdBy","CREATEDBY"},
                 {"metaData.modifiedBy","MODIFIEDBY"},
                 {"metaData.sharedBy","SHAREDBY"},
                 {"metaData.created","CREATED"},
                 {"metaData.modified","MODIFIED"},
                 {"metaData.shared","SHARED"},
                 {"metaData.userData","USERDATA"}};

            }
        }

        private Dictionary<string, string> dashBoardFieldDictionary
        {
            get
            {
                return mixMetaDictionary(new Dictionary<string, string>()
                {            
                         {"id","ID"},
                         {"title","TITLE"},
                         {"groupOrder","GROUPORDER"},
                         {"viewOrder","VIEWORDER"},
                         {"layout","LAYOUT"},
                         {"config","CONFIG"},
                         {"paneConfig","PANECONFIG"},
                         {"style","STYLE"},
                         {"cls","CLS"},
                         {"attr","ATTR"}                              
                });

            }
        }

        private Dictionary<string, string> dashletFieldDictionary
        {
            get
            {
                return mixMetaDictionary(new Dictionary<string, string>(){
                    {"id","ID"},
                    {"dashboardId","DASHBOARDID"},
                    {"moduleId","DASHLETMODULEID"},
                    {"title","TITLE"},
                    {"config","CONFIG"},
                    {"paneConfig","PANECONFIG"},                    
                    {"position","POSITION"},
                    {"style","STYLE"},
                    {"cls","CLS"},
                    {"attr","ATTR"}  
                });
            }
        }

        private Dictionary<string, string> dashletModuleFieldDictionary
        {
            get
            {
                return mixMetaDictionary(new Dictionary<string, string>(){
                    {"id","ID"},
                    {"path","PATH"},
                    {"title","TITLE"},
                    {"config","CONFIG"},
                    {"dashletConfig","DASHLETCONFIG"},
                    {"paneConfig","PANECONFIG"},
                    {"viewOrder","VIEWORDER"},
                    {"groupOrder","GROUPORDER"},
                    {"style","STYLE"},
                    {"cls","CLS"},
                    {"attr","ATTR"}                    
                });
            }
        }

        private string ConvertToSourceField(string clientFieldName, Dictionary<string, string> fieldDictionary)
        {
            if (!fieldDictionary.ContainsKey(clientFieldName)) throw new ArgumentException(string.Format("Unable to match '{0}' with datasource field dictionary", clientFieldName));
            return fieldDictionary[clientFieldName];
        }

        private Filter convertFieldParamater(Filter filter, Dictionary<string, string> fieldDictionary)
        {
            filter.field = ConvertToSourceField(filter.field, fieldDictionary);

            return filter;
        }

        private Sort convertSortParamater(Sort sort, Dictionary<string, string> fieldDictionary)
        {
            sort.field = ConvertToSourceField(sort.field, fieldDictionary);

            return sort;
        }

        private IQueryable<T> ApplyFilters<T>(FilterParam filterQuery, IQueryable<T> query)
        {
            Expression whereExp = null;
            ParameterExpression pe = Expression.Parameter(typeof(T), "w");
            foreach (var filter in filterQuery.filters)
            {
                MemberExpression memExp = GetPropertyExpression<T>(filter.field, pe);
                PropertyInfo property = typeof(T).GetProperty(filter.field);
                Expression boolExp = filter.BuildExpression(memExp, pe);
                if (boolExp != null)
                {
                    if (whereExp == null)
                        whereExp = boolExp;
                    else whereExp = filterQuery.op == FilterOperator.and ? Expression.AndAlso(whereExp, boolExp) :
                        Expression.Or(whereExp, boolExp);
                }
            }
            if (whereExp != null)
            {
                var exp = Expression.Lambda<Func<T, bool>>(whereExp, pe);
                query = query.Where(exp);
            }
            return query;
        }
        private IOrderedEnumerable<T> ApplyOrders<T>(IEnumerable<Sort> orders, IQueryable<T> query)
        {
            bool thenBy = false;
            IOrderedEnumerable<T> result = null;
            foreach (var order in orders)
            {

                ParameterExpression param = Expression.Parameter(typeof(T), "o");
                PropertyInfo property = typeof(T).GetProperty(order.field);
                var propertyType = property.PropertyType;

                if (thenBy)
                {
                    var prevExpr = Expression.Parameter(typeof(IOrderedEnumerable<T>), order.field);
                    var expr1 = Expression.Lambda<Func<IOrderedEnumerable<T>, IOrderedEnumerable<T>>>(
                        Expression.Call(
                        (order.op == SortDirection.asc ? thenByMethod : thenByDescendingMethod).MakeGenericMethod(typeof(T), propertyType),
                            prevExpr,
                            Expression.Lambda(
                                typeof(Func<,>).MakeGenericType(typeof(T), propertyType),
                                Expression.MakeMemberAccess(param, property),
                                param)
                            ),
                        prevExpr)
                        .Compile();

                    result = expr1(result);
                }
                else
                {
                    var prevExpr = Expression.Parameter(typeof(IQueryable<T>), order.field);
                    var expr1 = Expression.Lambda<Func<IQueryable<T>, IOrderedEnumerable<T>>>(
                        Expression.Call(
                            (order.op == SortDirection.asc ? orderByMethod : orderByDescendingMethod).MakeGenericMethod(typeof(T), propertyType),
                            prevExpr,
                            Expression.Lambda(
                                typeof(Func<,>).MakeGenericType(typeof(T), propertyType),
                                Expression.MakeMemberAccess(param, property),
                                param)
                            ),
                        prevExpr)
                        .Compile();

                    result = expr1(query);
                    thenBy = true;
                }
            }

            return result;
        }
        private IQueryable<T> ApplyPaging<T>(Paging paging, IQueryable<T> query)
        {
            if (paging.skip.HasValue)
                query = query.Skip(paging.skip.Value);
            if (paging.take.HasValue)
                query = query.Take(paging.take.Value);
            return query;
        }



        private IQueryable<T> GetPermissionQuery<T>(IQueryable<T> query)
        {
            var everyOneAuth = AuthTarget.everyOne.ToString();
            var roleNameAuth = AuthTarget.roleName.ToString();
            var userNameAuth = AuthTarget.userName.ToString();
            var perm = Permission.view.ToString();
            var entityType = GetEntityName(typeof(T));
            var user = CurrentUser;
            string[] userRoles = new string[0];
            if (RoleProvider != null)
                userRoles = RoleProvider.GetRolesForUser(CurrentUser);
            var roleImplemented = userRoles.Any();
            if (typeof(T) == typeof(DASHBOARD))
            {
                return (IQueryable<T>)(from entity in (IQueryable<DASHBOARD>)query
                                       from auth in DataContext.ENTITYAUTH
                                       where ((entity.ID == auth.ENTITYID || entity.CREATEDBY == user)
                                       && auth.PERMISSION == perm && auth.ENTITYTYPE == entityType && ((auth.AUTHTYPE == everyOneAuth) || (auth.AUTHTYPE == roleNameAuth && roleImplemented && userRoles.Contains(auth.ROLEORUSER)) || (auth.AUTHTYPE == userNameAuth && auth.ROLEORUSER == user)))
                                       select entity);
            }
            else
                if (typeof(T) == typeof(DASHLET))
                {

                    return (IQueryable<T>)(from entity in (IQueryable<DASHLET>)query
                                           from auth in DataContext.ENTITYAUTH
                                           where ((entity.ID == auth.ENTITYID || entity.CREATEDBY == user)
                                           && auth.PERMISSION == perm && auth.ENTITYTYPE == entityType && ((auth.AUTHTYPE == everyOneAuth) || (auth.AUTHTYPE == roleNameAuth && userRoles.Contains(auth.ROLEORUSER)) || (auth.AUTHTYPE == userNameAuth && auth.ROLEORUSER == user)))
                                           select entity);

                }
                else
                    if (typeof(T) == typeof(DASHLETMODULE))
                    {
                        return (IQueryable<T>)(from entity in (IQueryable<DASHLETMODULE>)query
                                               from auth in DataContext.ENTITYAUTH
                                               where ((entity.ID == auth.ENTITYID || entity.CREATEDBY == user)
                                               && auth.PERMISSION == perm && auth.ENTITYTYPE == entityType && ((auth.AUTHTYPE == everyOneAuth) || (auth.AUTHTYPE == roleNameAuth && userRoles.Contains(auth.ROLEORUSER)) || (auth.AUTHTYPE == userNameAuth && auth.ROLEORUSER == user)))
                                               select entity);
                    }

            return query;


        }

        public override DynamicResult<DashboardModel> SearchDashboards(DynamicQuery query = null)
        {
            if (query != null)
            {
                if (query.filter != null && query.filter.filters != null && query.filter.filters.Any())
                    query.filter.filters = query.filter.filters.Select(x => convertFieldParamater(x, dashBoardFieldDictionary)).ToList();
                if (query.sort != null && query.sort.Any())
                    query.sort = query.sort.Select(x => convertSortParamater(x, dashBoardFieldDictionary)).ToList();
            }
            var result = FilterEntity<DASHBOARD>(query);
            var count = result.Count();
            if (query != null && query.paging != null)
            {
                result = ApplyPaging(query.paging, result);
            }
            return new DynamicResult<DashboardModel>() { data = result.ToList().Select(s => s.ToDashboardModel(DataContext)).ToList(), meta = new MetadataResult() { count = count } };
        }

        public override DynamicResult<DashletModel> SearchDashlets(DynamicQuery query = null)
        {
            if (query != null)
            {
                if (query.filter != null && query.filter.filters != null && query.filter.filters.Any())
                    query.filter.filters = query.filter.filters.Select(x => convertFieldParamater(x, dashletFieldDictionary)).ToList();
                if (query.sort != null && query.sort.Any())
                    query.sort = query.sort.Select(x => convertSortParamater(x, dashletFieldDictionary)).ToList();
            }
            var result = FilterEntity<DASHLET>(query);
            var count = result.Count();
            if (query != null && query.paging != null)
            {
                result = ApplyPaging(query.paging, result);
            }
            return new DynamicResult<DashletModel>() { data = result.ToList().Select(s => s.ToDashletModel(DataContext)).ToList(), meta = new MetadataResult() { count = count } };
        }

        public override DynamicResult<DashletModuleModel> SearchDashletModules(DynamicQuery query = null)
        {
            if (query != null)
            {
                if (query.filter != null && query.filter.filters != null && query.filter.filters.Any())
                    query.filter.filters = query.filter.filters.Select(x => convertFieldParamater(x, dashletModuleFieldDictionary)).ToList();
                if (query.sort != null && query.sort.Any())
                    query.sort = query.sort.Select(x => convertSortParamater(x, dashletModuleFieldDictionary)).ToList();
            }
            var result = FilterEntity<DASHLETMODULE>(query);
            var count = result.Count();
            if (query != null && query.paging != null)
            {
                result = ApplyPaging(query.paging, result);
            }
            return new DynamicResult<DashletModuleModel>() { data = result.ToList().Select(s => s.ToDashletModuleModel(DataContext)).ToList(), meta = new MetadataResult() { count = count } };
        }
        protected string GetResourceText(string resourceName)
        {
            Stream stream = Assembly.GetExecutingAssembly().GetManifestResourceStream(resourceName);
            StreamReader reader = new StreamReader(stream, Encoding.Default);
            string res = reader.ReadToEnd();
            stream.Close();
            return res;
        }

        public override string GetScript()
        {
            return GetResourceText("JDash.OracleProvider.Models.Metadata.sql");
        }

        public override void CreateMetadata(string connectionString)
        {
            using (OracleConnection db = new OracleConnection(connectionString))
            {
                db.Open();
                string sql = "";
                try
                {
                    sql = GetScript();
                }
                catch (Exception)
                {
                    throw;
                }

                using (OracleCommand cmd = db.CreateCommand())
                {
                    var lines = sql.Split(new string[] { "--end line--" }, StringSplitOptions.RemoveEmptyEntries);
                    foreach (var line in lines)
                    {
                        if (!string.IsNullOrWhiteSpace(line))
                        {
                            if (line.Contains("create or replace TRIGGER"))
                            {
                                cmd.CommandText = line;
                            }
                            else
                            {
                                cmd.CommandText = line.Trim().TrimEnd(";\r\n".ToCharArray());
                            }
                            cmd.CommandType = CommandType.Text;
                            cmd.ExecuteNonQuery();
                        }
                    }
                }
                db.Close();
            }
        }


        public override IEnumerable<TagRelationModel> GetAllTagsRelations()
        {
            return DataContext.TAGRELATION.ToList().Select(p => p.ToTagRelationModel()).ToList();
        }
    }
}
