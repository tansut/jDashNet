using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace JDash.Webform.Management.Core.Controls.UI
{

    public enum JDashButtonType
    {
        basic,
        primary,
        info,
        success,
        warning,
        danger,
        inverse,
        link
    }
    public enum JDashButtonSize
    {
        normal,
        mini,
        small,
        large
    }
    public class JDashButton : Button
    {
        public JDashButtonType ButtonType { get; set; }
        public JDashButtonSize ButtonSize { get; set; }
        public string ConfirmText { get; set; }
        public bool FullWidth { get; set; }

        private string ButtonCssClass
        {
            get
            {
                StringBuilder sb = new StringBuilder();
                sb.Append("btn");
                switch (ButtonSize)
                {
                    case JDashButtonSize.mini:
                        sb.Append(" btn-mini");
                        break;
                    case JDashButtonSize.small:
                        sb.Append(" btn-small");
                        break;
                    case JDashButtonSize.large:
                        sb.Append(" btn-large");
                        break;
                    default:
                        break;
                }
                if (FullWidth) sb.Append(" btn-block");
                switch (ButtonType)
                {

                    case JDashButtonType.basic:
                        sb.Append(" btn-default");
                        break;
                    case JDashButtonType.primary:
                        sb.Append(" btn-primary");
                        break;
                    case JDashButtonType.info:
                        sb.Append(" btn-info");
                        break;
                    case JDashButtonType.success:
                        sb.Append(" btn-success");
                        break;
                    case JDashButtonType.warning:
                        sb.Append(" btn-warning");
                        break;
                    case JDashButtonType.danger:
                        sb.Append(" btn-danger");
                        break;
                    case JDashButtonType.inverse:
                        sb.Append(" btn-inverse");
                        break;
                    case JDashButtonType.link:
                        sb.Append(" btn-link");
                        break;
                    default:
                        break;
                }
                if (!IsEnabled) sb.Append(" disabled");
                return sb.ToString();

            }
        }

     
        protected override void AddAttributesToRender(System.Web.UI.HtmlTextWriter writer)
        {
            writer.AddAttribute("class", ButtonCssClass);
            if (ConfirmText != null)
            {
                writer.AddAttribute("onclick",string.Format("if(!confirm('{0}'))return false;", ConfirmText));
            }
            base.AddAttributesToRender(writer);
        }

    }
}
