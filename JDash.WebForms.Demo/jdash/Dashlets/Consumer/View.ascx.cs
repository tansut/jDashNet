using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDash.WebForms.Demo.JDash.Dashlets.Consumer
{
    public partial class View : System.Web.UI.UserControl
    {

        DashletContext context = null;

        [JEventHandler(JEvent.InitContext)]
        public void InitContext(object sender, JEventArgs args)
        {
            this.context = args.Event.Parameters.Get<DashletContext>("context");
        }

        [JEventHandler("SamplePublish")]
        public void RecieveMessage(object sender, JEventArgs args)
        {
            var msg = args.Event.Parameters.Get<string>("message", null);
            if (msg != null)
            {
                messageText.Text = string.Format("<b>{0}</b><br/>{1}", msg, messageText.Text);
                context.RenderDashlet();
            }
        }
    }
}