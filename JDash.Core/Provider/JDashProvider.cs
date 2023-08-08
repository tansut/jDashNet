using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Configuration.Provider;
using System.Linq;
using System.Text;
using System.Threading;
using System.Web.Security;
using JDash.Models;
using JDash.Query;
using Newtonsoft.Json;

namespace JDash.Provider
{
    public abstract class JDashProvider : ProviderBase
    {

        protected void manageConfigs(DashletModel model)
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

        public const string MembershipRoleProvider = "MembershipRoleProvider";

        private string connectionString = string.Empty;
        private string applicationName = "Dashboard";
        public bool AuthorizationEnabled { get; internal set; }
        protected RoleProvider roleProvider;

        protected bool DoAuthorization
        {
            get
            {
                return this.AuthorizationEnabled && !this.IsCurrentUserAdmin;
            }
        }

        private SortedSet<string> adminRoles = null;
        public SortedSet<string> AdminRoles
        {

            get
            {
                if (adminRoles == null) adminRoles = new SortedSet<string>();
                return adminRoles;
            }
            private set
            {
                adminRoles = value;
            }
        }

        public abstract bool CreateMetadata(string connectionString, bool checkMetadata = false);
        public abstract string GetScript();

        public abstract DashboardModel GetDashboard(string id);
        public abstract DashboardModel CreateDashboard(DashboardModel model);
        public abstract DashboardModel SaveDashboard(DashboardModel model);
        public abstract void DeleteDashboard(string id);
        public abstract DynamicResult<DashboardModel> SearchDashboards(DynamicQuery query = null);
        public abstract IEnumerable<DashboardModel> GetDashboardsOfUser(string username);


        public abstract DashletModuleModel GetDashletModule(string id);
        public abstract DashletModuleModel CreateDashletModule(DashletModuleModel model);
        public abstract void DeleteDashletModule(string id);
        public abstract DashletModuleModel SaveDashletModule(DashletModuleModel model);
        public abstract DynamicResult<DashletModuleModel> SearchDashletModules(DynamicQuery query = null);

        public abstract DashletModel GetDashlet(string id);
        public abstract DashletModel CreateDashlet(DashletModel model, IEnumerable<UpdatePositionModel> positions = null);
        public abstract void DeleteDashlet(string id);        
        public abstract void UpdateDashletPositions(IEnumerable<UpdatePositionModel> positions);
        public abstract DashletModel SaveDashlet(DashletModel model);
        public abstract Dictionary<string,DynamicResult<object>> GetDashboardDashlets(string dashboardId, bool withModules);
        public abstract DynamicResult<DashletModel> SearchDashlets(DynamicQuery query = null);

        public abstract IEnumerable<TagModel> GetAllTags();
        public abstract IEnumerable<TagRelationModel> GetAllTagsRelations();
        public abstract void ExecuteScript(string connectionString, string script, string statementSplit = "\r\n");


        public virtual string CurrentUser
        {
            get
            {
                return JDashManager.CurrentUser;
            }
        }

        protected virtual bool IsCurrentUserAdmin
        {
            get
            {
                if (AdminRoles.Any())
                {
                    foreach (var role in AdminRoles)
                    {
                        if (RoleProvider != null)
                        {
                            if (RoleProvider.IsUserInRole(CurrentUser, role))
                            {
                                return true;
                            }
                        }
                        else return false;
                    }
                }
                return false;
            }
        }

        public RoleProvider RoleProvider
        {
            get
            {
                return this.roleProvider;
            }
        }


        public virtual string Copyright
        {
            get
            {
                return "";
            }
        }

        public virtual string HelpUri
        {
            get
            {
                return "";
            }
        }

        public bool AutoCreateMetadata { get; private set; }
        public bool JDashController { get; private set; }


        public string ConnectionString
        {
            get
            {
                return connectionString;
            }
            set
            {
                this.connectionString = value;
            }
        }


        public override void Initialize(string name, NameValueCollection config)
        {
            base.Initialize(name, config);
            if (config["connectionString"] != null)
            {
                if (config["preparedConnectionString"] != null)
                {
                    connectionString = config["preparedConnectionString"];
                }
                else
                {
                    if (ConfigurationManager.ConnectionStrings[config["connectionString"]] != null)
                        connectionString = ConfigurationManager.ConnectionStrings[config["connectionString"]].ConnectionString;
                    else connectionString = "";
                }
            }
            if (config["applicationName"] != null)
                applicationName = config["applicationName"];
            if (config["authorizationEnabled"] != null)
                AuthorizationEnabled = Convert.ToBoolean(config["authorizationEnabled"]);
            if (config["autoCreateMetadata"] != null)
                AutoCreateMetadata = Convert.ToBoolean(config["autoCreateMetadata"]);
            else AutoCreateMetadata = true;

            if (config["jDashController"] != null)
                JDashController = Convert.ToBoolean(config["jDashController"]);
            else JDashController = true;



            if (!string.IsNullOrWhiteSpace(config["privilegedRoles"]))
            {
                AdminRoles = new SortedSet<string>(config["privilegedRoles"].Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries).Select(s => s.Trim()));
            }
            InitializeRoleProvider(config);
            if (this.AutoCreateMetadata)
              CreateMetadata(connectionString, true);

        }

        protected virtual void InitializeRoleProvider(NameValueCollection config)
        {
            if (config["knownRoleProvider"] != null)
            {
                var knownRoleProvider = config["knownRoleProvider"];
                if (knownRoleProvider == MembershipRoleProvider)
                {
                    this.roleProvider = Roles.Provider;
                }
            }
            else if (config["roleProvider"] != null)
            {
                var roleProviderName = config["roleProvider"];
                var type = Type.GetType(roleProviderName);
                if(type.IsSubclassOf(typeof(RoleProvider)) || type == typeof(RoleProvider))
                {
                    roleProvider = (RoleProvider)Activator.CreateInstance(type);

                }else
                {
                    throw new ArgumentException("Custom role provider must implement System.Web.Security.RoleProvider abstract class");
                }
                var provider = Activator.CreateInstance(type);         
            }
        }



        public abstract void StartTransaction();
        public abstract void Rollback();
        public abstract void Commit();

    }
}
