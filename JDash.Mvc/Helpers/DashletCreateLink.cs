using JDash.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace JDash.Mvc
{
    public enum DashletCreateBehaviour
    {
        Click,
        Drag,
        Both
    }

    public class DashletCreateLink : Widget<DashletCreateLink>
    {
        private DashletCreateBehaviour userBehaviour = DashletCreateBehaviour.Click;

        protected override string WidgetType
        {
            get { return "jdash.ui.DashletCreateLink"; }
        }

        protected override void RenderAttributes(TagBuilder tb)
        {
            string createType = "click";
            switch (userBehaviour)
            {
                case DashletCreateBehaviour.Click:
                    createType = "click";
                    break;
                case DashletCreateBehaviour.Drag:
                    createType = "drag";
                    break;
                case DashletCreateBehaviour.Both:
                    createType = "both";
                    break;
                default:
                    break;
            }

            tb.MergeAttribute("data-jdash-createType", createType);

            if (this.userBehaviour == DashletCreateBehaviour.Click)
            {
                base.RenderAttributes(tb);
            }
            else
            {
                dynamic moduleId;
                if (WidgetConfig.TryGetValue("moduleId", out moduleId))
                    tb.MergeAttribute("data-jdash-moduleid", (string)moduleId);
            }
        }


        public DashletCreateLink Behaviour(DashletCreateBehaviour value)
        {
            this.userBehaviour = value;
            return this;
        }

        public DashletCreateLink DashboardView(string id)
        {
            WidgetConfig["dashboardView"] = id;
            return this;
        }

        public DashletCreateLink Module(string id)
        {
            WidgetConfig["moduleId"] = id;
            return this;
        }


        public DashletCreateLink(HtmlHelper helper)
            : base(helper)
        {
            this.tag = "a";
        }
    }
}
