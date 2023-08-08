using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace JDash.Models
{

    public class DashletModuleModel: IDomModel
    {

        public DashletModuleModel()
        {
            this.config = new Config();
            this.paneConfig = new Config();
            this.dashletConfig = new Config();
            this.authorization = new List<KeyValuePair<string, PermissionModel>>();
            this.metaData = new MetadataModel();
        }

        public string id { get; set; }
        public string path { get; set; }
        public string title { get; set; }

        public Config dashletConfig { get; set; }
        public Config paneConfig { get; set; }
        public Config config { get; set; }

        public List<KeyValuePair<string, PermissionModel>> authorization { get; set; }
        [Obsolete("This property is deprecated. Use sharedBy and shared properties of metadata", false)]
        public ShareModel share { get; set; }
        public string groupOrder { get; set; }
        public string viewOrder { get; set; }
        public MetadataModel metaData { get; set; }

        public string UserProperty1 { get; set; }
        public string UserProperty2 { get; set; }
        public string UserProperty3 { get; set; }
    }
}
