using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDash.WebForms.Demo.JDash.Dashlets.RssReader
{
    public partial class Edit : System.Web.UI.UserControl
    {

        DashletContext context = null;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public override void DataBind()
        {
            if (context.Model.config.ContainsKey("RssUrl"))
            {
                ctlRss.Text = context.Model.config.Get<string>("RssUrl");
                ctlInterval.Text = context.Model.config.Get<string>("Interval");
                ctlDesc.Checked = context.Model.config.Get<bool>("ShowBody");
            }
            base.DataBind();
        }

        [JEventHandler(JEvent.InitContext)]
        public void InitContext(object sender, JEventArgs args)
        {
            this.context = args.Event.Parameters.Get<DashletContext>("context");
        }

        [JEventHandler(JEvent.ValidateDashletEditor)]
        public void Validate(object sender, JEventArgs args)
        {
            context.Model.config["RssUrl"] = ctlRss.Text;
            context.Model.config["Interval"] = int.Parse(ctlInterval.Text);
            context.Model.config["ShowBody"] = ctlDesc.Checked;
            context.SaveModel();
            context.DashletControl.DataBind();
        }
    }
}