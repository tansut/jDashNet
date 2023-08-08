using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;

namespace JDash.WebForms
{
    /// <summary>
    /// Represents a busy image. Just drop and it will start displaying a busy image.
    /// </summary>
    [ToolboxBitmap(typeof(BusyImage), "resources.toolboxIcons.busyImage.bmp")]
    public class BusyImage: System.Web.UI.WebControls.Image
    {
        public override string ImageUrl
        {
            get
            {
                if (!DesignMode)
                {
                    var path = Page.ClientScript.GetWebResourceUrl(typeof(ResourceManager), "JDash.WebForms.resources.themes.default.images.ui-icon-busy.gif");
                    return path;
                }
                else return base.ImageUrl;
            }
            set
            {
                throw new InvalidOperationException("Cannot set URL");
            }
        }
    }
}
