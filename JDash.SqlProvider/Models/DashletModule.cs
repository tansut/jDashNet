using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using JDash.Helpers;
using JDash.Models;
using JDash.SqlProvider.Extensions;
using JDash.Extensions;
namespace JDash.SqlProvider.Models
{
    public partial class DashletModule
    {
        public DashletModule AssignFrom(DashletModuleModel model)
        {
            if (this.id == 0)
            {
                int result;
                int.TryParse(model.id, out result);
                if (result > 0)
                {
                    id = result;
                }
            }
            this.title = model.title;            
            this.config = Serialization.JsonStringify(model.config);
            this.paneConfig = Serialization.JsonStringify(model.paneConfig);
            this.dashletConfig = Serialization.JsonStringify(model.dashletConfig);            
            this.path = model.path;
            this.UserProperty1 = model.UserProperty1;
            this.UserProperty2 = model.UserProperty2;
            this.UserProperty3 = model.UserProperty3;


            this.groupOrder = model.groupOrder.ToNullableInt();
            this.viewOrder = model.viewOrder.ToNullableInt();
            if (model.metaData != null)
            {
                this.groupName = model.metaData.group;
                this.description = model.metaData.description;
                this.createdBy = model.metaData.createdBy;
                this.modifiedBy = model.metaData.modifiedBy;
                this.sharedBy = model.metaData.sharedBy;
                this.created = model.metaData.created;
                this.modified = model.metaData.modified;
                this.shared = model.metaData.shared;
                this.userData = model.metaData.userData;
            }
            return this;
        }

        public void AssignTo(DashletModuleModel model, DashEntity context )
        {
            model.id = this.id.ToString();
            model.title = this.title;
            model.config = Serialization.JsonParse<Config>(this.config);
            model.paneConfig = Serialization.JsonParse<Config>(this.paneConfig);
            model.dashletConfig = Serialization.JsonParse<Config>(this.dashletConfig);            
            //model.style = this.style;
            //model.cls = this.cls;
            //model.attr = this.attr;
            model.path = this.path;
            var type = this.GetType().Name.ToLower();
            if (context != null)
            {
                var auths = context.EntityAuth.Where(w => w.entityId == this.id && w.entityType == type).ToList().Select(s => s.ToAuthModel()).Select(auth => new KeyValuePair<string, PermissionModel>(auth.Key, auth.Value)).ToList();
                model.authorization = auths;
            }
            else model.authorization = new List<KeyValuePair<string, PermissionModel>>();
            model.groupOrder = this.groupOrder.HasValue ? this.groupOrder.Value.ToString() : null;
            model.viewOrder = this.viewOrder.HasValue ? this.viewOrder.Value.ToString() : null;
            model.metaData = new MetadataModel();
            model.metaData.group = this.groupName;
            model.metaData.description = this.description;
            model.metaData.createdBy = this.createdBy;
            model.metaData.modifiedBy = this.modifiedBy;
            model.metaData.sharedBy = this.sharedBy;
            model.metaData.created = this.created;
            model.metaData.modified = this.modified;
            model.metaData.shared = this.shared;
            model.metaData.userData = this.userData;
        }
    }
}
