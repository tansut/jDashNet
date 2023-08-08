using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace JDash.Models
{
    public class DashboardModel : IDomModel
    {
        public DashboardModel()
        {
            this.metaData = new MetadataModel();
            this.authorization = new List<KeyValuePair<string, PermissionModel>>();
            EnsureLayout();
        }
        public string id { get; set; }
        public string title { get; set; }

        public LayoutModel layout { get; set; }

        public Config config { get; set; }
        public Config paneConfig { get; set; }

        public List<KeyValuePair<string, PermissionModel>> authorization { get; set; }
        [Obsolete("This property is deprecated. Use sharedBy and shared properties of metadata", false)]
        public ShareModel share { get; set; }
        
        public MetadataModel metaData { get; set; }
        public string groupOrder { get; set; }
        public string viewOrder { get; set; }

        public Dictionary<string, object> serverConfig { get; set; }

        public string UserProperty1 { get; set; }
        public string UserProperty2 { get; set; }
        public string UserProperty3 { get; set; }

        //public string style { get; set; }
        //public string cls { get; set; }
        //public string attr { get; set; }

        public void EnsureLayout()
        {
            if (this.layout == null)
                this.layout = LayoutModel.DefaultGrid;
        }
    }
}