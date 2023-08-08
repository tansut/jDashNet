using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JDash.Models;


namespace JDash.WebForms.Demo.JDash.Dashlets.DashboardList
{
    public partial class View : System.Web.UI.UserControl
    {



        DashletContext context = null;


        [JEventHandler(JEvent.InitContext)]
        public void InitContext(object sender, JEventArgs args)
        {
            this.context = args.Event.Parameters.Get<DashletContext>("context");
        }

        [JEventHandler(JEvent.Refresh)]
        public void Refresh(object sender, JEventArgs args)
        {
            this.DataBind();
        }

        public override void DataBind()
        {
            dataGrid.DataSource = JDashManager.Provider.SearchDashboards().data;
            dataGrid.DataBind();
            context.RenderDashlet();
            base.DataBind();
        }

        protected void dataGrid_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            var id = e.CommandArgument.ToString();
            context.Dashboard.DashboardId = id;
            context.Dashboard.DataBind();
        }

    }
}