using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JDash.Models;


namespace JDash.WebForms.Demo.JDash.Dashlets.GoogleMaps
{
    public partial class View : System.Web.UI.UserControl
    {
        DashletContext context = null;

        [JEventHandler(JEvent.InitContext)]
        public void InitContext(object sender, JEventArgs args)
        {
            this.context = args.Event.Parameters.Get<DashletContext>("context");
        }

        public override void DataBind()
        {
            base.DataBind();
        }

    }
}