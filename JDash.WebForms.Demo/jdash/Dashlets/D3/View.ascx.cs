using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDash.WebForms.Demo.JDash.Dashlets.D3
{
    public partial class View : System.Web.UI.UserControl
    {
        DashletContext context = null;
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        public override void DataBind()
        {
            var preset = context.Model.config.Get<string>("preset", null);
            context.CallClient("renderSample", preset);
            base.DataBind();
        }

        [JEventHandler(JEvent.InitContext)]
        public void InitContext(object sender, JEventArgs args)
        {
            this.context = args.Event.Parameters.Get<DashletContext>("context");
        }



        
    }
}