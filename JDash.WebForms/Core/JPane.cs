using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using JDash.Models;
using System.IO;


namespace JDash.WebForms
{

    public class UcLoader: WebControl
    {
        public void LoadControl(Control control)
        {
            this.Controls.Add(control);
        }

        

        public override void RenderBeginTag(HtmlTextWriter writer)
        {
            
        }

        public override void RenderEndTag(HtmlTextWriter writer)
        {
            
        }

        protected override void RenderContents(HtmlTextWriter writer)
        {
            //if (LoadControl == null) return;
            using (var sw = new StringWriter())
            {
                using (var hw = new HtmlTextWriter(sw))
                {
                    base.RenderContents(hw);
                    writer.Write(sw.ToString());
                }
            }
            
        }
    }


    [ViewStateModeById(), ToolboxItem(false)]
    public abstract class JPane : JUpdatePanel, INamingContainer
    {
        public DashletContext JDashContext { get; internal set; }
        public Control LoadedControl { get; private set; }
        private UcLoader controlLoader { get; set; }


        public DashboardView Dashboard
        {
            get { return JDashContext.Dashboard; }
        }

        public DashletModel Model
        {
            get { return JDashContext.Model; }
        }

        protected override void DataBindChildren()
        {
            
        }

        public void InternalDataBind()
        {
            if (this.LoadedControl != null)
            {
                try
                {
                    this.LoadedControl.DataBind();
                }
                catch 
                {
                    throw;
                }
            }
        }

        internal bool Lazy { get; set; }



        internal JPane(DashletContext context)
        {
            this.JDashContext = context;
            this.UpdateMode = UpdatePanelUpdateMode.Conditional;
        }



        protected override void OnInit(EventArgs e)
        {
            if (!Lazy)
                LoadControl();
            base.OnInit(e);
        }

        public string ControlPath { get; set; }

        internal void removeLoadedControl()
        {
            if (LoadedControl != null)
            {

                ContentTemplateContainer.Controls.Remove(controlLoader);
                //ContentTemplateContainer.Controls.Remove(LoadedControl);
                LoadedControl = null;
                controlLoader = null;
                this.Update();
                ResourceManager.GetInstance().AddUpdatePanelToRefresh(this);
            }
        }

        protected override void CreateChildControls()
        {
            base.CreateChildControls();


        }

        internal void LoadControl()
        {
            if (LoadedControl == null)
            {
                
                try
                {


                    LoadedControl = Page.LoadControl(ControlPath);

                    
                }
                catch (Exception exc)
                {
                    LoadedControl = new Label()
                    {
                        Text = exc.Message,
                        ForeColor = Color.Red
                    };
                }
                LoadedControl.ID = "yd";
                if (LoadedControl != null)
                {
                    controlLoader = new UcLoader();
                    controlLoader.LoadControl(LoadedControl);
                    ContentTemplateContainer.Controls.Add(controlLoader);
                    //ContentTemplateContainer.Controls.Add(LoadedControl);
                }
                this.Dashboard.BroadcastContext(this.JDashContext, this.LoadedControl);
            }
        }
    }
}
