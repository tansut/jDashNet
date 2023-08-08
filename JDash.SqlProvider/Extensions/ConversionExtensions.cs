using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using JDash.Models;
using JDash.SqlProvider.Models;

namespace JDash.SqlProvider.Extensions
{
    public static class ConversionExtensions
    {
        public static DashboardModel ToDashboardModel(this Models.Dashboard entity, DashEntity context)
        {
            DashboardModel model = new DashboardModel();
            entity.AssignTo(model, context);
            return model;
        }

        public static DashletModel ToDashletModel(this Models.Dashlet entity, DashEntity context)
        {
            DashletModel model = new DashletModel();
            entity.AssignTo(model, context);
            return model;
        }

        public static DashletModuleModel ToDashletModuleModel(this Models.DashletModule entity, DashEntity context)
        {
            DashletModuleModel model = new DashletModuleModel();
            entity.AssignTo(model, context);
            return model;
        }

        public static TagModel ToTagModel(this Models.Tag entity)
        {
            TagModel model = new TagModel();
            entity.AssignTo(model);
            return model;
        }

        public static TagRelationModel ToTagRelationModel(this Models.TagRelation entity)
        {
            TagRelationModel model = new TagRelationModel();
            entity.AssignTo(model);
            return model;
        }

    

    }
}
