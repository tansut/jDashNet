using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDash.Webform.Management.Core.Controls.UI
{
    public partial class JDashLabeledDropDown : JDashBaseLabeledItem
    {

        public JDashDropDown DropDown { get{return ctlDropDown;}}
        public override string Value
        {
            get
            {
                
                return ctlDropDown.SelectedValue;
            }
            set
            {
                
                if (ctlDropDown.Items.Cast<ListItem>().Any(x=>x.Text==value))
                    ctlDropDown.SelectedValue = value;
                else
                    ctlDropDown.SelectedIndex = 0;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            ctlDescriptionTitle.Text = Title;
        }



    }
}