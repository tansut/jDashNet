using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace JDash.WebForms
{
    /// <summary>
    /// Use to specify a hint to <seealso cref="JDash.WebForms.DashboardView.CreateDashlet"/> method.
    /// </summary>
    public enum DashletCreateMode
    {
        /// <summary>
        /// Create the dashlet in first position, before all dashlets inside dashboard.
        /// </summary>
        first,
        /// <summary>
        /// Create the dashlet in last position, after all dashlets inside dashboard.
        /// </summary>
        last
    }
}
