using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using JDash.Models;
using JDash.MySqlProvider.Models;

namespace JDash.MySqlProvider.Extensions
{
    public static class ConversionExtensions
    {
        public static DashboardModel ToDashboardModel(this Models.dashboard entity, MySQLDashEntity context)
        {
            DashboardModel model = new DashboardModel();
            entity.AssignTo(model, context);
            return model;
        }

        public static DashletModel ToDashletModel(this Models.dashlet entity, MySQLDashEntity context)
        {
            DashletModel model = new DashletModel();
            entity.AssignTo(model, context);
            return model;
        }

        public static DashletModuleModel ToDashletModuleModel(this Models.dashletmodule entity, MySQLDashEntity context)
        {
            DashletModuleModel model = new DashletModuleModel();
            entity.AssignTo(model, context);
            return model;
        }

        public static TagModel ToTagModel(this Models.tag entity)
        {
            TagModel model = new TagModel();
            entity.AssignTo(model);
            return model;
        }

        public static TagRelationModel ToTagRelationModel(this Models.tagrelation entity)
        {
            TagRelationModel model = new TagRelationModel();
            entity.AssignTo(model);
            return model;
        }



    }
}
