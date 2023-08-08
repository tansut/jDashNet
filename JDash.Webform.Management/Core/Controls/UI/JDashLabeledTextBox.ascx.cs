using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JDash.Webform.Management.Core.Controls.UI
{
    public partial class JDashLabeledTextBox : JDashBaseLabeledItem
    {
        private TextBoxType type;

        public TextBoxType Type
        {
            get { return type == null ? TextBoxType.single : type; }
            set
            {
                ctlDescription.TextMode = value == TextBoxType.multi ? TextBoxMode.MultiLine : TextBoxMode.SingleLine;
                type = value;
            }
        }

        public string Help { get; set; }

        public int Columns
        {
            get
            {
                return ctlDescription.Columns;
            }
            set
            {
                ctlDescription.Columns = value;
            }
        }

        public int Rows
        {
            get
            {
                return ctlDescription.Rows;
            }
            set
            {
                ctlDescription.Rows = value;
            }
        }

        public override string Value
        {
            get
            {
                return ctlDescription.Text;
            }
            set
            {
                ctlDescription.Text = value;
            }
        }

        public string TextboxClientID { get { return ctlDescription.ClientID; } }

        public string ValidatorClientID { get { return validator.ClientID; } }

        public RequiredFieldValidator Validator { get { return validator; } }
        public string ValidationText
        {
            get { return validator.Text; }
            set
            {
                validator.Enabled = !String.IsNullOrEmpty(value);
                validator.Text = value;

            }
        }
        public string autoComplateData;
        public string AutoComplateData
        {
            get
            {
                return autoComplateData;
            }
            set
            {
                autoComplateData = value;
                ctlDescription.Attributes["data-source"] = value;
            }
        }

        private int autoComplateItemSize;
        public int AutoComplateItemSize
        {
            get
            {
                return autoComplateItemSize;
            }
            set
            {
                autoComplateItemSize = value;
                ctlDescription.Attributes["data-items"] = value.ToString();
            }
        }

        public string ValidationGroup
        {
            get
            {
                return validator.ValidationGroup;
            }
            set
            {
                validator.ValidationGroup = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {


            ctlDescriptionTitle.Text = Title;
            ctlDescription.Info = Info;
        }

    }

    public enum TextBoxType
    {
        single,
        multi
    }
}