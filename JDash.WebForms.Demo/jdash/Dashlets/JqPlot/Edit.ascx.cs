using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JDash;

using JDash.WebForms.Utils;

namespace JDash.WebForms.Demo.JDash.Dashlets.JqPlot
{
    public partial class Edit : System.Web.UI.UserControl
    {
        DashletContext context = null;

        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
        }


        public override void DataBind()
        {
            ctlPresets.DataSource = GetPresetsDictionary();
            ctlPresets.DataBind();
            var selected = context.Model.config.Get<string>("preset", "");
            if (!string.IsNullOrWhiteSpace(selected))
                ctlPresets.SelectedValue = selected;
            else ctlPresets.SelectedIndex = 0;
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
            context.Model.config["preset"] = ctlPresets.SelectedValue.ToString();
            context.SaveModel();
            context.DashletControl.DataBind();
        }

        private IEnumerable<dynamic> GetPresetsDictionary()
        {
            var presets = File.ReadAllText(Server.MapPath("~/jdash/Dashlets/JqPlot/resources/presets.json"));
            return SerializationUtils.Deserialize<IEnumerable<dynamic>>(presets).Select(s => s.chartConfig.config); ;
        }

    }
}