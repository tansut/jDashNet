using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDash.WebForms
{
    [ToolboxItem(false)]
    internal class PostbackHandlerPanel : JUpdatePanel, IPostBackEventHandler
    {
        protected override Control CreateContentTemplateContainer()
        {
            return base.CreateContentTemplateContainer();
        }


        private IPostBackEventHandler handler;
        public IPostBackEventHandler EventHandler
        {
            get
            {
                if (handler == null)
                {
                    var control = this.Parent;
                    while (control != null)
                    {
                        if (control is IPostBackEventHandler)
                        {
                            handler = (IPostBackEventHandler)control;
                            break;
                        }
                        control = control.Parent;
                    }
                }

                return handler;
            }
        }

        public void RaisePostBackEvent(string eventArgument)
        {
            if (EventHandler != null)
                EventHandler.RaisePostBackEvent(eventArgument);
        } 
    }
}
