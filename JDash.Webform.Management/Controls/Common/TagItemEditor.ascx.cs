using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JDash.Webform.Management.Core.Controls;

namespace JDash.Webform.Management.Controls.Common
{
    public partial class TagItemEditor : DataEditor<string>
    {
     
        private TagEditor container;
        private TagEditor Container
        {
            get
            {
                if (container == null)
                {

                    container = (TagEditor)this.Parent;
                }
                return container;
            }

        }
        private string Entity
        {
            get
            {
                if (ViewState["tagItemEntity"] != null) return ViewState["tagItemEntity"].ToString();
                else return null;
            }
            set
            {
                ViewState["tagItemEntity"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public override void Bind(string entity)
        {
            Entity = entity;
            ctlTag.Text = Entity;
            Show();
        }

        public override string Retrieve(string entity)
        {
            return ctlTag.Text.Trim();
        }

        public override void Clear()
        {
            ctlTag.Text = string.Empty;
            Entity = null;
        }

        public void Hide()
        {
            Clear();
            ScriptManager.RegisterClientScriptBlock(Page, GetType(), "HidePopup", string.Format("$(document).ready(function () {{$('#ctlTagEditorModal').modal('hide'); $('div.modal-backdrop').remove()}})", "ctlTagEditorModal"), true);
        }

        public void Show()
        {
            ScriptManager.RegisterClientScriptBlock(Page, GetType(), "ShowPopup", "$(document).ready(function () {{$('#ctlTagEditorModal').modal('show');}})", true);
        }

        protected void ctlCloseButton_Click(object sender, EventArgs e)
        {
            Hide();
        }


        protected void ctlSaveButton_Click(object sender, EventArgs e)
        {
            if (Entity != null)
            {
                Container.EditItem(Entity, Retrieve(null));
            }
            else Container.AddItem(Retrieve(null));
            Hide();
        }
    }
}