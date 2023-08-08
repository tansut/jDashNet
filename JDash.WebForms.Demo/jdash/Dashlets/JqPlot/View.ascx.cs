using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JDash.Models;

using JDash.WebForms.Utils;

namespace JDash.WebForms.Demo.JDash.Dashlets.JqPlot
{
    public partial class View : System.Web.UI.UserControl
    {
        DashletContext context = null;

        [JEventHandler(JEvent.InitContext)]
        public void InitContext(object sender, JEventArgs args)
        {
            this.context = args.Event.Parameters.Get<DashletContext>("context");
        }

        [JEventHandler(JEvent.Refresh)]
        public void Refresh(object sender, JEventArgs args)
        {
            DataBind();
        }

        public override void DataBind()
        {
            
            var preset = context.Model.config.Get<string>("preset", "");
            if (!string.IsNullOrWhiteSpace(preset))
            {
                var data = GetPresetData(preset);
                context.CallClient("bind", data);
            }
            base.DataBind();
        }

        private string GetPresetData(string presetTitle)
        {
            var presets = File.ReadAllText(Server.MapPath("~/jdash/Dashlets/JqPlot/resources/presets.json"));
            return SerializationUtils.Serialize(SerializationUtils.Deserialize<IEnumerable<dynamic>>(presets).Where(s => s.chartConfig.config.title == presetTitle).Select(u => u.chartConfig));
        }


    }
}