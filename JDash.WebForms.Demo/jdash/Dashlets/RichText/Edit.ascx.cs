using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDash.WebForms.Demo.JDash.Dashlets.RichText
{
    public partial class Edit : System.Web.UI.UserControl
    {
        DashletContext context = null;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [JEventHandler(JEvent.InitContext)]
        public void InitContext(object sender, JEventArgs args)
        {
            this.context = args.Event.Parameters.Get<DashletContext>("context");
        }

        [JEventHandler(JEvent.ValidateDashletEditor)]
        public void ValidateDashletEditor(object sender, JEventArgs args)
        {
            context.Model.config["data"] = ctlCkEditor.Text;
            context.SaveModel();
            context.DashletControl.DataBind();
            ResourceManager.GetInstance().AddScript(string.Format("CKEDITOR.remove(CKEDITOR.instances['{0}']);", ctlCkEditor.ClientID));
        }


        [JEventHandler(JEvent.CancelDashletEditor)]
        public void CancelDashletEditor(object sender, JEventArgs args)
        {
            ResourceManager.GetInstance().AddScript(string.Format("CKEDITOR.remove(CKEDITOR.instances['{0}']);", ctlCkEditor.ClientID));
        }




        public override void DataBind()
        {


            var data = context.Model.config.Get<string>("data", "");
            if (!string.IsNullOrWhiteSpace(data))
                ctlCkEditor.Text = data;            
            base.DataBind();
        }
    }
}