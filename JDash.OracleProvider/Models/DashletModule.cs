using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using JDash.Helpers;
using JDash.Models;
using JDash.OracleProvider.Extensions;
using JDash.Extensions;
namespace JDash.OracleProvider.Models
{
    public partial class DASHLETMODULE
    {
        public DASHLETMODULE AssignFrom(DashletModuleModel model)
        {
            if (this.ID == 0)
            {
                int result;
                int.TryParse(model.id, out result);
                if (result > 0)
                {
                    ID = result;
                }
            }
            this.TITLE = model.title;            
            this.CONFIG = Serialization.JsonStringify(model.config);
            this.PANECONFIG = Serialization.JsonStringify(model.paneConfig);
            this.DASHLETCONFIG = Serialization.JsonStringify(model.dashletConfig);

            this.PATH = model.path;
            //this.style = model.style;
            //this.cls = model.cls;
            //this.attr = model.attr;

            this.GROUPORDER = model.groupOrder.ToNullableInt();
            this.VIEWORDER = model.viewOrder.ToNullableInt();
            if (model.metaData != null)
            {
                this.GROUPNAME = model.metaData.group;
                this.DESCRIPTION = model.metaData.description;
                this.CREATEDBY = model.metaData.createdBy;
                this.MODIFIEDBY = model.metaData.modifiedBy;
                this.SHAREDBY = model.metaData.sharedBy;
                this.CREATED = model.metaData.created;
                this.MODIFIED = model.metaData.modified;
                this.SHARED = model.metaData.shared;
                this.USERDATA = model.metaData.userData;
            }
            return this;
        }

        public void AssignTo(DashletModuleModel model, Entities context )
        {
            model.id = this.ID.ToString();
            model.title = this.TITLE;
            model.config = Serialization.JsonParse<Config>(this.CONFIG);
            model.paneConfig = Serialization.JsonParse<Config>(this.PANECONFIG);
            model.dashletConfig = Serialization.JsonParse<Config>(this.DASHLETCONFIG);            
            //model.style = this.style;
            //model.cls = this.cls;
            //model.attr = this.attr;
            model.path = this.PATH;
            var type = this.GetType().Name.ToLower();
            if (context != null)
            {
                var auths = context.ENTITYAUTH.Where(w => w.ENTITYID == this.ID && w.ENTITYTYPE == type).ToList().Select(s => s.ToAuthModel()).Select(auth => new KeyValuePair<string, PermissionModel>(auth.Key, auth.Value)).ToList();
                model.authorization = auths;
            }
            else model.authorization = new List<KeyValuePair<string, PermissionModel>>();
            model.groupOrder = this.GROUPORDER.HasValue ? this.GROUPORDER.Value.ToString() : null;
            model.viewOrder = this.VIEWORDER.HasValue ? this.VIEWORDER.Value.ToString() : null;
            model.metaData = new MetadataModel();
            model.metaData.group = this.GROUPNAME;
            model.metaData.description = this.DESCRIPTION;
            model.metaData.createdBy = this.CREATEDBY;
            model.metaData.modifiedBy = this.MODIFIEDBY;
            model.metaData.sharedBy = this.SHAREDBY;
            model.metaData.created = this.CREATED;
            model.metaData.modified = this.MODIFIED;
            model.metaData.shared = this.SHARED;
            model.metaData.userData = this.USERDATA;
        }
    }
}
