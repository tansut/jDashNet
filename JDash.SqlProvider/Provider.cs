using System;
using System.Collections.Generic;
using System.Data.EntityClient;
using System.Linq;
using System.Text;
using JDash.Models;
using JDash.Provider;
using JDash.SqlProvider.Models;
using JDash.SqlProvider.Extensions;
using JDash.Extensions;
using JDash.Query;
using System.Linq.Expressions;
using System.Reflection;
using System.Web;
using System.Threading;
using JDash.Exceptions;
using System.Collections;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using JDash.Helpers;

namespace JDash.SqlProvider
{
    public class Provider : JDashProvider
    {
        LocalDataStoreSlot dataContextSlot = Thread.GetNamedDataSlot("dataContext");

        public Provider()
        {

        }

        internal DashEntity DataContext
        {
            get
            {
                DashEntity dataContext = null;


                if (HttpContext.Current == null)
                {
                    object data = Thread.GetData(dataContextSlot);
                    if (data == null)
                    {
                        data = new DashEntity(this.EntityConnStr());
                        Thread.SetData(dataContextSlot, data);
                    }
                    dataContext = (DashEntity)data;
                }
                else if (HttpContext.Current.Items.Contains("__datacontext"))
                    dataContext = (DashEntity)HttpContext.Current.Items["__datacontext"];
                else
                {
                    dataContext = new DashEntity(this.EntityConnStr());
                    if (HttpContext.Current != null)
                        HttpContext.Current.Items["__datacontext"] = dataContext;
                }

                return dataContext;

            }
        }

        private string EntityConnStr()
        {
            EntityConnectionStringBuilder entityBuilder = new EntityConnectionStringBuilder();
            entityBuilder.ProviderConnectionString = this.ConnectionString;
            entityBuilder.Provider = "System.Data.SqlClient";
            entityBuilder.Metadata = @"res://*/Models.DbModel.csdl|res://*/Models.DbModel.ssdl|res://*/Models.DbModel.msl";
            return entityBuilder.ToString();
        }

        public override void Initialize(string name, System.Collections.Specialized.NameValueCollection config)
        {
            base.Initialize(name, config);

        }
        private string GetEntityName(Type type)
        {
            return type.Name.ToLower();
        }




        public override DashboardModel GetDashboard(string id)
        {
            var did = int.Parse(id);
            Dashboard entity = null;
            try
            {
                entity = DataContext.Dashboard.Single(p => p.id == did);
            }
            catch (InvalidOperationException)
            {
                throw new ArgumentException("No such dashboard id");
            }
            CheckEntityAuthorization<Dashboard>(entity.id, entity.createdBy, Permission.view);
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
                    bool result = false;
                    if (permission == Permission.view)
                    {
                        result = DataContext.EntityAuth.Where(w => (w.entityId == entityId && w.entityType == type)
                         && ((w.authType == everyOneAuth) || (w.authType == roleNameAuth && roleImplemented && userRoles.Contains(w.roleOrUser)) || (w.authType == userNameAuth && w.roleOrUser == CurrentUser))).Any();
                    }
                    else
                    {
                        result = DataContext.EntityAuth.Where(w => (w.entityId == entityId && w.entityType == type && w.permission == perm)
                        && ((w.authType == everyOneAuth) || (w.authType == roleNameAuth && roleImplemented && userRoles.Contains(w.roleOrUser)) || (w.authType == userNameAuth && w.roleOrUser == CurrentUser))).Any();
                    }
                    if (!result)
                    {

                        string message = string.Format("Current user does not have the rights to {0} the {1}", permission.ToString(), type);
                        throw new UnauthorizedDataAccessException(message, CurrentUser, type, perm);
                    }
                }
            }
        }

        private void EnsureMetadata(MetadataModel meta)
        {
            if (string.IsNullOrEmpty(meta.createdBy))
            try
            {
                meta.createdBy = CurrentUser;
            }
            catch 
            {
                meta.createdBy = Thread.CurrentPrincipal.Identity.Name;                
            }
        }

        //edit
        public override DashboardModel CreateDashboard(DashboardModel model)
        {
            var dashboard = new Models.Dashboard();
            EnsureMetadata(model.metaData);
            model.EnsureLayout();
            dashboard.AssignFrom(model);
            var type = GetEntityName(typeof(Dashboard));
            DataContext.Dashboard.AddObject(dashboard);
            DataContext.SaveChanges();
            if (model.authorization != null && model.authorization.Any())
                SaveControlAuth(model.authorization, dashboard.id, type, true);
            if (model.metaData != null && model.metaData.tags != null && model.metaData.tags.Any())
                SaveControlTags(model.metaData.tags, dashboard.id, type, true);
            dashboard.AssignTo(model, DataContext);
            return model;
        }


        public override DashboardModel SaveDashboard(DashboardModel model)
        {

            int dashid;
            if (int.TryParse(model.id, out dashid))
            {
                model.EnsureLayout();
                var dashboard = DataContext.Dashboard.Single(p => p.id == dashid);
                var type = GetEntityName(typeof(Dashboard));
                CheckEntityAuthorization<Dashboard>(dashboard.id, dashboard.createdBy, Permission.edit);
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
            var type = GetEntityName(typeof(Dashboard));
            var dashboard = DataContext.Dashboard.Single(p => p.id == dashId);
            CheckEntityAuthorization<Dashboard>(dashboard.id, dashboard.createdBy, Permission.delete);
            DataContext.DeleteObject(dashboard);
            DeleteControlTagRelations(dashId, type);
            DeleteControlAuth(dashId, type);
            DataContext.SaveChanges();
        }

        private void DeleteControlTagRelations(int controlID, string tcm)
        {

            var existingTagsRelations = DataContext.TagRelation.Where(p => p.controlId == controlID && p.controller == tcm).ToList();
            foreach (var item in existingTagsRelations)
            {
                DataContext.TagRelation.DeleteObject(item);
            }
        }

        private void DeleteControlAuth(int controlID, string tcm)
        {

            var existingControlAuth = DataContext.EntityAuth.Where(p => p.entityId == controlID && p.entityType == tcm).ToList();
            foreach (var item in existingControlAuth)
            {
                DataContext.EntityAuth.DeleteObject(item);
            }
        }

        private void SaveControlAuth(List<KeyValuePair<string, PermissionModel>> auths, int controlID, string tcm, bool autoSave)
        {
            var controller = tcm.ToString();
            DeleteControlAuth(controlID, tcm);
            foreach (var auth in auths)
            {
                DataContext.EntityAuth.AddObject(new EntityAuth() { entityId = controlID, entityType = tcm, roleOrUser = auth.Key, permission = auth.Value.permission.ToString(), authType = auth.Value.authTarget.ToString() });
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
                var tagItem = DataContext.Tag.SingleOrDefault(p => p.tagName == tag);
                if (tagItem == null)
                {
                    tagItem = new Tag();
                    tagItem.tagName = tag;
                    tagItem.TagRelation.Add(new TagRelation() { controlId = controlID, controller = controller });
                    DataContext.Tag.AddObject(tagItem);
                }
                else
                {
                    DataContext.TagRelation.AddObject(new TagRelation() { controlId = controlID, controller = controller, tagId = tagItem.id });
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
            var item = new Models.DashletModule();
            EnsureMetadata(model.metaData);
            var type = GetEntityName(typeof(DashletModule));
            item.AssignFrom(model);
            DataContext.DashletModule.AddObject(item);
            DataContext.SaveChanges();
            if (model.authorization != null && model.authorization.Any())
                SaveControlAuth(model.authorization, item.id, type, true);
            if (model.metaData != null && model.metaData.tags != null && model.metaData.tags.Any())
                SaveControlTags(model.metaData.tags, item.id, GetEntityName(typeof(DashletModule)), true);
            item.AssignTo(model, DataContext);
            return model;
        }

        public override void DeleteDashletModule(string id)
        {

            int moduleID = int.Parse(id);
            var type = GetEntityName(typeof(DashletModule));
            var dashletModule = DataContext.DashletModule.Single(p => p.id == moduleID);
            CheckEntityAuthorization<DashletModule>(dashletModule.id, dashletModule.createdBy, Permission.delete);
            DataContext.DeleteObject(dashletModule);
            DeleteControlAuth(moduleID, type);
            DeleteControlTagRelations(moduleID, type);
            DataContext.SaveChanges();
        }

        public override DashletModuleModel SaveDashletModule(DashletModuleModel model)
        {
            int moduleID = int.Parse(model.id); ;
            DashletModule dashmodule = new DashletModule();
            var type = GetEntityName(typeof(DashletModule));
            dashmodule = DataContext.DashletModule.Single(p => p.id == moduleID);
            CheckEntityAuthorization<DashletModule>(dashmodule.id, dashmodule.createdBy, Permission.edit);
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
            var dashletModule = DataContext.DashletModule.Single(p => p.id == did);
            CheckEntityAuthorization<DashletModule>(dashletModule.id, dashletModule.createdBy, Permission.view);
            return dashletModule.ToDashletModuleModel(DataContext);
        }

        public override DashletModel GetDashlet(string id)
        {
            var did = int.Parse(id);
            var dashlet = DataContext.Dashlet.Single(p => p.id == did);
            CheckEntityAuthorization<Dashlet>(dashlet.id, dashlet.createdBy, Permission.view);
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
            EnsureMetadata(model.metaData);
            var dashlet = new Models.Dashlet();
            dashlet.AssignFrom(model);
            var type = GetEntityName(typeof(Dashlet));
            DataContext.Dashlet.AddObject(dashlet);
            if (positions != null && positions.Any()) UpdateDashletPositions(positions);
            else DataContext.SaveChanges();
            if (model.authorization != null && model.authorization.Any())
                SaveControlAuth(model.authorization, dashlet.dashboardId, type, true);
            if (model.metaData != null && model.metaData.tags != null && model.metaData.tags.Any())
                SaveControlTags(model.metaData.tags, dashlet.dashboardId, GetEntityName(typeof(Dashlet)), true);
            model.id = dashlet.id.ToString();
            dashlet.AssignTo(model, DataContext);
            return model;
        }

        public override void DeleteDashlet(string id)
        {
            var dashletId = int.Parse(id);
            var dashlet = DataContext.Dashlet.Single(p => p.id == dashletId);
            var type = GetEntityName(typeof(Dashlet));
            CheckEntityAuthorization<Dashlet>(dashlet.id, dashlet.createdBy, Permission.delete);
            DataContext.DeleteObject(dashlet);
            DataContext.SaveChanges();
            DeleteControlAuth(dashletId, type);
            DeleteControlTagRelations(dashletId, type);
        }

        public override DashletModel SaveDashlet(DashletModel model)
        {

            var dashId = int.Parse(model.id);
            var dashlet = DataContext.Dashlet.Single(p => p.id == dashId);
            var type = GetEntityName(typeof(Dashlet));
            CheckEntityAuthorization<Dashlet>(dashlet.id, dashlet.createdBy, Permission.edit);
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
            var dashlets = DataContext.Dashlet.Where(p => ids.Contains(p.id)).ToList();
            var dasboards = dashlets.Select(s => s.Dashboard).Distinct().ToList();
            foreach (var dashboard in dasboards)
            {
                CheckEntityAuthorization<Dashboard>(dashboard.id, dashboard.createdBy, Permission.edit);
            }
            foreach (var item in dashlets)
            {
                var newPos = positions.Where(p => p.id.ToInt() == item.id).Single();
                item.position = Serialization.JsonStringify(newPos.position);
            }
            DataContext.SaveChanges();
        }


        public override Dictionary<string, DynamicResult<object>> GetDashboardDashlets(string dashboardId, bool withModules)
        {
            var dashId = int.Parse(dashboardId);
            var entity = DataContext.Dashboard.Single(p => p.id == dashId);
            CheckEntityAuthorization<Dashboard>(entity.id, entity.createdBy, Permission.view);
            Dictionary<string, DynamicResult<object>> result = new Dictionary<string, DynamicResult<object>>();
            var dashlets = DataContext.Dashlet.Where(p => p.dashboardId == dashId).ToList();
            var dashletResult = new DynamicResult<object>(dashlets.Select(s => s.ToDashletModel(DataContext)).ToList(), null);
            result.Add("dashlets", dashletResult);
            if (withModules && dashlets.Any())
            {
                var modules = dashlets.Select(s => s.DashletModule).Distinct();
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
            return DataContext.Tag.ToList().Select(p => p.ToTagModel()).ToList();
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
                 {"metaData.group","groupName"},
                 {"metaData.description","description"},
                 {"metaData.createdBy","createdBy"},
                 {"metaData.modifiedBy","modifiedBy"},
                 {"metaData.sharedBy","sharedBy"},
                 {"metaData.created","created"},
                 {"metaData.modified","modified"},
                 {"metaData.shared","shared"},
                 {"metaData.userData","userData"}};

            }
        }

        private Dictionary<string, string> dashBoardFieldDictionary
        {
            get
            {
                return mixMetaDictionary(new Dictionary<string, string>()
                {            
                         {"id","id"},
                         {"title","title"},
                         {"groupOrder","groupOrder"},
                         {"viewOrder","viewOrder"},
                         {"layout","layout"},
                         {"config","config"},
                         {"paneConfig","paneConfig"},
                         {"style","style"},
                         {"cls","cls"},
                         {"attr","attr"},
                         {"UserProperty1","UserProperty1"},
                         {"UserProperty2","UserProperty2"},
                         {"UserProperty3","UserProperty3"}
                         
                });

            }
        }

        private Dictionary<string, string> dashletFieldDictionary
        {
            get
            {
                return mixMetaDictionary(new Dictionary<string, string>(){
                    {"id","id"},
                    {"dashboardId","dashboardId"},
                    {"moduleId","dashletModuleId"},
                    {"title","title"},
                    {"config","config"},
                    {"paneConfig","paneConfig"},                    
                    {"position","position"},
                    {"style","style"},
                    {"cls","cls"},
                    {"attr","attr"},
                    {"UserProperty1","UserProperty1"},
                    {"UserProperty2","UserProperty2"},
                    {"UserProperty3","UserProperty3"}
                });
            }
        }

        private Dictionary<string, string> dashletModuleFieldDictionary
        {
            get
            {
                return mixMetaDictionary(new Dictionary<string, string>(){
                    {"id","id"},
                    {"path","path"},
                    {"title","title"},
                    {"config","config"},
                    {"dashletConfig","dashletConfig"},
                    {"paneConfig","paneConfig"},
                    {"viewOrder","viewOrder"},
                    {"groupOrder","groupOrder"},
                    {"style","style"},
                    {"cls","cls"},
                    {"attr","attr"},
                    {"UserProperty1","UserProperty1"},
                    {"UserProperty2","UserProperty2"},
                    {"UserProperty3","UserProperty3"}
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
            //var auths = DataContext.EntityAuth.Where(auth => auth.permission == perm && auth.entityType == entityType && ((auth.authType == everyOneAuth) || (auth.authType == roleNameAuth && roleImplemented && userRoles.Contains(auth.roleOrUser)) || (auth.authType == userNameAuth && auth.roleOrUser == user))).Select(s => s.entityId).ToList();
            var auths = DataContext.EntityAuth.Where(auth => auth.entityType == entityType && ((auth.authType == everyOneAuth) || (auth.authType == roleNameAuth && roleImplemented && userRoles.Contains(auth.roleOrUser)) || (auth.authType == userNameAuth && auth.roleOrUser == user))).Select(s => s.entityId).ToList();
            if (typeof(T) == typeof(Dashboard))
            {
                return (IQueryable<T>)(from entity in (IQueryable<Dashboard>)query
                                       where (auths.Contains(entity.id) && entity.createdBy != user) || entity.createdBy == user
                                       select entity);
            }
            else
                if (typeof(T) == typeof(Dashlet))
                {

                    return (IQueryable<T>)(from entity in (IQueryable<Dashlet>)query
                                           where (auths.Contains(entity.id) && entity.createdBy != user) || entity.createdBy == user
                                           select entity);

                }
                else
                    if (typeof(T) == typeof(DashletModule))
                    {

                        return (IQueryable<T>)(from entity in (IQueryable<DashletModule>)query
                                               where (auths.Contains(entity.id) && entity.createdBy != user) || entity.createdBy == user
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
            var result = FilterEntity<Dashboard>(query);
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
            var result = FilterEntity<Dashlet>(query);
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
            var result = FilterEntity<DashletModule>(query);
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
            return GetResourceText("JDash.SqlProvider.Models.Metadata.sql").Replace("[dbo].", "");
        }

        public override bool CreateMetadata(string connectionString, bool checkMetadata = false)
        {
            using (SqlConnection db = new SqlConnection(connectionString))
            {
                db.Open();
                if (checkMetadata)
                {
                    DataTable dTable = db.GetSchema("TABLES", new string[] { null, null, "Dashboard" });
                    if (dTable.Rows.Count != 0)
                    {
                        return false;
                    }
                }

                string sql = "";
                try
                {
                    sql = GetScript();
                }
                catch (Exception)
                {
                    throw;
                }
                string[] scr = sql.Split(new string[] { "\r\nGO\r\n" }, StringSplitOptions.RemoveEmptyEntries);

                foreach (string s in scr)
                {
                    SqlCommand cmd = db.CreateCommand();
                    cmd.CommandText = s;
                    cmd.CommandType = CommandType.Text;
                    cmd.ExecuteNonQuery();
                }
                db.Close();
            }
            return true;
        }


        public override IEnumerable<TagRelationModel> GetAllTagsRelations()
        {
            return DataContext.TagRelation.ToList().Select(p => p.ToTagRelationModel()).ToList();
        }

        public override IEnumerable<DashboardModel> GetDashboardsOfUser(string username)
        {
            var context = DataContext;
            var list = context.Dashboard.Where(p => p.createdBy == username).Select(m => m).AsEnumerable();

            foreach (var item in list)
            {
                CheckEntityAuthorization<Dashboard>(item.id, item.createdBy, Permission.view);
                yield return item.ToDashboardModel(null);
            }
        }

        public override void ExecuteScript(string connectionString, string script, string statementSplit = "\r\n")
        {
            using (SqlConnection db = new SqlConnection(connectionString))
            {
                db.Open();



                string[] scr = script.Split(new string[] { statementSplit }, StringSplitOptions.RemoveEmptyEntries);

                foreach (string s in scr)
                {
                    SqlCommand cmd = db.CreateCommand();
                    cmd.CommandText = s;
                    cmd.CommandType = CommandType.Text;
                    cmd.ExecuteNonQuery();
                }
                db.Close();
            }
        }
    }
}
