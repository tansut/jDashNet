using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JDash;
using JDash.Helpers;
using JDash.WebForms.Demo.Jdash.Dashlets.MsChart;


namespace JDash.WebForms.Demo.Jdash.Dashlets.MsChart
{
    public partial class Edit : System.Web.UI.UserControl
    {
        DashletContext context = null;

        public override void DataBind()
        {
            var settings = context.Model.config.Get<string>("settings", null);
            if (string.IsNullOrEmpty(settings))
                ChartSettingsControl1.DoEdit(null);
            else
            {
                var obj = (MsChartSettings)Serialization.DeserializeFromXmlDataContract(settings, typeof(MsChartSettings));
                ChartSettingsControl1.DoEdit(obj);
            }

            
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
            var settings = ChartSettingsControl1.EndEdit(null);
            context.Model.config["settings"] = Serialization.SerializeToXmlDataContract(settings);
            context.SaveModel();
            context.DashletControl.DataBind();
        }
    }
}