using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JDash;


namespace JDash.WebForms.Demo.JDash.Dashlets.PopClient
{
    public partial class Edit : System.Web.UI.UserControl
    {
        DashletContext context = null;

        public override void DataBind()
        {
            txtUsername.Text = context.Model.config.Get<string>("username", "");
            txtPassword.Text = context.Model.config.Get<string>("password", "");
            txtServer.Text = context.Model.config.Get<string>("server", "");
            txtPort.Text = context.Model.config.Get<int>("port", 110).ToString();
            ctlSSL.Checked = context.Model.config.Get<bool>("ssl", false);

            base.DataBind();
        }

        [JEventHandler(JEvent.InitContext)]
        public void InitContext(object sender, JEventArgs args)
        {
            this.context = args.Event.Parameters.Get<DashletContext>("context");
        }

        [JEventHandler(JEvent.ValidateDashletEditor)]
        public void ValidateDashletEditor(object sender, JEventArgs args)
        {
            context.Model.config["username"] = txtUsername.Text;
            context.Model.config["password"] = txtPassword.Text;
            context.Model.config["server"] = txtServer.Text;
            context.Model.config["port"] = int.Parse(txtPort.Text);
            context.Model.config["ssl"] = ctlSSL.Checked ;

            context.SaveModel();
            context.DashletControl.DataBind();
        }
    }
}