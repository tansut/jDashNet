using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JDash.Models;
using OpenPop.Mime;
using OpenPop.Pop3;

namespace JDash.WebForms.Demo.JDash.Dashlets.PopClient
{
    public partial class View : System.Web.UI.UserControl
    {
        class EMailMessage
        {
            public string MessageId { get; set; }
            public int MessageIndex { get; set; }
            public DateTime Date { get; set; }
            public string From { get; set; }
            public string Subject { get; set; }
            public bool HasAttach { get; set; }
        }

        DashletContext context = null;

        #region Maximize-Restore
        [JEventHandler(JEvent.Maximize)]
        protected void Maximize(object sender, JEventArgs e)
        {
            IsMaximized = true;
            DataBind();
        }

        [JEventHandler(JEvent.Restore)]
        protected void Restore(object sender, JEventArgs e)
        {
            IsMaximized = false;
            DataBind();
        }


        public bool IsMaximized
        {
            get
            {
                return ViewState["maximized"] != null;
            }
            set
            {
                ViewState["maximized"] = value ? "1" : null;
            }
        }
        #endregion


        [JEventHandler(JEvent.InitContext)]
        public void InitContext(object sender, JEventArgs args)
        {
            this.context = args.Event.Parameters.Get<DashletContext>("context");
        }

        [JEventHandler(JEvent.Refresh)]
        protected void Refresh(object sender, JEventArgs e)
        {
            var username = context.Model.config.Get<string>("username", null);
            var server = context.Model.config.Get<string>("server", null);
            if (!string.IsNullOrEmpty(username) && !string.IsNullOrEmpty(server))
            {
                var doBind = e.Event.Parameters.ContainsKey("doBind");
                try
                {
                    if (doBind)
                    {
                        ShowEmails();
                        Label1.Text = "";
                    }
                    else
                    {
                        Label1.Text = "";
                        MultiView1.ActiveViewIndex = 0;
                        waitTimer.Enabled = true;
                    }

                }
                catch (Exception ex)
                {
                    Label1.Text = ex.Message;
                }
            }

            else
            {
                Label1.Text = "";
                ShowMessages(CreateDemoMessages(), false);
            }
        }

        private List<EMailMessage> CreateDemoMessages()
        {
            List<EMailMessage> list = new List<EMailMessage>();
            EMailMessage msg1 = new EMailMessage() { Date = DateTime.Now, Subject = "Hi from mars! You have been selected.", HasAttach = true, From = "Unidentified Sender" };
            EMailMessage msg2 = new EMailMessage() { Date = DateTime.Now.AddDays(-5), Subject = "Documentation", HasAttach = false, From = "My friend" };
            EMailMessage msg3 = new EMailMessage() { Date = DateTime.Now.AddDays(-7), Subject = "Please review attached document", HasAttach = true, From = "My boss" };
            list.AddRange(new EMailMessage[] { msg1, msg2, msg3 });
            return list;

        }


        protected void waitTimer_Tick(object sender, EventArgs e)
        {
            waitTimer.Enabled = false;
            MultiView1.ActiveViewIndex = 1;
            var timerEvent = new JEvent(JEvent.Refresh);
            timerEvent.Parameters.Add("doBind", true);
            var args = new JEventArgs(timerEvent);
            Refresh(this, args);

        }

        private void BindMessages(Pop3Client cl)
        {
            int count = cl.GetMessageCount(), index = 0;
            List<EMailMessage> messages = new List<EMailMessage>(count);
            for (int i = count; i > 0; i--)
            {
                EMailMessage msg = new EMailMessage();
                var m = cl.GetMessageHeaders(i);

                try
                {
                    msg.Date = DateTime.Parse(m.Date, System.Globalization.CultureInfo.InvariantCulture);
                }
                catch (FormatException)
                {
                }
                msg.From = m.From.DisplayName;
                //msg.HasAttach = m.HasAttachment;
                msg.MessageId = m.MessageId;
                msg.MessageIndex = i;
                msg.Subject = m.Subject;
                messages.Add(msg);
                if (++index > 5)
                    break;

            }
            ShowMessages(messages, index > 5);
        }


        public override void DataBind()
        {
            Refresh(this, JEventArgs.Empty);
            base.DataBind();
        }


        protected void ctlRep_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Image l = e.Item.FindControl("ctlAttach") as Image;
                l.Visible = (e.Item.DataItem as EMailMessage).HasAttach;
            }

        }

        private void ShowMessages(List<EMailMessage> messages, bool hasMore)
        {
            ctlRep.DataSource = messages;
            ctlRep.DataBind();
            if (hasMore)
                Label2.Text = "You have more messages ...";
            else Label2.Text = "";
        }

        public static bool ValidateServerCertificate(object sender, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors)
        {
            if (sslPolicyErrors == SslPolicyErrors.None)
                return true;
            return false;
        }

        private void ShowEmails()
        {
            var username = context.Model.config.Get<string>("username");
            var password = context.Model.config.Get<string>("password", "");
            var server = context.Model.config.Get<string>("server");
            var port = context.Model.config.Get<int>("port", 110);
            var ssl = context.Model.config.Get<bool>("ssl", false);


            try
            {
                var cl = new Pop3Client();
                cl.Connect(server, port, ssl, 3000, 30000, ValidateServerCertificate);
                cl.Authenticate(username, password, AuthenticationMethod.Auto);
                BindMessages(cl);
                cl.Disconnect();
            }
            catch (Exception exc)
            {
                ctlRep.DataSource = null;
                ctlRep.DataBind();
                Label2.Text = exc.Message;
            }
        }

    }
}