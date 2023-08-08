using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Web.UI;
using JDash.WebForms.Utils;

namespace JDash.WebForms
{
    /// <summary>
    /// Represents a base container.
    /// </summary>
    public abstract class JContainer : JControl, INamingContainer
    {
        public override System.Web.UI.ControlCollection Controls
        {
            get
            {

                if (!DesignMode)
                    this.EnsureChildControls();
                return base.Controls;
            }
        }
    }
}
