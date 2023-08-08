using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JDash.Models;


namespace JDash.WebForms.Demo.JDash.Dashlets.EventCapture
{
    public partial class View : System.Web.UI.UserControl
    {
        [Serializable]
        public class EventData
        {
            public DateTime EventTime { get; set; }
            public string EventName { get; set; }
        }

        public List<EventData> CurrentEvents
        {
            get
            {
                if (ViewState["events"] == null)
                    return new List<EventData>();
                else return (List<EventData>)ViewState["events"];
            }

            set
            {
                ViewState["events"] = value;
            }
        }

        DashletContext context = null;

        [JEventHandler("ClearCapturedEvents")]
        public void ClearCapturedEvents(object sender, JEventArgs args)
        {
            var events = CurrentEvents;
            events.Clear();

            CurrentEvents = events;
            DataBind();
        }

        [JEventHandler(JEvent.InitContext)]
        public void InitContext(object sender, JEventArgs args)
        {
            this.context = args.Event.Parameters.Get<DashletContext>("context");
            context.Dashboard.EventExecuted += Dashboard_EventExecuted;            
        }

        public override void DataBind()
        {
            eventGrid.DataSource = CurrentEvents;
            eventGrid.DataBind();
            context.RenderDashlet();
            base.DataBind();
        }

        void Dashboard_EventExecuted(object sender, JEventArgs e)
        {
            var events = CurrentEvents;
            events.Insert(0, new EventData()
            {
                EventTime = DateTime.Now,
                EventName = e.Event.Name
            });
            if (events.Count > 15)
                events.RemoveRange(15, events.Count - 15);
            CurrentEvents = events;
            DataBind();
        }
    }
}