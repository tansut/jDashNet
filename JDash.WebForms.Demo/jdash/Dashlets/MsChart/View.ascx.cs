using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;
using JDash.Models;


namespace JDash.WebForms.Demo.Jdash.Dashlets.MsChart
{
    public partial class View : BaseChart
    {

        [JEventHandler(JEvent.InitContext)]
        public void InitContext(object sender, JEventArgs args)
        {
            this.context = args.Event.Parameters.Get<DashletContext>("context");
            context.Dashboard.ContentsUpdated += Dashboard_ContentsUpdated;
        }

        void Dashboard_ContentsUpdated(object sender, EventArgs e)
        {
            DataBind();
        }

        protected override Chart ThisChart
        {
            get
            {
                return chr;
            }
        }

        protected override void DataBindChart()
        {
            Random random = new Random();
            DateTime xTime = DateTime.Today;
            for (int pointIndex = 0; pointIndex < 6; pointIndex++)
            {
                double yValue = random.Next(600, 950);
                if (xTime.DayOfWeek == DayOfWeek.Sunday || xTime.DayOfWeek == DayOfWeek.Saturday)
                {
                    yValue = random.Next(100, 400);
                }
                chr.Series["Default"].Points.AddXY(xTime, yValue);
                xTime = xTime.AddDays(1);
            }

            double offset = -1.5;
            double width = 2;


            offset = -1.5;
            width = 2;
            StripLine stripLine = new StripLine();
            stripLine.IntervalOffset = offset;
            stripLine.IntervalOffsetType = DateTimeIntervalType.Days;
            stripLine.Interval = 1;
            stripLine.IntervalType = DateTimeIntervalType.Weeks;
            stripLine.StripWidth = width;
            stripLine.StripWidthType = DateTimeIntervalType.Days;
            chr.ChartAreas["ChartArea1"].AxisX.StripLines.Add(stripLine);
        }

        protected override void SettingPreRenderProperties(System.Web.UI.DataVisualization.Charting.Chart chart, MsChartSettings settings)
        {
            chart.ChartAreas[0].AxisX.Title = "Sample Date";
            chart.ChartAreas[0].AxisY.Title = "Random Value";
            base.SettingPreRenderProperties(chart, settings);
        }

        protected override void SetSettings(MsChartSettings settings)
        {
            if (settings == null)
            {
                ctlDesc.Visible = true;
                ctlDesc.Text = "Chart will be displayed after saving settings. Please click 'Edit Settings' tool button above.";
            }
            else if (!string.IsNullOrEmpty(settings.Description))
            {
                ctlDesc.Visible = true;
                ctlDesc.Text = settings.Description;
            }
            else ctlDesc.Visible = false;
        }

        [JEventHandler(JEvent.Refresh)]
        public void Refresh(object sender, JEventArgs args)
        {
            DataBind();
        }

        [JEventHandler(JEvent.Maximize)]
        public void Maximize(object sender, JEventArgs args)
        {
            
        }
    }
}