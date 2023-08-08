using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JDash.InMemoryAnalytics.Modeling;
using JDash.InMemoryAnalytics.Engine;
using JDash.Helpers;
using System.Data;


namespace JDash.WebForms.Demo.JDash.Dashlets.DataAnalysis
{
    public partial class tableviewEditor : System.Web.UI.UserControl
    {
        DashletContext context = null;
        List<CubeModel> cubes = DemoAnalysisProvider.GetCubes();
        const int stepCount = 4;
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

            query.CubeName = ctlCube.SelectedValue;

            query.Dimensions.Add(ctlFirstDimension.SelectedValue);
            if (!string.IsNullOrEmpty(ctlSecondDimension.SelectedValue))
                query.Dimensions.Add(ctlSecondDimension.SelectedValue);

            query.Measures.Add(ctlFirstMetric.SelectedValue);
            if (!string.IsNullOrEmpty(ctlSecondMetric.SelectedValue))
                query.Measures.Add(ctlSecondMetric.SelectedValue);

            query.Take = string.IsNullOrEmpty(ctlTake.SelectedValue) ? -1 : int.Parse(ctlTake.SelectedValue);
            query.Sort.Clear();
            if (!string.IsNullOrEmpty(ctlSort.SelectedValue))
                query.Sort.Add(new Sort(ctlSort.SelectedValue, (InMemoryAnalytics.Engine.SortDirection)Enum.Parse(typeof(InMemoryAnalytics.Engine.SortDirection), ctlSortDir.SelectedValue)));

            if (!string.IsNullOrEmpty(ctlSecondSort.SelectedValue))
                query.Sort.Add(new Sort(ctlSecondSort.SelectedValue, (InMemoryAnalytics.Engine.SortDirection)Enum.Parse(typeof(InMemoryAnalytics.Engine.SortDirection), ctlSecondSortDir.SelectedValue)));

            context.Model.config.SetObject("query", query);
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
            if (query != null)
            {
                ctlCube.SelectedIndex = cubes.FindIndex(p => p.Name == query.CubeName);
                LoadUI(query.CubeName, query);
            }
            else LoadUI(cubes[0].Name);
            base.DataBind();
        }

        protected void ctlCube_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadUI(ctlCube.SelectedValue);
        }

        private void LoadUI(string cubeName, MdQuery query = null)
        {
            var cube = cubes.SingleOrDefault(p => p.Name == cubeName);
            if (cube == null)
                return;
            ctlFirstDimension.DataSource = cube.Dimensions;
            ctlFirstDimension.DataBind();

            var dimensionList = new List<DimensionModel>(cube.Dimensions);
            dimensionList.Insert(0, new DimensionModel("", DataType.Text));

            ctlSecondDimension.DataSource = dimensionList;
            ctlSecondDimension.DataBind();

            ctlFirstMetric.DataSource = cube.Measures;
            ctlFirstMetric.DataBind();

            var measureList = new List<MeasureModel>(cube.Measures);
            measureList.Insert(0, new MeasureModel("", DataType.Text));

            ctlSecondMetric.DataSource = measureList;
            ctlSecondMetric.DataBind();

            for (var i = 5; i <= 25; i += 5)
            {
                ctlTake.Items.Add(new ListItem(string.Format(Resources.Global.NRows, i), i.ToString()));
            }

            //ctlTake.Items.Insert(0, "");


            var sortDirectionList = new List<string>(Enum.GetNames(typeof(global::JDash.InMemoryAnalytics.Engine.SortDirection)));
            List<LabelValuePair> dropDownSource = new List<LabelValuePair>();
            foreach (var item in sortDirectionList)
            {
                dropDownSource.Add(new LabelValuePair()
                {
                    Label=(String)GetGlobalResourceObject("Global", item),
                    Value = item
                });
            }
            
            ctlSortDir.DataTextField =ctlSecondSortDir.DataTextField = "Label";
            ctlSortDir.DataValueField=ctlSecondSortDir.DataValueField = "Value";

            ctlSortDir.DataSource = dropDownSource;
            ctlSecondSortDir.DataSource = dropDownSource;
            ctlSortDir.DataBind();
            ctlSecondSortDir.DataBind();
            var sortList = FillSortColumns();

            if (query != null)
            {
                ctlFirstDimension.SelectedIndex = cube.Dimensions.FindIndex(p => p.Name == query.Dimensions[0]);
                if (query.Dimensions.Count > 1)
                    ctlSecondDimension.SelectedIndex = cube.Dimensions.FindIndex(p => p.Name == query.Dimensions[1]) + 1;

                ctlFirstMetric.SelectedIndex = cube.Measures.FindIndex(p => p.Name == query.Measures[0]);
                if (query.Measures.Count > 1)
                    ctlSecondMetric.SelectedIndex = cube.Measures.FindIndex(p => p.Name == query.Measures[1]) + 1;

                if (query.Take < 0)
                    ctlTake.SelectedIndex = 0;
                else
                {
                    var selected = ctlTake.Items.FindByValue(query.Take.ToString());
                    ctlTake.SelectedIndex = ctlTake.Items.IndexOf(selected);
                }

                


                if (query.Sort.Count == 1)
                {
                    ctlSort.SelectedIndex = sortList.FindIndex(p => p.Key == query.Sort[0].Column);
                    ctlSortDir.SelectedIndex = sortDirectionList.FindIndex(p => p == query.Sort[0].Direction.ToString());
                }
                if (query.Sort.Count == 2)
                {
                    ctlSort.SelectedIndex = sortList.FindIndex(p => p.Key == query.Sort[0].Column);
                    ctlSortDir.SelectedIndex = sortDirectionList.FindIndex(p => p == query.Sort[0].Direction.ToString());

                    ctlSecondSort.SelectedIndex = sortList.FindIndex(p => p.Key == query.Sort[1].Column);
                    ctlSecondSortDir.SelectedIndex = sortDirectionList.FindIndex(p => p == query.Sort[0].Direction.ToString());
                }
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


            if (!string.IsNullOrEmpty(ctlSecondMetric.SelectedValue) && ctlSecondMetric.SelectedItem != null)
                allList.Add(new KeyValuePair<string, string>(ctlSecondMetric.SelectedItem.Value, ctlSecondMetric.SelectedItem.Text));

            var sort1 = ctlSort.SelectedValue;
            var sort2 = ctlSecondSort.SelectedValue;

            ctlSort.DataSource = allList;
            ctlSecondSort.DataSource = allList;
            ctlSort.DataBind();
            ctlSecondSort.DataBind();

            ctlSort.SelectedIndex = allList.FindIndex(p => p.Key == sort1);
            ctlSecondSort.SelectedIndex = allList.FindIndex(p => p.Key == sort2);

            return allList;
        }

        protected void RebuildSortColumns(object sender, EventArgs e)
        {
            FillSortColumns();
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
                ctlStep1.Visible = ctlStep2.Visible = ctlStep3.Visible = ctlStep4.Visible = false;
                ctlStepCaption.Text = (String)GetGlobalResourceObject("Global", "TableDataDashletStep" + Step);
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
                }
            }
        }
        protected void ctlNextButton_Click(object sender, EventArgs e)
        {
            handleStep(1);

        }

        protected void ctlPrevButton_Click(object sender, EventArgs e)
        {
            handleStep(-1);
        }
    }
    public class LabelValuePair
    {
        public string Label { get; set; }
        public string Value { get; set; }
    }
}