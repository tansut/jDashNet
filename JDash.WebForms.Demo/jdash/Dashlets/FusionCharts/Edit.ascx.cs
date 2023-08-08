using JDash.WebForms.Utils;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDash.WebForms.Demo.JDash.Dashlets.FusionCharts
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
            if (!string.IsNullOrEmpty(ctlPresets.SelectedValue))
            {
                context.Model.config["preset"] = getTemplates().First(s => (string)(s.title) == ctlPresets.SelectedValue);
                context.SaveModel();
                context.DashletControl.DataBind();
            }
        }

        public override void DataBind()
        {
            var peresets = getTemplates();
            ctlPresets.DataSource = peresets.Select(s => (string)(s.title)).ToList();
            var selected = context.Model.config.Get<dynamic>("preset", null);
            if (selected != null)
                ctlPresets.SelectedValue = selected.title;
            else ctlPresets.SelectedIndex = 0;
            ctlPresets.DataBind();

        }

        private void setDynamicValue(Dictionary<string, object> config, string key, object value, bool validate = true)
        {
            if (validate && value.GetType() == typeof(string) && value.ToString().Trim().Length == 0) return;
            if (!config.ContainsKey(key)) config.Add(key, value); else config[key] = value;
        }

        private IEnumerable<dynamic> getTemplates()
        {
            var presets = File.ReadAllText(Server.MapPath("~/JDash/Dashlets/FusionCharts/resources/presets.js"));
            
            return SerializationUtils.Deserialize<IEnumerable<dynamic>>(presets) ;

       
        }



    }
}