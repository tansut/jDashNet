using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using JDash.WebForms.Utils;

namespace JDash.WebForms
{
    /// <summary>
    /// Abstract class for all dashlet related controls like <see cref="JDash.WebForms.DashletpropertyEditor"/>
    /// </summary>
    public abstract class JDashletControl: JControl
    {
        protected override void getClientProperties(Dictionary<string, object> dict)
        {
            dict.Add("id", this.ClientWidgetID);
            dict.Add("dashletId", getClientValue(DashletId));
            dict.Add("dashboardId", getClientValue(DashboardId));
            if (!String.IsNullOrEmpty(this.CssClass))
                dict.Add("baseClass", this.CssClass);
        }


        [Browsable(false)]
        public string DashletId
        {
            get
            {
                var parent = ReflectionUtils.GetTypeOfParent(this, "JDash.WebForms.JPane") as JPane;
                if (parent != null)
                    return parent.Model == null ? "" : parent.Model.id;
                else return "";
            }
        }

        [Browsable(false)]
        public string DashboardId
        {
            get
            {
                var parent = ReflectionUtils.GetTypeOfParent(this, "JDash.WebForms.DashboardView") as DashboardView;
                if (parent != null)
                    return parent.ClientWidgetID;
                else return "";
            }
        }
    }
}
