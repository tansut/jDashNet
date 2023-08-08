using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDash.WebForms.Demo.JDash.Dashlets.RichText
{
    public partial class View : System.Web.UI.UserControl
    {
        DashletContext context = null;

        [JEventHandler(JEvent.InitContext)]
        public void InitContext(object sender, JEventArgs args)
        {
            this.context = args.Event.Parameters.Get<DashletContext>("context");
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public override void DataBind()
        {

            var data = context.Model.config.Get<string>("data", "");
            if (!string.IsNullOrWhiteSpace(data))
                ctlHTML.Text = data;
            context.RenderDashlet();
            
            base.DataBind();
        }

        [JEventHandler(JEvent.Refresh)]
        public void Refresh(object sender, JEventArgs args)
        {
            DataBind();
        }

    }
}