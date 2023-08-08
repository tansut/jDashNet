using JDash.Models;
using JDash.Webform.Management.Controls.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDash.Webform.Management.Controls.DashletModule
{
    public partial class DashletCommandEditor : BaseEditor
    {
        public override event BaseEditor.onSaveDelgete onSave;
        public DashletCommandEditorModel Model
        {
            get
            {
                var model = new DashletCommandEditorModel()
                {
                    Name = ctlName.Value,
                    Label = ctlLabel.Value,
                    CssClass = ctlCssClass.Value,
                    Title = ctlTitle.Value,
                    Confirm = ctlConfirm.Checked,
                    ConfirmMessage = ctlConfirmMessage.Value,
                    Type = ctlType.DropDown.SelectedValue,
                    Notifyable = ctlNotifyOnCommand.Checked
                };
                return model;
            }
            set
            {
                ctlName.Value = value.Name;
                ctlLabel.Value = value.Label;
                ctlCssClass.Value = value.CssClass;
                ctlTitle.Value = value.Title;
                ctlConfirm.Checked = value.Confirm;
                ctlConfirmMessage.Value = value.ConfirmMessage;
                ctlConfirmMessage.Hide = !ctlConfirm.Checked;
                ctlNotifyOnCommand.Checked = value.Notifyable;
                bindTypes();
                ctlType.DropDown.SelectedValue = value.Type;

            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Hide();
                bindTypes();
            }

        }

        private void bindTypes()
        {
            ctlType.DropDown.DataSource = new List<string>(){
                "builtIn",
                "visualState",
                "custom"
            };
            ctlType.DataBind();
        }

        public override void Show()
        {

            CommandEditorModal.Style.Add("display", "block");
        }

        public override void Clear()
        {
            Model = new DashletCommandEditorModel();
        }

        public override void Hide()
        {
            CommandEditorModal.Style.Add("display", "none");

        }

        protected void ctlSubmitButton_Click(object sender, EventArgs e)
        {
            Hide();
            if (onSave != null)
                onSave();

        }


        protected void ctlCancelButton_Click(object sender, EventArgs e)
        {
            Hide();
        }


    }

    [Serializable]
    public class DashletCommandEditorModel
    {
        public string Name { get; set; }
        public string Label { get; set; }
        public string CssClass { get; set; }
        public string Title { get; set; }
        public bool Confirm { get; set; }
        public string ConfirmMessage { get; set; }
        public string Type { get; set; }
        public bool Notifyable { get; set; }
        public Config getConfig(){
            Config UIConfig = new Config();
            if (!string.IsNullOrEmpty(CssClass))
                UIConfig.Add("iconClass", CssClass);

            if (!string.IsNullOrEmpty(Title))
                UIConfig.Add("title", Title);

            Config DashletConfig = new Config();
  

            DashletConfig.Add("name", Name);
            DashletConfig.Add("label", Label);
            DashletConfig.Add("type", Type);
            DashletConfig.Add("confirm", Confirm);
            DashletConfig.Add("confirmMessage", ConfirmMessage);
            DashletConfig.Add("ui", UIConfig);

            return DashletConfig;
        }


    }

}