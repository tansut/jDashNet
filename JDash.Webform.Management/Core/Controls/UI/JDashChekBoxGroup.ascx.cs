using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDash.Webform.Management.Core.Controls.UI
{
    public partial class JDashChekBoxGroup : JDashBaseLabeledItem
    {
        public string ClientCheck { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ctlCheckbox.Attributes["onclick"] = ClientCheck;
            ctlTitle.Text = Title;
        }

        public bool Checked
        {
            get
            {
                return ctlCheckbox.Checked;
            }
            set
            {
                ctlCheckbox.Checked = value;
            }
        }
    }
}