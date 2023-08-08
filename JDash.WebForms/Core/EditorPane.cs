using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Web.UI;
using JDash.Models;

namespace JDash.WebForms
{
    [ViewStateModeById(), ToolboxItem(false)]  
    internal class EditorPane : JPane
    {
        protected override void OnInit(EventArgs e)
        {            
            base.OnInit(e);
        }



        protected override void OnPreRender(EventArgs e)
        {
            this.Attributes.Add("class", this.LoadedControl != null ? "wfDashletEditorContainer wfEditorControlLoaded" : "wfDashletEditorContainer");
            this.Attributes.Add("data-jdash-dashletId", Model.id);
            Attributes.Add("data-jdash-ownerDashboard", Dashboard.ClientWidgetID);
            Attributes.Add("style", "display:none;opacity:0");
            base.OnPreRender(e);
        }



        internal EditorPane(DashletContext context): base(context)
        {
            context.EditorPane = this;
            this.ID = "e" + Model.id;

        }





    }
}
