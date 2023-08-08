using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using JDash;
using JDash.Models;
using JDash.Query;
using JDash.WebForms;
using Microsoft.AspNet.FriendlyUrls;

namespace JDash.WebForms.Demo
{

    public interface IJDashPage
    {
        DashboardView JDash { get; }
    }



    public partial class Main : System.Web.UI.MasterPage
    {

        public List<DashboardModel> Dashboards { get; set; }

        public ThemeInfo GetCustomTheme()
        {
            var theme = new ThemeInfo("My Custom Theme", Page.ResolveUrl("~/Resource/Themes/Custom/main.css"));
            theme.Styles.Add("a", new ThemeStyleInfo("Black", "black"));
            theme.Styles.Add("f", new ThemeStyleInfo("Yellow", "yellow"));
            theme.DefaultStyle = "a";
            return theme;
        }

        private void ensureConnectionString()
        {
            try
            {
                // Get connection string.
                var connStr = JDashManager.Provider.ConnectionString;
                // Try to create metadata.
                var createdMetadata = JDashManager.Provider.CreateMetadata(connStr, true);
                // If metadata is not already created initialize demo database.
                if (createdMetadata)
                {
                    var sqlScriptFile = Server.MapPath("~/Scripts/" + JDashManager.Provider.Name + ".sql");
                    if (System.IO.File.Exists(sqlScriptFile))
                    {
                        var script = System.IO.File.ReadAllText(sqlScriptFile);
                        JDashManager.Provider.ExecuteScript(connStr, script);
                    }
                }
            }
            catch (Exception ex)
            {
                Cache["errorMessage"] = ex.Message + ex.InnerException;
                Response.Redirect("~/ConfigDB.aspx");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (DashPage != null)
            {
         
                ensureConnectionString();
                DashPage.JDash.DashboardLoaded += JDash_DashboardLoaded;

                if (!Page.IsPostBack)
                {
                    BindDashboards();
                    BindThemes();
                    DashPage.JDash.UserDesignMode = string.IsNullOrEmpty(Request.QueryString["design"]) ?
                    DashboardDesignMode.full : DashboardDesignMode.full;
                    var idToShow = string.Empty;
                    if (Request.QueryString["id"] != null)
                    {
                        idToShow = Request.QueryString["id"];
                        if (!string.IsNullOrEmpty(idToShow))
                            ShowDashboard(idToShow);
                  
                     
                    }
                    else
                    {
                        idToShow = ConfigurationManager.AppSettings["homeDashboardId"];
                        if (!string.IsNullOrEmpty(idToShow))
                        {
                            try
                            {
                                var model = JDashManager.Provider.GetDashboard(idToShow);
                                ShowDashboard(model);
                            
                            }
                            catch (ArgumentException)
                            {
                                // Do nothing.                            
                            }
                        }
                    }
                }
            }
        }

        private void BindThemes()
        {
            var themes = ResourceManager.GetInstance().Themes;
            var customTheme = GetCustomTheme();
            themes.Add(customTheme);
            ResourceManager.GetInstance().RegisterTheme(customTheme);
            ctlThemesRepeater.DataSource = themes;
            ctlThemesRepeater.DataBind();
        }

        void JDash_DashboardLoaded(object sender, EventArgs e)
        {
            var list = DashPage.JDash.DashletContextList;
            if (list.Count == 0)
                DashPage.JDash.UserDesignMode = DashboardDesignMode.full;

            ShowDashboardProps();
        }

        public IJDashPage DashPage
        {
            get
            {
                return this.Page as IJDashPage;
            }
        }

        public void ShowDashboardProps()
        {
            ctlCurrentDashboardTitle.Text = DashPage.JDash.Dashboard.title;
            deleteDashboardBtn.Visible = DashPage.JDash.UserDesignMode == DashboardDesignMode.full;
            ctlEditDashboard.Visible = DashPage.JDash.UserDesignMode == DashboardDesignMode.full;
            createDashetBtn.Visible = DashPage.JDash.UserDesignMode == DashboardDesignMode.full;
            ctlDesignModeSw.Visible = true;
            dashboardInfoUp.Update();
            ResourceManager.GetInstance().AddUpdatePanelToRefresh(dashboardInfoUp);
        }

        public void ShowDashboard(string id)
        {

        
            DashPage.JDash.DashboardId = id;
            DashPage.JDash.DataBind();
        }

        public void ShowDashboard(DashboardModel model)
        {
            DashPage.JDash.Dashboard = model;
            DashPage.JDash.DataBind();
        }

        private IEnumerable<DashboardModel> GetMyDashboards()
        {
            if (Thread.CurrentPrincipal.Identity.IsAuthenticated)
            {
                DynamicQuery filter = new DynamicQuery();
                filter.filter = new FilterParam();
                var flts = new List<Filter>();
                flts.Add(new Filter() { field = "metaData.createdBy", value = Thread.CurrentPrincipal.Identity.Name, op = CompareOperator.eq });
                filter.filter.filters = flts;
                return JDashManager.Provider.SearchDashboards(filter).data;
            }
            else
                return new List<DashboardModel>(); ;

        }

        public void BindDashboards()
        {

            Dashboards = new List<DashboardModel>(JDashManager.Provider.SearchDashboards().data);
            var groups = Dashboards.Select(p => new { group = p.metaData.group }).Distinct();
            groupsRepeater.DataSource = groups;
            groupsRepeater.DataBind();
            dashboardsUp.Update();

        }


        protected IEnumerable<DashboardModel> getDashboardsOfGroup(string group)
        {
            var list = Dashboards.Where(p => p.metaData.group == group).Select(p => p).OrderBy(p => p.groupOrder).OrderBy(p => p.metaData.group).AsEnumerable();
            return list;
        }


        protected void dashboardsRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            var did = e.CommandArgument.ToString();
            ShowDashboard(did);
        }


        protected void ctlEditDashboard_Click(object sender, EventArgs e)
        {
            CreateDashboardWindow.Show(DashPage.JDash.Dashboard);
        }

        protected void ctlCreateDashboardWindow_Click(object sender, EventArgs e)
        {
            CreateDashboardWindow.Show();
        }

        protected void deleteDashboardBtn_Click(object sender, EventArgs e)
        {
            var id = DashPage.JDash.DashboardId;
            JDashManager.Provider.DeleteDashboard(id);
            Response.Redirect("~/demo");
        }

        protected void readonlyView_CheckedChanged(object sender, EventArgs e)
        {
            var isDesign = ctlDesignModeSw.Checked;
            DashPage.JDash.UserDesignMode = isDesign ? DashboardDesignMode.full : DashboardDesignMode.none;
            ShowDashboardProps();
        }

        protected void ctlThemesRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            var theme = e.CommandArgument.ToString();
            ResourceManager.GetInstance().ChangeTheme(theme, null, true);
        }
    }
}