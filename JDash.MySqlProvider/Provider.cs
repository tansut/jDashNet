using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using JDash.Provider;
using JDash.Models;
using System.Data.EntityClient;
using JDash.MySqlProvider.Models;
using JDash.MySqlProvider.Extensions;
using JDash.Extensions;
using System.Threading;
using System.Web;
using JDash.Exceptions;
using JDash.Query;
using System.Reflection;
using System.Linq.Expressions;
using System.IO;
using MySql.Data.MySqlClient;
using System.Data;
using JDash.Helpers;

namespace JDash.MySqlProvider
{
    public class Provider : JDashProvider
    {

        LocalDataStoreSlot dataContextSlot = Thread.GetNamedDataSlot("dataContext");

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

        protected MySQLDashEntity GetContext()
        {
            return new MySQLDashEntity(this.EntityConnSql());
        }

        private string GetEntityName(Type type)
        {
            return type.Name.ToLower();
        }

        internal MySQLDashEntity DataContext
        {
            get
            {
                MySQLDashEntity dataContext = null;


                if (HttpContext.Current == null)
                {
                    object data = Thread.GetData(dataContextSlot);
                    if (data == null)
                    {
                        data = new MySQLDashEntity(this.EntityConnSql());
                        Thread.SetData(dataContextSlot, data);
                    }
                    dataContext = (MySQLDashEntity)data;
                }
                else if (HttpContext.Current.Items.Contains("__datacontext"))
                    dataContext = (MySQLDashEntity)HttpContext.Current.Items["__datacontext"];
                else
                {
                    dataContext = new MySQLDashEntity(this.EntityConnSql());
                    if (HttpContext.Current != null)
                        HttpContext.Current.Items["__datacontext"] = dataContext;
                }

                return dataContext;

            }
        }

        private string EntityConnSql()
        {
            EntityConnectionStringBuilder entityBuilder = new EntityConnectionStringBuilder();
            entityBuilder.ProviderConnectionString = this.ConnectionString;
            entityBuilder.Provider = "MySql.Data.MySqlClient";
            entityBuilder.Metadata = @"res://*/Models.MySqlDBModel.csdl|res://*/Models.MySqlDBModel.ssdl|res://*/Models.MySqlDBModel.msl";
            return entityBuilder.ToString();
        }


        public override void Initialize(string name, System.Collections.Specialized.NameValueCollection config)
        {
            base.Initialize(name, config);

        }



        public override DashboardModel GetDashboard(string id)
        {
            var did = int.Parse(id);
            dashboard entity = null;
            try
            {
                entity = DataContext.dashboard.Single(p => p.id == did);
            }
            catch (InvalidOperationException)
            {
                throw new ArgumentException("Given dashboard id was not present in the dashboards");
            }
            CheckEntityAuthorization<dashboard>(entity.id, entity.createdBy, Permission.view);
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
                        result = DataContext.entityauth.Where(w => (w.entityId == entityId && w.entityType == type)
                         && ((w.authType == everyOneAuth) || (w.authType == roleNameAuth && roleImplemented && userRoles.Contains(w.roleOrUser)) || (w.authType == userNameAuth && w.roleOrUser == CurrentUser))).Any();
                    }
                    else
                    {
                        result = DataContext.entityauth.Where(w => (w.entityId == entityId && w.entityType == type && w.permission == perm)
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


        //edit
        public override DashboardModel CreateDashboard(DashboardModel model)
        {
            var dashboard = new Models.dashboard();
            EnsureMetadata(model.metaData);
            model.EnsureLayout();
            dashboard.AssignFrom(model);
            var type = GetEntityName(typeof(dashboard));
            DataContext.dashboard.AddObject(dashboard);
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
                dashboard dashboard;
                try
                {
                    dashboard = DataContext.dashboard.Single(p => p.id == dashid);
                }
                catch (InvalidOperationException)
                {
                    throw new ArgumentException("Given dashboard id was not present in the dashboards");
                }
                var type = GetEntityName(typeof(dashboard));
                CheckEntityAuthorization<dashboard>(dashboard.id, dashboard.createdBy, Permission.edit);
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
            var type = GetEntityName(typeof(dashboard));
            dashboard dashboard;
            try
            {
                dashboard = DataContext.dashboard.Single(p => p.id == dashId);
            }
            catch (InvalidOperationException)
            {
                throw new ArgumentException("Given dashboard id was not present in the dashboards");
            }
            CheckEntityAuthorization<dashboard>(dashboard.id, dashboard.createdBy, Permission.delete);
            DataContext.DeleteObject(dashboard);
            DeleteControlTagRelations(dashId, type);
            DeleteControlAuth(dashId, type);
            DataContext.SaveChanges();
        }

        private void DeleteControlTagRelations(int controlID, string tcm)
        {

            var existingTagsRelations = DataContext.tagrelation.Where(p => p.controlId == controlID && p.controller == tcm).ToList();
            foreach (var item in existingTagsRelations)
            {
                DataContext.tagrelation.DeleteObject(item);
            }
        }

        private void DeleteControlAuth(int controlID, string tcm)
        {

            var existingControlAuth = DataContext.entityauth.Where(p => p.entityId == controlID && p.entityType == tcm).ToList();
            foreach (var item in existingControlAuth)
            {
                DataContext.entityauth.DeleteObject(item);
            }
        }

        private void SaveControlAuth(List<KeyValuePair<string, PermissionModel>> auths, int controlID, string tcm, bool autoSave)
        {
            var controller = tcm.ToString();
            DeleteControlAuth(controlID, tcm);
            foreach (var auth in auths)
            {
                DataContext.entityauth.AddObject(new entityauth() { entityId = controlID, entityType = tcm, roleOrUser = auth.Key, permission = auth.Value.permission.ToString(), authType = auth.Value.authTarget.ToString() });
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
                var tagItem = DataContext.tag.SingleOrDefault(p => p.tagName == tag);
                if (tagItem == null)
                {
                    tagItem = new tag();
                    tagItem.tagName = tag;
                    tagItem.tagrelation.Add(new tagrelation() { controlId = controlID, controller = controller });
                    DataContext.tag.AddObject(tagItem);
                }
                else
                {
                    DataContext.tagrelation.AddObject(new tagrelation() { controlId = controlID, controller = controller, tagId = tagItem.id });
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
            var item = new Models.dashletmodule();
            EnsureMetadata(model.metaData);
            var type = GetEntityName(typeof(dashletmodule));
            item.AssignFrom(model);
            DataContext.dashletmodule.AddObject(item);
            DataContext.SaveChanges();
            if (model.authorization != null && model.authorization.Any())
                SaveControlAuth(model.authorization, item.id, type, true);
            if (model.metaData != null && model.metaData.tags != null && model.metaData.tags.Any())
                SaveControlTags(model.metaData.tags, item.id, GetEntityName(typeof(dashletmodule)), true);
            item.AssignTo(model, DataContext);
            return model;
        }

        public override void DeleteDashletModule(string id)
        {

            int moduleID = int.Parse(id);
            var type = GetEntityName(typeof(dashletmodule));
            dashletmodule dashletModule;
            try
            {
                dashletModule = DataContext.dashletmodule.Single(p => p.id == moduleID);
            }
            catch (InvalidOperationException)
            {
                throw new ArgumentException("Given dashlet module id was not present in the dashlet modules");
            }
            CheckEntityAuthorization<dashletmodule>(dashletModule.id, dashletModule.createdBy, Permission.delete);
            DataContext.DeleteObject(dashletModule);
            DeleteControlAuth(moduleID, type);
            DeleteControlTagRelations(moduleID, type);
            DataContext.SaveChanges();
        }

        public override DashletModuleModel SaveDashletModule(DashletModuleModel model)
        {
            int moduleID = int.Parse(model.id); ;
            dashletmodule dashmodule = new dashletmodule();
            var type = GetEntityName(typeof(dashletmodule));
            try
            {
                dashmodule = DataContext.dashletmodule.Single(p => p.id == moduleID);
            }
            catch (InvalidOperationException)
            {
                throw new ArgumentException("Given dashlet module id was not present in the dashlet modules");
            }
            CheckEntityAuthorization<dashletmodule>(dashmodule.id, dashmodule.createdBy, Permission.edit);
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
            dashletmodule dashletModule;
            try
            {
                dashletModule = DataContext.dashletmodule.Single(p => p.id == did);
            }
            catch (InvalidOperationException)
            {
                throw new ArgumentException("Given dashlet module id was not present in the dashlet modules");
            }
            CheckEntityAuthorization<dashletmodule>(dashletModule.id, dashletModule.createdBy, Permission.view);
            return dashletModule.ToDashletModuleModel(DataContext);
        }

        public override DashletModel GetDashlet(string id)
        {
            dashlet dashlet;
            var intId = int.Parse(id);
            try
            {
                dashlet = DataContext.dashlet.Single(p => p.id == intId);
            }
            catch (InvalidOperationException)
            {
                throw new ArgumentException("Given dashlet id was not present in the dashlets");
            }
            CheckEntityAuthorization<dashlet>(dashlet.id, dashlet.createdBy, Permission.view);
            return dashlet.ToDashletModel(DataContext);
        }



        public override DashletModel CreateDashlet(DashletModel model, IEnumerable<UpdatePositionModel> positions = null)
        {
            EnsureMetadata(model.metaData);
            manageConfigs(model);
            var dashlet = new Models.dashlet();
            dashlet.AssignFrom(model);
            var type = GetEntityName(typeof(dashlet));
            DataContext.dashlet.AddObject(dashlet);
            if (positions != null && positions.Any()) UpdateDashletPositions(positions);
            else DataContext.SaveChanges();
            if (model.authorization != null && model.authorization.Any())
                SaveControlAuth(model.authorization, dashlet.dashboardId, type, true);
            if (model.metaData != null && model.metaData.tags != null && model.metaData.tags.Any())
                SaveControlTags(model.metaData.tags, dashlet.dashboardId, GetEntityName(typeof(dashlet)), true);
            model.id = dashlet.id.ToString();
            dashlet.AssignTo(model, DataContext);
            return model;
        }

        public override void DeleteDashlet(string id)
        {
            var dashletId = int.Parse(id);
            dashlet dashlet;
            try
            {
                dashlet = DataContext.dashlet.Single(p => p.id == dashletId);
            }
            catch (InvalidOperationException)
            {
                throw new ArgumentException("Given dashlet id was not present in the dashlets");
            }
            var type = GetEntityName(typeof(dashlet));
            CheckEntityAuthorization<dashlet>(dashlet.id, dashlet.createdBy, Permission.delete);
            DataContext.DeleteObject(dashlet);
            DataContext.SaveChanges();
            DeleteControlAuth(dashletId, type);
            DeleteControlTagRelations(dashletId, type);
        }

        public override DashletModel SaveDashlet(DashletModel model)
        {

            var dashId = int.Parse(model.id);
            dashlet dashlet;
            try
            {
                dashlet = DataContext.dashlet.Single(p => p.id == dashId);
            }
            catch (InvalidOperationException)
            {
                throw new ArgumentException("Given dashlet id was not present in the dashlets");
            }
            var type = GetEntityName(typeof(dashlet));
            CheckEntityAuthorization<dashlet>(dashlet.id, dashlet.createdBy, Permission.edit);
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
            var dashlets = DataContext.dashlet.Where(p => ids.Contains(p.id)).ToList();
            var dasboards = dashlets.Select(s => s.dashboard).Distinct().ToList();
            foreach (var dashboard in dasboards)
            {
                CheckEntityAuthorization<dashboard>(dashboard.id, dashboard.createdBy, Permission.edit);
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
            dashboard entity;
            try
            {
                entity = DataContext.dashboard.Single(p => p.id == dashId);
            }
            catch (InvalidOperationException)
            {
                throw new ArgumentException("Given dashboard id was not present in the dashboards");
            }
            CheckEntityAuthorization<dashboard>(entity.id, entity.createdBy, Permission.view);
            Dictionary<string, DynamicResult<object>> result = new Dictionary<string, DynamicResult<object>>();
            var dashlets = DataContext.dashlet.Where(p => p.dashboardId == dashId).ToList();
            var dashletResult = new DynamicResult<object>(dashlets.Select(s => s.ToDashletModel(DataContext)).ToList(), null);
            result.Add("dashlets", dashletResult);
            if (withModules && dashlets.Any())
            {
                var modules = dashlets.Select(s => s.dashletmodule).Distinct();
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
            return DataContext.tag.ToList().Select(p => p.ToTagModel()).ToList();
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
            //var auths = DataContext.entityauth.Where(auth => auth.permission == perm && auth.entityType == entityType && ((auth.authType == everyOneAuth) || (auth.authType == roleNameAuth && roleImplemented && userRoles.Contains(auth.roleOrUser)) || (auth.authType == userNameAuth && auth.roleOrUser == user))).Select(s => s.entityId).ToList();
            var auths = DataContext.entityauth.Where(auth => auth.entityType == entityType && ((auth.authType == everyOneAuth) || (auth.authType == roleNameAuth && roleImplemented && userRoles.Contains(auth.roleOrUser)) || (auth.authType == userNameAuth && auth.roleOrUser == user))).Select(s => s.entityId).ToList();
            if (typeof(T) == typeof(dashboard))
            {
                return (IQueryable<T>)(from entity in (IQueryable<dashboard>)query
                                       where (auths.Contains(entity.id) && entity.createdBy != user) || entity.createdBy == user
                                       select entity);
            }
            else
                if (typeof(T) == typeof(dashlet))
                {

                    return (IQueryable<T>)(from entity in (IQueryable<dashlet>)query
                                           where (auths.Contains(entity.id) && entity.createdBy != user) || entity.createdBy == user
                                           select entity);

                }
                else
                    if (typeof(T) == typeof(dashletmodule))
                    {

                        return (IQueryable<T>)(from entity in (IQueryable<dashletmodule>)query
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
            var result = FilterEntity<dashboard>(query);
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
            var result = FilterEntity<dashlet>(query);
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
            var result = FilterEntity<dashletmodule>(query);
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
            var script = GetResourceText("JDash.MySqlProvider.Models.Metadata.sql");

            return script;
        }

        private string getDbName()
        {
            var split = this.ConnectionString.Split(';');
            foreach (string item in split)
            {
                var kp = item.Split('=');
                if (kp.Length > 1 && kp[0].ToLowerInvariant() == "database")
                    return kp[1];
            }
            return "";
        }

        private bool tableExists(MySqlConnection conn, string tableName)
        {
            var cmdStr = string.Format("SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = '{0}' AND table_name = '{1}';", conn.Database, tableName);
            MySqlCommand cmd = new MySqlCommand(cmdStr, conn);
            MySqlDataReader reader = cmd.ExecuteReader();
            var result = false;
            while (reader.Read())
            {
                int count = reader.GetInt32(0);
                if (count == 0)
                {
                    result = false;
                }
                else if (count == 1)
                {
                    result = true;
                }
            }

            reader.Close();

            return result;
        }


        public override bool CreateMetadata(string connectionString, bool checkMetadata = false)
        {

            //StringBuilder sb = new StringBuilder();
            //var connectionStringParams = connectionString.Split(";".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);
            //foreach (var param in connectionStringParams)
            //{
            //    if (param.ToLower().StartsWith("database="))
            //    {
            //        continue;
            //    }
            //    sb.AppendFormat("{0};", param);
            //}
            using (MySqlConnection db = new MySqlConnection(connectionString))
            {
                db.Open();
                if (checkMetadata)
                {
                    if (tableExists(db, "Dashboard"))
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



                //sql = "use '" + getDbName() + "';\n" + sql;

                MySqlCommand cmd = db.CreateCommand();
                cmd.CommandText = sql;
                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
                db.Close();
            }
            return true;
        }


        public override IEnumerable<TagRelationModel> GetAllTagsRelations()
        {
            return DataContext.tagrelation.ToList().Select(p => p.ToTagRelationModel()).ToList();
        }


        public override IEnumerable<DashboardModel> GetDashboardsOfUser(string username)
        {
            var context = DataContext;
            var list = context.dashboard.Where(p => p.createdBy == username).Select(m => m).AsEnumerable();
            foreach (var item in list)
            {
                yield return item.ToDashboardModel(null);
            }
        }


        public override void ExecuteScript(string connectionString, string script, string statementSplit = "\r\n")
        {
            using (MySqlConnection db = new MySqlConnection(connectionString))
            {
                db.Open();
                MySqlCommand cmd = db.CreateCommand();
                cmd.CommandText = script;
                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
                db.Close();
            }
        }
    }
}
