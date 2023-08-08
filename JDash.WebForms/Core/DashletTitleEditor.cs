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
    /// Allows user to edit title of dashlet.
    /// </summary>
    [ToolboxBitmap(typeof(DashletTitleEditor), "resources.toolboxIcons.titleEditor.bmp")]
    public class DashletTitleEditor : DashletPropertyEditor
    {
        public DashletTitleEditor()
        {
            this.PropertyName = "title";
            this.ObjectName = "";
        }
    }
}
