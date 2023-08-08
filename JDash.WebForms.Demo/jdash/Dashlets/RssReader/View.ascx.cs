using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using RssToolkit.Rss;

namespace JDash.WebForms.Demo.JDash.Dashlets.RssReader
{
    public partial class View : System.Web.UI.UserControl
    {
        private bool sd = false;
        private DashletContext context;

        [JEventHandler(JEvent.InitContext)]
        protected void InitContext(object sender, JEventArgs e)
        {
            this.context = e.Event.Parameters.Get<DashletContext>("context");
        }


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

        public override void DataBind()
        {
            Refresh(this, JEventArgs.Empty);
            base.DataBind();
        }


        [JEventHandler(JEvent.Refresh)]
        protected void Refresh(object sender, JEventArgs e)
        {
            var rssUrl = context.Model.config.Get<string>("RssUrl", null);
            if (!string.IsNullOrEmpty(rssUrl))
            {
               
                var doBind = e.Event.Parameters.ContainsKey("doBind");
                try
                {
                    if (doBind)
                    {
                        try
                        {
                            ctlRep.DataSource = null;
                            sd = IsMaximized || context.Model.config.Get<bool>("ShowBody", false);
                            var rss = RssDocument.Load(new System.Uri(rssUrl));
                            int itemCount = context.Model.config.Get<int>("Interval");
                            if (IsMaximized) itemCount = itemCount * 2;
                            ctlRep.DataSource = rss.SelectItems(itemCount);
                            ctlRep.DataBind();
                            Label1.Text = "";
                        }
                        finally
                        {
                            context.CallClientContext("clearBusy");
                        }                        
                    }
                    else
                    {
                        context.CallClientContext("setBusy");
                        MultiView1.ActiveViewIndex = 0;
                        waitTimer.Enabled = true;
                    }

                }
                catch (Exception ex)
                {
                    Label1.Text = ex.Message;
                }
                finally
                {
                    context.RenderDashlet();
                }
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            waitTimer.Enabled = false;
            MultiView1.ActiveViewIndex = 1;
            var timerEvent = new JEvent(JEvent.Refresh);
            timerEvent.Parameters.Add("doBind", true);
            var args = new JEventArgs(timerEvent);
            Refresh(this, args);

        }

        public bool IsMaximized
        {
            get
            {
                return ViewState["maximized"] != null;
            }
            set
            {
                ViewState["maximized"] = value ? "1": null;
            }
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Literal l = e.Item.FindControl("description") as Literal;
            if (l != null)
            {
                if (!sd)
                {
                    return;
                }

                string v = DataBinder.Eval(e.Item.DataItem, "description") as string;

                if (ViewState["MaxChar"] != null && !IsMaximized)
                {
                    int chars;
                    if (int.TryParse((string)ViewState["MaxChar"], out chars))
                    {
                        if (v.Length > chars && chars > 0)
                            l.Text = v.Substring(0, chars) + "...";
                        else l.Text = v;
                    }
                    else l.Text = v;
                }
                else l.Text = v;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}