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
    public partial class DASHLET
    {

        public DASHLET AssignFrom(DashletModel model)
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
            this.DASHBOARDID = model.dashboardId.ToInt();
            this.DASHLETMODULEID = model.module != null ? model.module.id.ToInt() : model.moduleId.ToInt();
            this.TITLE = model.title;
            this.POSITION = Serialization.JsonStringify(model.position);
            this.CONFIG = Serialization.JsonStringify(model.config);
            this.PANECONFIG = Serialization.JsonStringify(model.paneConfig);
            //this.style = model.style;
            //this.cls = model.cls;
            //this.attr = model.attr;
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

        public void AssignTo(DashletModel model, Entities context )
        {
            model.id = this.ID.ToString();
            model.dashboardId = this.DASHBOARDID.ToString();
            model.title = this.TITLE;
            model.position = Serialization.JsonParse(this.POSITION);

            model.config = Serialization.JsonParse<Config>(this.CONFIG);
            model.paneConfig = Serialization.JsonParse<Config>(this.PANECONFIG);
            var type = this.GetType().Name.ToLower();
            if (context != null)
            {
                var auths = context.ENTITYAUTH.Where(w => w.ENTITYID == this.ID && w.ENTITYTYPE == type).ToList().Select(s => s.ToAuthModel()).Select(auth => new KeyValuePair<string, PermissionModel>(auth.Key, auth.Value)).ToList();
                model.authorization = auths;
            }
            else model.authorization = new List<KeyValuePair<string, PermissionModel>>();
            //model.style = this.style;
            //model.cls = this.cls;
            //model.attr = this.attr;
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
            model.moduleId = this.DASHLETMODULEID.ToString();

        }
    }
}
