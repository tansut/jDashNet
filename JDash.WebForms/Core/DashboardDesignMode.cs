using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace JDash.WebForms
{
    /// <summary>
    /// Use to set a design mode for <seealso cref="JDash.WebForms.DashboardView"/> control. To be able to create dashlets and design dashboard
    /// <seealso cref="JDash.WebForms.DashboardView.UserDesignMode"/> should be set to <see cref="JDash.WebForms.DashboardDesignMode.dashlets"/> or
    /// <see cref="JDash.WebForms.DashboardDesignMode.full"/>.
    /// </summary>
    public enum DashboardDesignMode
    {
        /// <summary>
        /// Dashboard is displayed readonly.
        /// </summary>
        none,
        /// <summary>
        /// Dashboard layout can be changed only. 
        /// </summary>
        dashboard,
        /// <summary>
        /// New dashlets can be added to dashboard.
        /// </summary>
        dashlets,
        /// <summary>
        /// Layout can be changed and new dashlets can be added to the dashboard.
        /// </summary>
        full
    }
}
