using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace JDash.Webform.Management.Core.Controls.UI
{
    public class JDashTextBox : TextBox
    {
        public string Info { get; set; }
        
        protected override void AddAttributesToRender(System.Web.UI.HtmlTextWriter writer)
        {            
            writer.AddAttribute("type", "text");
            if (!string.IsNullOrWhiteSpace(Info))
                writer.AddAttribute("placeholder", Info);
            base.AddAttributesToRender(writer);
        }
    }
}
