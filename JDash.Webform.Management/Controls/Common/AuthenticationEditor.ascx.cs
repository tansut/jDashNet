using JDash.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDash.Webform.Management.Controls.Common
{
    public partial class AuthenticationEditor : BaseEditor
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                ctlAuthType.DropDown.DataSource = Enum.GetValues(typeof(AuthTarget));
                ctlPermision.DropDown.DataSource = Enum.GetValues(typeof(Permission));
                ctlAuthType.DataBind();
                ctlPermision.DataBind();
                bindRepeater();
            }
        }

        private void bindRepeater()
        {
            ctlAuths.DataSource = getModels();
            ctlAuths.DataBind();
        }

        protected void ctlSubmitButton_Click(object sender, EventArgs e)
        {
            var model = new AuthenticationEditorModel()
            {
                name = ctlName.Value,
                permission = (Permission)Enum.Parse(typeof(Permission), ctlPermision.Value),
                authType = (AuthTarget)Enum.Parse(typeof(AuthTarget), ctlAuthType.Value)
            };  
            getModels().Add(model);
            bindRepeater();
            clearForm();   
        }


        public override void Clear()
        {
            ViewState["authModels"] = null;
            bindRepeater();
            clearForm();
        }
        private void clearForm()
        {
            ctlName.Value = string.Empty;
            ctlPermision.DropDown.SelectedIndex = 0;
            ctlAuthType.DropDown.SelectedIndex = 0;
        }


        public List<KeyValuePair<string, PermissionModel>> AuthenticationDictionary
        {
            get
            {

                return getModels().Select(x => new KeyValuePair<string, PermissionModel>(x.name, new PermissionModel()
                  {
                      authTarget = x.authType,
                      permission = x.permission
                  })).ToList();
            }
            set
            {
                var authList = getModels();
                foreach (var item in value)
                {
                    authList.Add(new AuthenticationEditorModel()
                    {
                        name = item.Key,
                        permission = item.Value.permission,
                        authType = item.Value.authTarget
                    });
                }
                bindRepeater();
            }
        }

        private List<AuthenticationEditorModel> getModels()
        {
            if (ViewState["authModels"] == null) ViewState["authModels"] = new List<AuthenticationEditorModel>();
            return (List<AuthenticationEditorModel>)ViewState["authModels"];

        }

        protected void ctlCancelButton_Click(object sender, EventArgs e)
        {

             
        }

        protected void ctlAuths_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                getModels().Remove(getModels().First(x => x.name.Equals(e.CommandArgument.ToString())));                
                bindRepeater();
            }
        }

    }

    [Serializable]
    public class AuthenticationEditorModel
    {
        public string name { get; set; }
        public Permission permission { get; set; }
        public AuthTarget authType { get; set; }
        public AuthenticationEditorModel()
        {

        }
    }
}