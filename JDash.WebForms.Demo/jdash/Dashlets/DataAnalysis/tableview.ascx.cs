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
    public partial class tableview : System.Web.UI.UserControl
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
                if (query != null)
                {
                    cubes = DemoAnalysisProvider.GetCubes();
                    var activeCube = cubes.SingleOrDefault(p => p.Name == query.CubeName);
                    if (activeCube != null)
                    {
                        query.SourceData = DemoAnalysisProvider.GetSourceData(query.CubeName);
                        var engine = new DataEngine(activeCube);
                        var data = engine.Execute(query);
                        dataGrid.DataSource = data.ToDataList();
                    }
                }
                context.RenderDashlet();
            }
            catch 
            {
             //   throw;
            }

            base.DataBind();
        }

        protected void dataGrid_ItemDataBound(object sender, System.Web.UI.WebControls.RepeaterItemEventArgs e)
        {
    
                if (e.Item.ItemType == System.Web.UI.WebControls.ListItemType.Header)
                {
                    var dataList = dataGrid.DataSource as DataList;
                    var th1 = e.Item.FindControl("th1") as HtmlTableCell;
                    var th2 = e.Item.FindControl("th2") as HtmlTableCell;
                    var th3 = e.Item.FindControl("th3") as HtmlTableCell;
                    var th4 = e.Item.FindControl("th4") as HtmlTableCell;
                    th1.InnerHtml = dataList.Headers[0].Caption;
                    th2.InnerHtml = dataList.Headers[1].Caption;
                    if (dataList.Headers.Count > 2)
                        th3.InnerHtml = dataList.Headers[2].Caption;
                    else th3.Visible = false;
                    if (dataList.Headers.Count > 3)
                        th4.InnerHtml = dataList.Headers[3].Caption;
                    else th4.Visible = false;
                }
                else if (e.Item.ItemType == System.Web.UI.WebControls.ListItemType.AlternatingItem ||
                  e.Item.ItemType == System.Web.UI.WebControls.ListItemType.Item)
                {
                    var dataList = dataGrid.DataSource as DataList;

                    var td1 = e.Item.FindControl("td1") as HtmlTableCell;
                    var td2 = e.Item.FindControl("td2") as HtmlTableCell;
                    var td3 = e.Item.FindControl("td3") as HtmlTableCell;
                    var td4 = e.Item.FindControl("td4") as HtmlTableCell;

                    td1.InnerHtml = DataBinder.Eval(e.Item.DataItem, dataList.Headers[0].Name, "{0}");
                    td2.InnerHtml = DataBinder.Eval(e.Item.DataItem, dataList.Headers[1].Name, "{0}");
                    if (dataList.Headers.Count > 2)
                        td3.InnerHtml = DataBinder.Eval(e.Item.DataItem, dataList.Headers[2].Name, "{0}");
                    else td3.Visible = false;
                    if (dataList.Headers.Count > 3)
                        td4.InnerHtml = DataBinder.Eval(e.Item.DataItem, dataList.Headers[3].Name, "{0}");
                    else td4.Visible = false;
                }
 
        }

        protected void dataGrid_ItemCreated(object sender, System.Web.UI.WebControls.RepeaterItemEventArgs e)
        {

        }

    }
}