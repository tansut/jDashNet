using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDash.WebForms.Demo.JDash.Dashlets.FusionCharts
{
    public partial class View : System.Web.UI.UserControl
    {
        DashletContext context = null;

        protected override void OnLoad(EventArgs e)
        {
            ((JPane)this.Parent.Parent.Parent).ChildrenAsTriggers = false;
            base.OnLoad(e);
        }

        [JEventHandler(JEvent.InitContext)]
        public void InitContext(object sender, JEventArgs args)
        {
            this.context = args.Event.Parameters.Get<DashletContext>("context");
        }

        [JEventHandler(JEvent.Refresh)]
        public void Refresh(object sender, JEventArgs args)
        {
            DataBind();
        }

        public override void DataBind()
        {
            var preset = context.Model.config.Get<dynamic>("preset", null);


            context.CallClient("renderChart", preset);


            base.DataBind();
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            DataBind();
        }
    }
}