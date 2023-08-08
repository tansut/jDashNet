using JDash.WebForms.Utils;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDash.WebForms.Demo.JDash.Dashlets.D3
{
    public partial class Edit : System.Web.UI.UserControl
    {
        DashletContext context = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            var s = getPresets();
          //	((dynamic)s).Presets[0].config.title	{SVG Wheels}	dynamic {Newtonsoft.Json.Linq.JValue}

        }
        [JEventHandler(JEvent.InitContext)]
        public void InitContext(object sender, JEventArgs args)
        {
            this.context = args.Event.Parameters.Get<DashletContext>("context");
        }

        public override void DataBind()
        {
            var peresets = getPresets();
            ctlPresetList.DataSource = getPresets();
            var selected = context.Model.config.Get<string>("preset", null);
            if (selected != null)
                ctlPresetList.SelectedValue = selected;
            else ctlPresetList.SelectedIndex = 0;
            ctlPresetList.DataBind();

        }

        [JEventHandler(JEvent.ValidateDashletEditor)]
        public void ValidateDashletEditor(object sender, JEventArgs args)
        {
            context.Model.config["preset"] = ctlPresetList.SelectedValue;
            context.SaveModel();
            context.DashletControl.DataBind();
        }

        private IEnumerable<string> getPresets()
        {
            var presets = File.ReadAllText(Server.MapPath(this.ResolveUrl("./resources/presets.js")));
            return (((IEnumerable<dynamic>)(SerializationUtils.Deserialize<dynamic>(presets).Presets)).Select(x =>(string)(x.config.title)).ToList());
        }
    }
}