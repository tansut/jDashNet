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
    internal class Container : WebControl
    {
        public JUpdatePanel Panel { get; internal set; }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
        }

        protected override HtmlTextWriterTag TagKey
        {
            get
            {
                return HtmlTextWriterTag.Div;
            }
        }
    }

    public abstract class JUpdatePanel: UpdatePanel
    {

    }
}
