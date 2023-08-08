using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace JDash.Mvc
{
    public enum DashboardDesignMode
    {
        /// <summary>
        /// Dashboard is displayed readonly.
        /// </summary>
        none,
        /// <summary>
        /// Dashboard layout can be changed only. 
        /// </summary>
        dashboard,
        /// <summary>
        /// New dashlets can be added to dashboard.
        /// </summary>
        dashlets,
        /// <summary>
        /// Layout can be changed and new dashlets can be added to the dashboard.
        /// </summary>
        full
    }

    public class DashboardView: Widget<DashboardView>
    {
        public DashboardView(HtmlHelper helper)
            : base(helper)
        {

        }

        protected override string WidgetType
        {
            get
            {
                return "jdash.ui.DashboardView";
            }
        }

        public DashboardView Animations(bool enabled)
        {
            this.WidgetConfig["animations"] = enabled;
            return this;
        }

        public DashboardView DesignMode(DashboardDesignMode mode)
        {
            this.WidgetConfig["designMode"] = getClientValue(mode);
            return this;
        }


        public DashboardView Load(object id, string callback = null, string errback = null, string progback = null)
        {
            callback = string.IsNullOrEmpty(callback) ? "mvc.emptyFn" : callback;
            errback = string.IsNullOrEmpty(errback) ? "mvc.emptyFn" : errback;
            progback = string.IsNullOrEmpty(progback) ? "mvc.emptyFn" : progback;
            AddScript("mvc.when(mvc.getCmp('{0}').load('{1}'), {2}, {3}, {4});", this.ClientWidgetID, id.GetType() == typeof(string) ? id: id, callback, errback, progback);
            return this;
        }
    }
}
