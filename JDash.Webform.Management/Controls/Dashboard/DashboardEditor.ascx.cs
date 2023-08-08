using JDash.Models;
using JDash.Webform.Management.Controls.Common;
using JDash.Webform.Management.Core.Provider;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDash.Webform.Management.Controls.Dashboard
{
    public partial class DashboardEditor : BaseEditor
    {
        public override event BaseEditor.onSaveDelgete onSave;

        private string id;
        public string Id
        {
            get { return id; }
            set
            {
                dashboarEditorModal.ID = value;
                id = value;
            }
        }

        private DashboardModel dashboard;

        public DashboardModel Dashboard
        {
            get
            {
                if (dashboard == null && ViewState["DashboardID"] != null)
                    dashboard = ProviderManager.CurrentProvider.GetDashboard(ViewState["DashboardID"].ToString());
                else if (dashboard == null)
                    dashboard = new DashboardModel();
                return dashboard;
            }
            set
            {
                ctlAuthenticationEditor.Clear();
                ViewState["DashboardID"] = value.id;
                if (value.id != null)
                {
                    ctlTitle.Value = value.title;
                    ctlDescription.Value = value.metaData.description;
                    ctlMetadata.Value = getPrettyJson(value.metaData);
                    ctlLayout.Value = getPrettyJson(value.layout);
                    ctlPaneConfig.Value = getPrettyJson(value.paneConfig);
                    ctlConfig.Value = getPrettyJson(value.config);
                    ctlType.Value = value.layout.type;
                    ctlAuthenticationEditor.AuthenticationDictionary = value.authorization;
                }
                else
                {
                    ctlTitle.Value = string.Empty;
                    ctlDescription.Value = string.Empty;
                    ctlMetadata.Value = string.Empty;
                    ctlLayout.Value = string.Empty;
                    ctlPaneConfig.Value = string.Empty;
                    ctlConfig.Value = string.Empty;
                    ctlType.Value = string.Empty;
                    
                }
                dashboard = value;

            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                dashboarEditorModal.ClientIDMode = ClientIDMode.Static;
                ctlType.DropDown.DataSource = new List<string>() { "absolute", "grid" };
                ctlType.DropDown.DataBind();
                Hide();
            }
            if (!string.IsNullOrWhiteSpace(ctlDashboardEditorActiveTab.Value))
                ScriptManager.RegisterClientScriptBlock(Page, GetType(), "activateTab", "activateDashboardEditorTab()", true);
        }


        public override void Show()
        {
            dashboarEditorModal.Style.Add("display", "block");
        }

        public override void Hide()
        {
            dashboarEditorModal.Style.Add("display", "none");
        }


        public override void Clear()
        {
            ViewState["DashboardID"] = null;
            Dashboard = new DashboardModel();

        }

        protected void ctlCancelButton_Click(object sender, EventArgs e)
        {
            Hide();
        }


        private void updateDashboard()
        {
            Dashboard.layout = Serializer.Deserialize<LayoutModel>(ctlLayout.Value);
            Dashboard.metaData = Serializer.Deserialize<MetadataModel>(ctlMetadata.Value);
            Dashboard.paneConfig = Serializer.Deserialize<Config>(ctlPaneConfig.Value);
            Dashboard.config = Serializer.Deserialize<Config>(ctlConfig.Value);
            Dashboard.authorization = ctlAuthenticationEditor.AuthenticationDictionary;
            Dashboard.title = ctlTitle.Value;
            if (Dashboard.metaData != null)
                Dashboard.metaData.description = ctlDescription.Value;
            else
            {
                Dashboard.metaData = new MetadataModel();
            }
            if (Dashboard.layout != null)
                Dashboard.layout.type = ctlType.Value;
            else
            {
                Dashboard.layout = new LayoutModel();
                Dashboard.layout.type = ctlType.Value;
            }
            Dashboard.metaData.description = ctlDescription.Value;

        }



        protected void ctlSubmitButton_Click(object sender, EventArgs e)
        {
            updateDashboard();
            if (ViewState["DashboardID"] == null)
                ProviderManager.CurrentProvider.CreateDashboard(Dashboard);
            else
                ProviderManager.CurrentProvider.SaveDashboard(Dashboard);
            Hide();
            if (onSave != null)
                onSave();

        }

    }
}