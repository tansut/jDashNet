using JDash.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;

namespace JDash.Models
{
    public class DashletModel: IDomModel
    {

        public DashletModel()
        {
            this.config = new Config();
            this.paneConfig = new Config();
            //this.authorization = new List<KeyValuePair<string, PermissionModel>>();
            this.metaData = new MetadataModel();
        }

        public DashletModel(DashletModuleModel module): this()
        {
            this.module = module;
            this.moduleId = module.id;
            this.title = module.title;
        }

        public string id { get; set; }
        public string dashboardId { get; set; }
        public string moduleId { get; set; }        
        public string title { get; set; }
        public dynamic position { get; set; }
        public string content { get; set; }
        public DashletModuleModel module { get; set; }

        public Config config { get; set; }
        public Config paneConfig { get; set; }
        public MetadataModel metaData { get; set; }
        public List<KeyValuePair<string, PermissionModel>> authorization { get; set; }
        [Obsolete("This property is deprecated. Use sharedBy and shared properties of metadata", false)]
        public ShareModel share { get; set; }
        
        public Dictionary<string, object> serverConfig { get; set; }

        public string UserProperty1 { get; set; }
        public string UserProperty2 { get; set; }
        public string UserProperty3 { get; set; }

        protected void LoadProperties(DashletModel source)
        {
            if (!string.IsNullOrEmpty(source.title))
                this.title = source.title;
            if (source.config != null)
                foreach(var k in source.config)
                    this.config[k.Key] = k.Value;
            if (source.paneConfig != null)
                foreach (var k in source.paneConfig)
                    this.paneConfig[k.Key] = k.Value;
        }
        

        public void LoadProperties(string properties)
        {
            if (!string.IsNullOrEmpty(properties))
            {
                var props = Serialization.JsonParse<DashletModel>(properties);
                LoadProperties(props);
            }

        }
    }
}