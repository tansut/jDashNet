using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using JDash.WebForms.Utils;

namespace JDash.WebForms
{
    /// <summary>
    /// Allows user to edit CssClass property of dashlet.
    /// </summary>
    [ToolboxBitmap(typeof(DashletCssEditor), "resources.toolboxIcons.cssEditor.bmp")]
    public class DashletCssEditor : DashletPropertyEditor
    {
        public DashletCssEditor()
        {
            this.PropertyName = "cssClass";
            this.ObjectName = "model.paneConfig";
        }
    }
}
