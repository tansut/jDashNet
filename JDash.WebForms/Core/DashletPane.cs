using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Web.UI;
using JDash.Models;

namespace JDash.WebForms
{
    [ViewStateModeById(), ToolboxItem(false)]    
    internal class DashletPane: JPane
    {

        protected override void OnPreRender(EventArgs e)
        {
            Attributes.Add("class", "wfDashletContainer");
            Attributes.Add("data-jdash-dashletId", Model.id);
            Attributes.Add("data-jdash-ownerDashboard", Dashboard.ClientWidgetID);
            base.OnPreRender(e);
        }

        internal DashletPane(DashletContext context): base(context)
        {
            context.DashletPane = this;
            this.ID = "d" + Model.id;
        }



    }
}
