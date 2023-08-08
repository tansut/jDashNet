using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI;
using JDash;
using JDash.Models;


namespace JDash.WebForms
{
    /// <summary>
    /// Represents a context object associated for a dashlet.
    /// </summary>
    public class DashletContext
    {
        internal DashletPane DashletPane { get; set; }
        internal EditorPane EditorPane { get; set; }

        /// <summary>
        /// Returns <see cref="JDash.WebForms.DashboardView"/> control on which dashlet is hosted.
        /// </summary>
        public DashboardView Dashboard { get; private set; }
        /// <summary>
        /// Returns <see cref="JDash.Models.DashletModel"/> object.
        /// </summary>
        public DashletModel Model { get; private set; }

        internal DashletContext(DashboardView dashboard, DashletModel model)
        {
            this.Model = model;
            this.Dashboard = dashboard;
        }


        /// <summary>
        /// Use to call a method of your client module. See Developers Guide documentation for more
        /// information about client modules.
        /// </summary>
        /// <param name="method">Name of method to call.</param>
        /// <param name="prms">List of optional method parameters.</param>
        public void CallClient(string method, params object[] prms)
        {
            Dashboard.CallDashlet(this.Model.id, method, prms);
        }

        /// <summary>
        /// Use to call a method of client DashletContext object.
        /// </summary>
        /// <param name="method">Name of method to call.</param>
        /// <param name="prms">List of optional method parameters.</param>
        public void CallClientContext(string method, params object[] prms)
        {
            Dashboard.CallDashletContext(this.Model.id, method, prms);
        }
       
        /// <summary>
        /// Returns a reference to the user control loaded.
        /// </summary>
        public Control DashletControl
        {
            get
            {
                return this.DashletPane.LoadedControl;
            }
        }

        /// <summary>
        /// Returns a reference to the editor user control. If user is not editing dashlet
        /// returns null.
        /// </summary>
        public Control EditorControl
        {
            get
            {
                return this.EditorPane == null ? null : this.EditorPane.LoadedControl;
            }
        }

        /// <summary>
        /// Saves current <see cref="JDash.Models.DashletModel"/> model associated with the context.
        /// <seealso cref="JDash.JdashManager.Provider.SaveDashlet"/> method.
        /// </summary>
        public void SaveModel()
        {
            JDashManager.Provider.SaveDashlet(Model);
        }

        /// <summary>
        /// Broadcasts an event. See <seealso cref="JDash.WebForms.DashboardView.Broadcast"/> method.
        /// </summary>
        /// <param name="jEvent">Event to broadcast.</param>
        /// <param name="targets">List of event targets.</param>
        public void Broadcast(JEvent jEvent, params object[] targets)
        {
            Dashboard.Broadcast(jEvent, targets);
        }

        /// <summary>
        /// Broadcasts an event. See <seealso cref="JDash.WebForms.DashboardView.Broadcast"/> method.
        /// </summary>
        /// <param name="jEvent">Event to broadcast.</param>
        public void Broadcast(JEvent jEvent)
        {
            Dashboard.Broadcast(jEvent);
        }

        /// <summary>
        /// Forces dashlet to update itself. Updating a dashlet means calling UpdatePanel.Update method of
        /// UpdatePanel object created for dashlet.
        /// </summary>
        public void RenderDashlet()
        {
            DashletPane.Update();
        }

        /// <summary>
        /// Forces dashlet editor to update itself. Updating a dashlet editor means calling UpdatePanel.Update method of
        /// UpdatePanel object created for dashlet editor.
        /// </summary>
        public void RenderEditor()
        {
            EditorPane.Update();
        }

        /// <summary>
        /// Reloads dashlet properties. See <seealso cref="JDash.WebForms.DashboardView.LoadDashletProperties"/> method.
        /// </summary>
        /// <param name="props">Properties to reload</param>
        public void LoadDashletProperties(dynamic props)
        {
            Dashboard.LoadDashletProperties(this.Model, props);
        }
    }
}
