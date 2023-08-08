using JDash;
using JDash.Models;
using JDash.Webform.Management.Core.Provider;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDash.Webform.Management.Pages.Dashboard
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack){
                bindRepeater();
            
            }
            ctlDashboarEditorModal.onSave += ctlDashboarEditorModal_onSave;
        }

        void ctlDashboarEditorModal_onSave()
        {
            bindRepeater();
        }

        protected void ctlDashboardRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            
            switch (e.CommandName)
            {
                case "Edit":
                    ctlDashboarEditorModal.Dashboard=ProviderManager.CurrentProvider.GetDashboard(e.CommandArgument.ToString());
                    ctlDashboarEditorModal.Show();
                    break;
                case "Remove":
                    ProviderManager.CurrentProvider.DeleteDashboard(e.CommandArgument.ToString());
                    bindRepeater();
                    break;
                default:
                    break;
            }
        }

        private void bindRepeater()
        {
            ctlDashboardRepeater.DataSource = ProviderManager.CurrentProvider.SearchDashboards().data; ;
            ctlDashboardRepeater.DataBind();     
        }

        protected void ctlNewButton_Click(object sender, EventArgs e)
        {
            ctlDashboarEditorModal.Clear();
            ctlDashboarEditorModal.Show();
        }


    }
}