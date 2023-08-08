using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using JDash.Models;
using JDash.OracleProvider.Models;

namespace JDash.OracleProvider.Extensions
{
    public static class ConversionExtensions
    {
        public static DashboardModel ToDashboardModel(this Models.DASHBOARD entity, Entities context)
        {
            DashboardModel model = new DashboardModel();
            entity.AssignTo(model, context);
            return model;
        }

        public static DashletModel ToDashletModel(this Models.DASHLET entity, Entities context)
        {
            DashletModel model = new DashletModel();
            entity.AssignTo(model, context);
            return model;
        }

        public static DashletModuleModel ToDashletModuleModel(this Models.DASHLETMODULE entity, Entities context)
        {
            DashletModuleModel model = new DashletModuleModel();
            entity.AssignTo(model, context);
            return model;
        }

        public static TagModel ToTagModel(this Models.TAG entity)
        {
            TagModel model = new TagModel();
            entity.AssignTo(model);
            return model;
        }

        public static TagRelationModel ToTagRelationModel(this Models.TAGRELATION entity)
        {
            TagRelationModel model = new TagRelationModel();
            entity.AssignTo(model);
            return model;
        }


    }
}
