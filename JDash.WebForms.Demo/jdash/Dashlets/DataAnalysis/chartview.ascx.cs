using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using JDash.InMemoryAnalytics.Engine;
using JDash.InMemoryAnalytics.Modeling;

namespace JDash.WebForms.Demo.JDash.Dashlets.DataAnalysis
{
    public enum ChartType
    {
        Bar,
        Column,
        Line,
        Area,
        Pie
    }

    

    public class ChartSettings
    {
        public ChartType ChartType { get; set; }
        public string Header { get; set; }
        public string Footer { get; set; }
        public string Height { get; set; }
        public bool HasPivotDimension { get; set; }
        public string Theme { get; set; }

        public readonly static List<KeyValuePair<string, string>> Themes;

        static ChartSettings()
        {
            Themes = new List<KeyValuePair<string, string>>(3);
            Themes.Add(new KeyValuePair<string, string>("default",Resources.Global.ChartThemeDefault));
            Themes.Add(new KeyValuePair<string, string>("gray", Resources.Global.ChartThemeGray ));
            Themes.Add(new KeyValuePair<string, string>("green", Resources.Global.ChartThemeGreen));
            Themes.Add(new KeyValuePair<string, string>("blue", Resources.Global.ChartThemeBlue));
        }
    }

    public partial class chartview : System.Web.UI.UserControl
    {
        DashletContext context = null;
        List<CubeModel> cubes = null;

        [JEventHandler(JEvent.InitContext)]
        public void InitContext(object sender, JEventArgs args)
        {
            this.context = args.Event.Parameters.Get<DashletContext>("context");
        }

        [JEventHandler(JEvent.Refresh)]
        public void Refresh(object sender, JEventArgs args)
        {
            this.DataBind();
        }

        public override void DataBind()
        {

            try
            {
                var query = context.Model.config.GetObject<MdQuery>("query", null);
                var chartSettings = context.Model.config.GetObject<ChartSettings>("chart", null);
                if (query != null)
                {
                    cubes = DemoAnalysisProvider.GetCubes();
                    var activeCube = cubes.SingleOrDefault(p => p.Name == query.CubeName);
                    if (activeCube != null)
                    {
                        query.SourceData = DemoAnalysisProvider.GetSourceData(query.CubeName);
                        var engine = new DataEngine(activeCube);
                        var chartData = engine.Execute(query);
                        var clientInfo = new { chart = chartSettings, data = chartData };
                        this.context.CallClient("setChartData", clientInfo);
                    }
                }
                else this.context.CallClient("createChart");
                context.RenderDashlet();
            }
            catch 
            {
                throw;
            }

            base.DataBind();
        }
    }
}