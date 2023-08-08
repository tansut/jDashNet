using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JDash.Webform.Management.Core.Controls;
using JDash.Webform.Management.Core.Model;

namespace JDash.Webform.Management.Controls.Common
{
    public partial class TagEditor : DataEditor<List<string>>
    {

        private List<string> Entity
        {
            get
            {
                if (ViewState["tagEntity"] == null) ViewState["tagEntity"] = new List<string>();
                return (List<string>)ViewState["tagEntity"];
            }
            set
            {
                ViewState["tagEntity"] = value;
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
         
        }


        protected void ctlTagRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
  
            var tag = e.CommandArgument.ToString();
            switch (e.CommandName)
            {
                case "Edit":
                    {
                        TagItemEditor.Bind(tag);
                        break;
                    }
                case "Remove":
                    if (Entity.Contains(tag)) Entity.Remove(tag);
                    BindRepeater();
                    break;
                default:
                    break;
            }
        }

        private void BindRepeater()
        {
            ctlTagRepeater.DataSource = Entity;
            ctlTagRepeater.DataBind();
        }
        public override void Bind(List<string> entity)
        {
            Clear();
            Entity = entity;
            BindRepeater();

        }

        public override List<string> Retrieve(List<string> entity)
        {
            return Entity;
        }

        public override void Clear()
        {
            Entity = null;
            TagItemEditor.Clear();            
        }

        public void AddItem(string data)
        {
            Entity.Add(data);
            BindRepeater();
        }
        public void EditItem(string oldData, string newData)
        {
            Entity[Entity.IndexOf(oldData)] = newData;
            BindRepeater();
        }

        protected void ctlAddTagButton_Click(object sender, EventArgs e)
        {
            TagItemEditor.Show();
        }
    }
}