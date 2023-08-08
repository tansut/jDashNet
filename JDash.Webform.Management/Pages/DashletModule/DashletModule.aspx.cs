using JDash.Models;
using JDash.Webform.Management.Core.Provider;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDash.Webform.Management.Pages.DashletModule
{
    public partial class DashletModule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                bindRepeater();

            }

            ctlDashletModuleEditorModal.onSave += ctlDashletModuleEditorModal_onSave;

        }

        void ctlDashletModuleEditorModal_onSave()
        {
            bindRepeater();
        }

        private void bindRepeater()
        {
            var modules = ProviderManager.CurrentProvider.SearchDashletModules().data.OrderBy(d => d.title);
            ctlDashletModuleRepeater.DataSource = modules;

            ctlDashletModuleRepeater.DataBind();
        }

        protected void ctlDashletModuleRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Edit":
                    ctlDashletModuleEditorModal.DashletModule = ProviderManager.CurrentProvider.GetDashletModule(e.CommandArgument.ToString());
                    ctlDashletModuleEditorModal.Show();
                    break;
                case "Remove":
                    ProviderManager.CurrentProvider.DeleteDashletModule(e.CommandArgument.ToString());
                    bindRepeater();
                    break;
                case "Clone":
                    var cloneModule = ProviderManager.CurrentProvider.GetDashletModule(e.CommandArgument.ToString());
                    cloneModule.title = "Copy of " + cloneModule.title;
                    cloneModule.id = "";
                    var cloned = ProviderManager.CurrentProvider.CreateDashletModule(cloneModule);
                    bindRepeater();
                    ctlDashletModuleEditorModal.DashletModule = ProviderManager.CurrentProvider.GetDashletModule(cloned.id);
                    ctlDashletModuleEditorModal.Show();
                    break;
                default:
                    break;
            }
        }

        protected void ctlNewButton_Click(object sender, EventArgs e)
        {
            ctlDashletModuleEditorModal.Clear();
            ctlDashletModuleEditorModal.Show();
        }

        protected void ctlDashletModuleRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            var ucPath = (e.Item.FindControl("ctlUCPath"));
            if (ucPath != null)
            {
                var wfConfig = ((DashletModuleModel)e.Item.DataItem).config["wfConfig"];
                if (wfConfig != null)
                {
                    ((Label)(e.Item.FindControl("ctlUCPath"))).Text = (string)(((DashletModuleModel)e.Item.DataItem).config["wfConfig"].uc);
                    ((Label)(e.Item.FindControl("ctlEUCPath"))).Text = (string)(((DashletModuleModel)e.Item.DataItem).config["wfConfig"].ec);

                }


            }
        }
    }
}