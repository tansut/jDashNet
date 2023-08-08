using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JDash.InMemoryAnalytics.Modeling;
using JDash.InMemoryAnalytics.Engine;
using JDash.Helpers;


namespace JDash.WebForms.Demo.JDash.Dashlets.DataAnalysis
{
    public partial class chartviewEditor : System.Web.UI.UserControl
    {
        DashletContext context = null;
        List<CubeModel> cubes = DemoAnalysisProvider.GetCubes();
        const int stepCount = 5;
        public int Step
        {
            get
            {
                return ViewState["step"] != null ? (int)ViewState["step"] : 1;
            }
            set
            {
                ViewState["step"] = value;
            }
        }


        [JEventHandler(JEvent.InitContext)]
        public void InitContext(object sender, JEventArgs args)
        {
            this.context = args.Event.Parameters.Get<DashletContext>("context");
        }

        [JEventHandler(JEvent.ValidateDashletEditor)]
        public void ValidateDashletEditor(object sender, JEventArgs args)
        {
            var query = new MdQuery();
            var chart = new ChartSettings();

            query.CubeName = ctlCube.SelectedValue;

            if (!string.IsNullOrEmpty(ctlPivotDimension.SelectedValue))
                query.Dimensions.Add(ctlPivotDimension.SelectedValue);

            query.Dimensions.Add(ctlFirstDimension.SelectedValue);

            if (!string.IsNullOrEmpty(ctlSecondDimension.SelectedValue))
                query.Dimensions.Add(ctlSecondDimension.SelectedValue);


            query.Measures.Add(ctlFirstMetric.SelectedValue);

            query.Sort.Clear();
            if (!string.IsNullOrEmpty(ctlSort.SelectedValue))
                query.Sort.Add(new Sort(ctlSort.SelectedValue, InMemoryAnalytics.Engine.SortDirection.Ascending));

            chart.ChartType = (ChartType)Enum.Parse(typeof(ChartType), ctlChartTypes.SelectedValue);
            chart.Header = ctlHeader.Text;
            chart.Footer = ctlFooter.Text;
            chart.Height = ctlHeight.Text;
            chart.HasPivotDimension = !string.IsNullOrEmpty(ctlPivotDimension.SelectedValue);

            chart.Theme = ctlTheme.SelectedValue;

            context.Model.config.SetObject("query", query);
            context.Model.config.SetObject("chart", chart);
            context.SaveModel();
            context.DashletControl.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public override void DataBind()
        {
            ctlCube.DataSource = cubes;
            ctlCube.DataBind();

            MdQuery query = context.Model.config.GetObject<MdQuery>("query", null);
            ChartSettings settings = context.Model.config.GetObject<ChartSettings>("chart", null);

            ctlTheme.DataSource = ChartSettings.Themes;
            ctlTheme.DataBind();
            ctlTheme.SelectedIndex = 0;

            if (query != null)
            {
                ctlCube.SelectedIndex = cubes.FindIndex(p => p.Name == query.CubeName);
                LoadUI(query.CubeName, query, settings);
            }
            else LoadUI(cubes[0].Name);
            base.DataBind();
        }

        protected void ctlCube_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadUI(ctlCube.SelectedValue);
        }

        private void LoadUI(string cubeName, MdQuery query = null, ChartSettings chart = null)
        {
            
            var cube = cubes.SingleOrDefault(p => p.Name == cubeName);
            if (cube == null)
                return;
            ctlHeader.Text = cube.Caption;
            ctlFirstDimension.DataSource = cube.Dimensions;
            ctlFirstDimension.DataBind();

            var dimensionList = new List<DimensionModel>(cube.Dimensions);
            dimensionList.Insert(0, new DimensionModel("", DataType.Text));

            ctlSecondDimension.DataSource = dimensionList;
            ctlSecondDimension.DataBind();

            ctlPivotDimension.DataSource = dimensionList;
            ctlPivotDimension.DataBind();

            ctlFirstMetric.DataSource = cube.Measures;
            ctlFirstMetric.DataBind();

            var measureList = new List<MeasureModel>(cube.Measures);
            measureList.Insert(0, new MeasureModel("", DataType.Text));



            var sortDirectionList = new List<string>(Enum.GetNames(typeof(global::JDash.InMemoryAnalytics.Engine.SortDirection)));


            if (query != null)
            {
                if (chart.HasPivotDimension)
                {
                    ctlPivotDimension.SelectedIndex = cube.Dimensions.FindIndex(p => p.Name == query.Dimensions[0]) + 1;
                    ctlFirstDimension.SelectedIndex = cube.Dimensions.FindIndex(p => p.Name == query.Dimensions[1]);
                    if (query.Dimensions.Count > 2)
                        ctlSecondDimension.SelectedIndex = cube.Dimensions.FindIndex(p => p.Name == query.Dimensions[2]) + 1;
                }
                else
                {
                    ctlFirstDimension.SelectedIndex = cube.Dimensions.FindIndex(p => p.Name == query.Dimensions[0]);
                    if (query.Dimensions.Count > 1)
                        ctlSecondDimension.SelectedIndex = cube.Dimensions.FindIndex(p => p.Name == query.Dimensions[1]) + 1;
                }

                ctlFirstMetric.SelectedIndex = cube.Measures.FindIndex(p => p.Name == query.Measures[0]);

                var sortList = FillSortColumns();


                if (query.Sort.Count == 1)
                {
                    ctlSort.SelectedIndex = sortList.FindIndex(p => p.Key == query.Sort[0].Column);
                }
            }
            if (chart != null)
            {
                ctlChartTypes.SelectedValue = chart.ChartType.ToString();
                ctlHeader.Text = chart.Header;
                ctlFooter.Text = chart.Footer;
                ctlHeight.Text = chart.Height;
                ctlTheme.SelectedIndex = ChartSettings.Themes.FindIndex(p => p.Key == chart.Theme);
            }
        }

        protected List<KeyValuePair<string, string>> FillSortColumns()
        {
            var allList = new List<KeyValuePair<string, string>>();
            allList.Add(new KeyValuePair<string, string>("", ""));

            if (!string.IsNullOrEmpty(ctlFirstDimension.SelectedValue) && ctlFirstDimension.SelectedItem != null)
                allList.Add(new KeyValuePair<string, string>(ctlFirstDimension.SelectedItem.Value, ctlFirstDimension.SelectedItem.Text));

            if (!string.IsNullOrEmpty(ctlSecondDimension.SelectedValue) && ctlSecondDimension.SelectedItem != null)
                allList.Add(new KeyValuePair<string, string>(ctlSecondDimension.SelectedItem.Value, ctlSecondDimension.SelectedItem.Text));


            if (!string.IsNullOrEmpty(ctlFirstMetric.SelectedValue) && ctlFirstMetric.SelectedItem != null)
                allList.Add(new KeyValuePair<string, string>(ctlFirstMetric.SelectedItem.Value, ctlFirstMetric.SelectedItem.Text));

            if (!string.IsNullOrEmpty(ctlPivotDimension.SelectedValue) && ctlPivotDimension.SelectedItem != null)
                allList.Add(new KeyValuePair<string, string>(ctlPivotDimension.SelectedItem.Value, ctlPivotDimension.SelectedItem.Text));

            var sort1 = ctlSort.SelectedValue;

            ctlSort.DataSource = allList;
            ctlSort.DataBind();

            ctlSort.SelectedIndex = allList.FindIndex(p => p.Key == sort1);

            return allList;
        }

        protected void RebuildSortColumns(object sender, EventArgs e)
        {
            FillSortColumns();
        }

        protected void ctlNextButton_Click(object sender, EventArgs e)
        {
            handleStep(1);

        }

        protected void ctlPrevButton_Click(object sender, EventArgs e)
        {
            handleStep(-1);
        }

        private void handleStep(int stepDiff)
        {
            var newStep = Step + stepDiff;
            if (newStep >= 1 && newStep <= stepCount)
            {

                Step = newStep;
                ctlPrevButton.Attributes["style"] = Step == 1 ? "visibility:hidden" : "visibility:visible";
                ctlNextButton.Attributes["style"] = Step == stepCount ? "visibility:hidden" : "visibility:visible";
                ctlStepCounter.Text = string.Format("{0} / {1}", Step, stepCount);
                ctlStep1.Visible = ctlStep2.Visible = ctlStep3.Visible = ctlStep4.Visible = ctlStep5.Visible = false;
                ctlStepCaption.Text = (String)GetGlobalResourceObject("Global", "ChartDataDashletStep" + Step);
                switch (Step)
                {
                    case 1:
                        ctlStep1.Visible = true;
                        break;
                    case 2:
                        ctlStep2.Visible = true;
                        break;
                    case 3:
                        ctlStep3.Visible = true;
                        break;
                    case 4:
                        ctlStep4.Visible = true;
                        break;
                    case 5:
                        ctlStep5.Visible = true;
                        break;
                }
            }
        }
    }
}