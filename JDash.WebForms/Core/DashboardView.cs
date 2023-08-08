using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using JDash;
using JDash.Models;
using JDash.WebForms.Exceptions;
using JDash.WebForms.Utils;
using JDash.Helpers;
using System.Drawing;


namespace JDash.WebForms
{
    /// <summary>
    /// Contains classes and controls for JDash.Net.
    /// </summary>
    [System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    class NamespaceDoc
    {
    }

    /// <summary>
    /// DashboardView is the basic control of JDash.Net and is responsible to
    /// display a <see cref="JDash.Models.DashboardModel"/> object to the user.
    /// </summary>
    [ViewStateModeById(), ToolboxBitmap(typeof(DashboardView), "resources.toolboxIcons.dashboardView.bmp")]
    public sealed class DashboardView : JContainer, IPostBackEventHandler
    {
        public event EventHandler<JEventArgs> EventExecuting;
        public event EventHandler<JEventArgs> EventExecuted;
        public event EventHandler ContentsUpdated;
        public event EventHandler DashboardLoaded;

        private bool databinding = false;
        private bool needsClientReload = false;
        private bool dashletCreated = false;
        private List<DashletModel> dashletsCreated = new List<DashletModel>();
        private PostbackHandlerPanel containerPanel = null;
        private List<dynamic> dashletCalls = new List<dynamic>();
        private bool userUnloaded;
        private bool initialDashletsCreated { get; set; }
        private Dictionary<string, DashletContext> contextList = new Dictionary<string, DashletContext>();
        private Dictionary<string, dynamic> manageDashboardProps = new Dictionary<string, dynamic>();

        private IEnumerable<DashletModel> dashletModelCache;

        protected override Control GetDesigntimeControl()
        {
            var panel = new Panel();
            panel.Attributes["style"] = "width: 300px; padding: 15px; background-color: #ffffff; border: 1px solid #d4d4d4;; font-family: Arial, Helvetica, sans-serif; font-size: 10px; font-weight: bold; color: #333333;";

            HtmlGenericControl version = new HtmlGenericControl("p");
            version.Attributes["style"] =
            version.InnerHtml = string.Format("<b>{0} Control {1}</b><br/>{2}", this.GetType().Name, AssemblyInfoUtils.AssemblyVersion, AssemblyInfoUtils.Copyright);

            var logoUrl = Page.ClientScript.GetWebResourceUrl(typeof(ResourceManager), "JDash.WebForms.resources.img.logo.png");
            var logoImg = new System.Web.UI.WebControls.Image() { ImageUrl = logoUrl };
            logoImg.ImageAlign = ImageAlign.Middle;

            var l1 = new HyperLink()
            {
                Target = "_blank",
                NavigateUrl = "http://www.jdash.net",
                Text = "www.jdash.net"
            };

            l1.Attributes["style"] = "display:block";

            panel.Controls.Add(logoImg);
            panel.Controls.Add(l1);
            panel.Controls.Add(version);
            return panel;


        }


        protected internal override string ClientWidgetID
        {
            get
            {
                if (DesignMode)
                    return base.ClientWidgetID;
                return string.Format("{0}Widget", this.containerPanel.ClientID);
            }
        }

        protected override void getClientProperties(Dictionary<string, object> dict)
        {
            dict.Add("id", this.ClientWidgetID);
            if (Dashboard != null)
            {
                dict.Add("designMode", getClientValue(UserDesignMode));

                var models = DashletContextList.Select(p => p.Value.Model).AsEnumerable();
                var providerdata = new
                {
                    dashboard = needsClientReload ? Dashboard : null,
                    dashlets = needsClientReload ? models : null,
                    modules = needsClientReload ? models.Select(p => p.module).ToArray() : null
                };
                dict.Add("_wfProviderInit", providerdata);
                if (needsClientReload)
                {
                    dict.Add("animationDuration", 150);
                    dict.Add("_autoloadid", Dashboard.id);
                }
                dict.Add("_wfServerpostid", this.containerPanel.UniqueID);

                if (dashletCreated)
                {
                    dict.Add("newDashlets", this.dashletsCreated.ToArray());
                }
                if (needsClientReload)
                {
                    foreach (var model in models)
                    {
                        model.module = null;
                    }
                }
            }


        }

        private DashboardModel loadedModel;

        /// <summary>
        /// Returns a reference to  <see cref="JDash.Models.DashboardModel"/> object which used to load DashboardView.
        /// You can set id of the dashboard you want to load <see cref="JDash.WebForms.DashboardView.DashboardId"/>  or
        /// directly assign a DashboardModel object to this property.
        /// </summary>
        /// <remarks>
        /// After assignment note that you have to call <seealso cref="JDash.WebForms.DashboardView.DataBind"/> method.
        /// </remarks>
        [Browsable(false), Category("JDash")]
        public DashboardModel Dashboard
        {
            get
            {
                if (loadedModel == null && !string.IsNullOrEmpty(DashboardId))
                    loadedModel = JDashManager.Provider.GetDashboard(DashboardId);
                return loadedModel;
            }
            set
            {
                loadedModel = value;
                if (loadedModel != null)
                    DashboardId = loadedModel.id;
                else DashboardId = null;
            }
        }

        private void unloadDashboard(bool clearDashboarId)
        {
            if (clearDashboarId)
                DashboardId = null;
            dashletModelCache = null;
            loadedModel = null;
            initialDashletsCreated = false;
            IsDataBound = false;
            ViewState["editingDashlets"] = null;
            ClearChildState();
            contextList.Clear();
        }

        /// <summary>
        /// Unloads currently loaded dashboard. When a dashboard is unloaded all dashlets are
        /// automatically unloaded.
        /// </summary>
        public void UnloadDashboard()
        {
            if (IsDataBound)
                userUnloaded = true;
            this.unloadDashboard(true);
        }

        private string[] EditingDashlets
        {
            get
            {
                return ViewState["editingDashlets"] == null ? new string[] { } : ViewState["editingDashlets"] as string[];
            }

            set
            {
                ViewState["editingDashlets"] = value;
            }
        }

        private void addEditingDashlet(string id)
        {
            var list = new List<string>(EditingDashlets);
            if (!list.Contains(id))
            {
                list.Add(id);
                EditingDashlets = list.ToArray();
            }
        }

        private void removeEditingDashlet(string id)
        {
            var list = new List<string>(EditingDashlets);
            list.RemoveAll(p => p == id);
            EditingDashlets = list.ToArray();

        }

        /// <summary>
        /// Represents the id of currently loaded dashboard. To display a dashboard to the user set an id of a <see cref="JDash.Models.DashboardModel"/> object
        /// to this property or use <see cref="JDash.WebForms.DashboardView.Dashboard"/> property.
        /// </summary>
        /// <example>This sample shows how to bind a dashboard.
        /// <code>
        /// if (!Page.IsPostBack) {
        ///   dashboardView.id = "1";
        ///   dashboardView.DataBind();
        /// }
        /// </code>
        /// </example>
        [Category("JDash")]
        public string DashboardId
        {
            get
            {
                return ViewState["DashboardId"] as string;
            }

            set
            {
                ViewState["DashboardId"] = value;
            }
        }


        /// <summary>
        /// Use to change design mode of dashboard.  Design mode governs what can be changed by user.
        /// See <seealso cref="JDash.WebForms.DashboardDesignMode"/> for more information.
        /// Default value is DashboardDesignMode.none and dashboard is displayed readonly
        /// to the user.
        /// </summary>
        [Category("JDash")]
        public DashboardDesignMode UserDesignMode
        {
            get
            {
                return ViewState["DesignMode"] == null ?
                    DashboardDesignMode.none :
                    (DashboardDesignMode)ViewState["DesignMode"];
            }
            set
            {
                ViewState["DesignMode"] = value;
                base.TrackChange("designMode", value);
            }
        }



        private IEnumerable<DashletModel> InitialDashletModels
        {
            get
            {
                if (Dashboard != null)
                {
                    var data = JDashManager.Provider.GetDashboardDashlets(DashboardId, true);
                    var modules = new List<DashletModuleModel>(data["modules"].data as IEnumerable<DashletModuleModel> ?? new List<DashletModuleModel>());
                    var dashlets = new List<DashletModel>(data["dashlets"].data as IEnumerable<DashletModel> ?? new List<DashletModel>());
                    dashlets.ForEach(p => p.module = modules.Single(m => m.id == p.moduleId));
                    return dashlets;
                }
                else
                    return new List<DashletModel>();
            }
        }

        protected override void SetResources()
        {
            if (!DesignMode)
            {

                if (IsDataBound)
                    base.SetResources();
                else if (userUnloaded)
                {
                    string destroyCheck = "jdash.destroyCmp(\"{0}\");";
                    this.ResourceManager.RegisterClientInitScript(this.ClientInitID, destroyCheck.FormatWith(this.ClientWidgetID));
                }
            }
            else base.SetResources();

        }

        protected internal override string GetClientConstructor()
        {
            getClientProperties(this.ClientProperties);
            return string.Format(InstanceFuncTemplate, SerializationUtils.Serialize(ClientProperties), this.containerPanel.ClientID);
        }

        protected override string InstanceFuncTemplate
        {
            get
            {
                if (dashletCreated)
                    return "jdash.createDashlet({0}, '{1}');";
                else return "jdash.createDashboard({0}, '{1}');";
            }
        }

        protected override bool CancelDestroyCheck
        {
            get
            {
                return dashletCreated;
            }
        }

        /// <summary>
        /// Returns true if dashboard is loaded using <see cref="JDash.WebForms.DashboardView.DataBind"/> method. 
        /// Otherwise returns false.
        /// </summary>
        [Browsable(false)]
        public bool IsDataBound
        {
            get
            {
                if (ViewState["bounded"] != null)
                    return true;
                else return false;
            }

            private set
            {
                if (value)
                    ViewState["bounded"] = true;
                else ViewState["bounded"] = null;
            }
        }

        /// <summary>
        /// Loads and displays dashboard to user. <see cref="JDash.Models.DashboardModel"/> object is retreived
        /// either using <seealso cref="JDash.WebForms.DashboardView.Dashboard"/> or <seealso cref="JDash.WebForms.DashboardView.DashboardId"/> properties.
        /// </summary>
        /// <example>This sample shows how to bind a dashboard.
        /// <code>
        /// if (!Page.IsPostBack) {
        ///   dashboardView.id = "1";
        ///   dashboardView.DataBind();
        /// }
        /// </code>
        /// </example>
        public override void DataBind()
        {
            if (!DesignMode)
            {
                unloadDashboard(false);
                IsDataBound = true;
                databinding = true;
                userUnloaded = false;
                try
                {
                    if (Page.IsPostBack)
                    {
                        RecreateChildControls();
                    }
                    base.DataBind();
                    needsClientReload = true;
                    UpdateContentsInternal();

                    databinding = false;
                    if (DashboardLoaded != null)
                        DashboardLoaded(this, EventArgs.Empty);
                }
                catch
                {
                    IsDataBound = false;
                    databinding = false;
                    unloadDashboard(false);
                    throw;
                }
            }
            else base.DataBind();

        }



        private void RecreateChildControls()
        {
            this.ChildControlsCreated = false;
            this.EnsureChildControls();
        }




        private EditorPane createEditorPane(DashletContext context, bool forceLoad = false)
        {
            dynamic config = context.Model.module.config["wfConfig"];
            if (config != null && config["ec"] != null)
            {
                var editorPane = new EditorPane(context)
                {
                    ID = "e" + context.Model.id.ToString(),
                    ControlPath = config["ec"].ToString(),
                    Lazy = true
                };

                if (EditingDashlets.Contains(context.Model.id))
                {
                    editorPane.Lazy = false;
                }

                containerPanel.ContentTemplateContainer.Controls.Add(editorPane);
                if (forceLoad)
                    OpenDashletEditor(context.Model.id);
                return editorPane;
            }
            return null;
        }

        private DashletContext createDashlet(DashletModel model, bool forceLoadEditor = false)
        {
            dynamic config = model.module.config.Get<dynamic>("wfConfig", null);
            if (config != null)
            {
                var context = new DashletContext(this, model);
                this.contextList[model.id] = context;
                var pane = new DashletPane(context)
                {
                    ID = "d" + model.id.ToString(),
                    ControlPath = config["uc"].ToString()
                };

                containerPanel.ContentTemplateContainer.Controls.Add(pane);
                var editorPane = createEditorPane(context, forceLoadEditor);

                return context;
            }
            else return null;
        }

        protected void createInitialDashlets()
        {
            if (IsDataBound)
            {
                foreach (var dashletModel in InitialDashletModels)
                {
                    var data = createDashlet(dashletModel);
                    if (databinding && data != null)
                    {
                        data.DashletPane.InternalDataBind();
                        if (data.EditorPane != null && data.EditorPane.LoadedControl != null)
                            data.EditorPane.InternalDataBind();
                    }
                }
                this.initialDashletsCreated = true;
            }
        }

        protected override void CreateChildControls()
        {
            if (DesignMode)
            {
                this.Controls.Clear();
                this.Width = 200;
                HtmlGenericControl div = new HtmlGenericControl("div");
                div.Attributes["style"] = "width: 170px; padding: 15px; background-color: #E2E2E2; border: 1px solid #666666; font-family: Arial, Helvetica, sans-serif; font-size: 10px; font-weight: bold; color: #333333;";
                div.InnerHtml = string.Format("{0} Control {1}<br/>{2}", typeof(DashboardView).Name, AssemblyInfoUtils.AssemblyVersion, AssemblyInfoUtils.Copyright);
                this.Controls.Add(div);
                return;
            }
            else
            {
                containerPanel = new PostbackHandlerPanel();
                containerPanel.ID = "u";
                containerPanel.UpdateMode = UpdatePanelUpdateMode.Conditional;
                containerPanel.ChildrenAsTriggers = false;
                Controls.Add(containerPanel);

                if (IsDataBound)
                    createInitialDashlets();
            }
        }

        private void getAll<T>(System.Web.UI.Control seed, List<T> list) where T : System.Web.UI.Control
        {
            foreach (Control item in seed.Controls)
            {
                if (item is T)
                    list.Add((T)item);
                getAll<T>(item, list);
            }
        }

        private void UpdateContentsInternal()
        {
            UpdateContents();
        }


        /// <summary>
        /// Use to force a full dashboard update. Full dashboard update means calling Update method of all updatepanel
        /// controls.
        /// </summary>
        public void UpdateContents()
        {
            var childs = new List<UpdatePanel>();
            this.getAll<UpdatePanel>(this, childs);
            foreach (var item in childs)
            {
                if (item.UpdateMode == UpdatePanelUpdateMode.Conditional)
                    item.Update();
                ResourceManager.AddUpdatePanelToRefresh(item);
            }
            if (ContentsUpdated != null && !databinding)
                ContentsUpdated(this, EventArgs.Empty);
        }

        internal override Control MyUpdatePanel
        {
            get
            {
                return this.containerPanel;
            }
        }


        /// <summary>
        /// Use to get a default position for a dashlet.
        /// </summary>
        /// <returns></returns>
        public DashletPositionModel GetDefaultPosition()
        {
            var layout = this.Dashboard.layout;
            var section = layout.sections.First();
            return new DashletPositionModel()
            {
                section = section.Key,
                zone = section.Value.zones.First().Key
            };
        }

        Dictionary<string, UpdatePositionModel> updatedPostions = new Dictionary<string, UpdatePositionModel>();

        /// <summary>
        /// Creates a dashlet. To create a dashlet dashboard should be loaded using <see cref="JDash.WebForms.DashboardView.DataBind"/> method
        /// and <see cref="JDash.WebForms.DashboardView.UserDesignMode"/> should be set <see cref="JDash.WebForms.DashboardDesignMode.full"/>
        /// or <see cref="JDash.WebForms.DashboardDesignMode.full"/> value.
        /// </summary>
        /// <param name="model"><seealso cref="JDash.Models.DashletModel"/> object which will be created inside dashboard.</param>
        /// <param name="mode">Use to specify the position for the dashlet. See <see cref="JDash.WebForms.DashletCreateMode"/> for more information.</param>
        /// <returns></returns>
        public DashletContext CreateDashlet(DashletModel model, DashletCreateMode mode = DashletCreateMode.first)
        {
            if (this.UserDesignMode == DashboardDesignMode.full || this.UserDesignMode == DashboardDesignMode.dashlets)
            {
                dashletModelCache = null;
                if (model.position == null)
                {
                    model.position = GetDefaultPosition();
                    var models = DashletContextList.Select(p => p.Value.Model).AsEnumerable();
                    var zoneDashlets = models.Where(w => w.position.section.ToString() == model.position.section.ToString() && w.position.zone.ToString() == model.position.zone.ToString()).ToList();
                    if (mode == DashletCreateMode.first)
                    {
                        model.position.pos = 0;

                        if (zoneDashlets.Any())
                        {
                            foreach (var dashlet in zoneDashlets)
                            {
                                DashletPositionModel position = SerializationUtils.Deserialize<DashletPositionModel>(SerializationUtils.Serialize(dashlet.position));
                                //DashletPositionModel position = dashlet.position;// SerializationUtils.Deserialize<DashletPositionModel>(dashlet.position.ToString());
                                position.pos++;
                                updatedPostions[dashlet.id] = new UpdatePositionModel() { id = dashlet.id, position = position };
                            }
                        }
                        return this.createDashletInternal(model, updatedPostions);

                    }
                    else
                    {
                        model.position.pos = zoneDashlets.Count;
                    }
                }

                return this.createDashletInternal(model, null);
            }
            else throw new InvalidOperationException("Invalid UserDesignMode. To create dashlets JDashboard.UserDesignMode should have full or dashlets value.");
        }

        private DashletContext createDashletInternal(DashletModel model, Dictionary<string, UpdatePositionModel> newPos = null)
        {
            DashletContext data = null;
            if (Dashboard != null)
            {
                model.dashboardId = this.DashboardId;
                if (model.position == null)
                {
                    model.position = GetDefaultPosition();
                }
                if (model.module == null)
                    model.module = JDashManager.Provider.GetDashletModule(model.moduleId);
                JDashManager.Provider.CreateDashlet(model, newPos != null ? newPos.Select(p => p.Value) : null);
                dynamic config = model.module.config.Get<dynamic>("wfConfig", null);
                var autoEdit = config != null && config.autoEdit == true;
                data = createDashlet(model, autoEdit);
                data.DashletPane.InternalDataBind();
                this.dashletCreated = true;
                dashletsCreated.Add(model);
            }
            UpdateContents();

            return data;
        }

        /// <summary>
        /// Opens dashlet editor for the specified dashlet.
        /// </summary>
        /// <param name="dashletId">Id of dashlet</param>
        public void OpenDashletEditor(string dashletId)
        {
            if (Dashboard != null)
            {
                var data = this.DashletContextList[dashletId];

                addEditingDashlet(data.Model.id);
                var editorPane = data.EditorPane;
                editorPane.Update();
                ResourceManager.AddUpdatePanelToRefresh(editorPane);
                editorPane.LoadControl();
                editorPane.InternalDataBind();
                if (JEventManager.GetHandlerMethod(editorPane.LoadedControl, JEvent.CancelDashletEditor) == null)
                {
                    manageDashboardProps["discardEvents"] = new
                    {
                        dashletId = dashletId,
                        eventNames = new string[] { JEvent.CancelDashletEditor }
                    };
                }
            }
        }

        /// <summary>
        /// Closes dashlet editor for the specified dashlet.
        /// </summary>
        /// <param name="dashletId">Id of dashlet</param>
        public void CloseDashletEditor(string dashletId)
        {
            if (Dashboard != null)
            {
                removeEditingDashlet(dashletId);
                var control = this.DashletContextList[dashletId].EditorPane as EditorPane;
                if (control != null)
                {
                    control.Lazy = true;
                    control.removeLoadedControl();
                }
            }
        }


        /// <summary>
        /// Returns a list of <seealso cref="JDash.WebForms.DashletContext"/> objects created
        /// for each dashlet inside dashboard.
        /// </summary>
        [Browsable(false)]
        public Dictionary<string, DashletContext> DashletContextList
        {
            get
            {
                return this.contextList;
            }
        }

        /// <summary>
        /// Use to get <see cref="JDash.WebForms.DashletContext"/> object for your user control.
        /// </summary>
        /// <param name="control">User control</param>
        /// <returns><see cref="JDash.WebForms.DashletContext"/> object bound to the control.</returns>
        public DashletContext GetContextOfMe(Control control)
        {
            foreach (var item in DashletContextList)
            {
                if (item.Value.DashletControl == control)
                    return item.Value;
                else if (item.Value.EditorControl == control)
                    return item.Value;
            }
            return null;
        }

        internal void BroadcastContext(DashletContext context, params object[] targets)
        {
            var evt = new JEvent(JEvent.InitContext);
            evt.Parameters.Add("context", context);
            Broadcast(evt, targets);
        }

        /// <summary>
        /// Use to broadcast an event.
        /// </summary>
        /// <param name="Event"><seealso cref="JDash.WebForms.JEvent"/> object to broadcast</param>
        /// <param name="targets">An optional list of objects to broadcast. </param>
        public void Broadcast(JEvent Event, params object[] targets)
        {
            var args = new JEventArgs(Event);
            if (EventExecuting != null)
                EventExecuting(this, args);
            if (args.Rejected)
                throw new EventRejectedException("Event rejected:" + Event.Name);
            if (!args.Handled)
            {
                PreBroadcastEvent(Event);
                JEventManager.BroadcastEvent(this, args, targets);
                if (args.Rejected)
                    throw new EventRejectedException("Event rejected:" + Event.Name);
                if (!args.Handled)
                    processEvent(Event);
                if (EventExecuted != null)
                    EventExecuted(this, args);
            }
        }

        private void PreBroadcastEvent(JEvent Event)
        {
            switch (Event.Name)
            {
                case JEvent.ValidateDashletEditor:
                    {
                        var modelData = Event.Parameters.Get<dynamic>("modelData", null);
                        if (modelData != null)
                        {
                            var dashletId = Event.Parameters.Get<string>("id");
                            var info = DashletContextList[dashletId];
                            if (modelData.paneConfig != null && modelData.paneConfig.themeStyleId != null)
                                info.Model.paneConfig["themeStyleId"] = modelData.paneConfig.themeStyleId;
                            if (modelData.paneConfig != null && modelData.paneConfig.disableTheming != null)
                                info.Model.paneConfig["disableTheming"] = modelData.paneConfig.disableTheming;
                            if (modelData.paneConfig != null && modelData.paneConfig.cssClass != null)
                                info.Model.paneConfig["cssClass"] = modelData.paneConfig.cssClass;
                            if (modelData.title != null)
                                info.Model.title = modelData.title;
                        }
                        break;
                    }
            }
        }

        private void processEvent(JEvent Event)
        {
            switch (Event.Name)
            {
                case JEvent.DeleteDashlet:
                    {
                        var id = Event.Parameters.Get<string>("id");
                        this.RemoveDashlet(id);
                        break;
                    }
                case JEvent.UpdateDashletPositions:
                    {
                        var positions = SerializationUtils.Deserialize<IEnumerable<UpdatePositionModel>>(Event.Parameters["positions"].ToString());
                        JDashManager.Provider.UpdateDashletPositions(positions);
                        break;
                    }
                case JEvent.OpenDashletEditor:
                    {
                        var dashletId = Event.Parameters.Get<string>("id");
                        OpenDashletEditor(dashletId);
                        break;
                    }
                case JEvent.CancelDashletEditor:
                    {
                        var dashletId = Event.Parameters.Get<string>("id");
                        CloseDashletEditor(dashletId);
                        break;
                    }
                case JEvent.ValidateDashletEditor:
                    {
                        var dashletId = Event.Parameters.Get<string>("id");
                        var action = Event.Parameters.Get<string>("action", "save");
                        if (action == "save")
                            CloseDashletEditor(dashletId);
                        break;
                    }
                case JEvent.CreateDashlet:
                    {
                        DashletModel model = SerializationUtils.Deserialize<DashletModel>(Event.Parameters["model"].ToString());
                        var newPos = SerializationUtils.Deserialize<IEnumerable<UpdatePositionModel>>(Event.Parameters["newPositions"].ToString());
                        this.createDashletInternal(model, newPos);


                        break;
                    }
                case JEvent.GetDashletModule:
                    {
                        var id = Event.Parameters.Get<string>("id");
                        var key = Event.Parameters.Get<string>("_postbackKey");
                        var module = JDashManager.Provider.GetDashletModule(id);
                        AddScript(string.Format("jdash.setPostbackResult('{0}', {1})", key, SerializationUtils.Serialize(module)));
                        break;
                    }

                case JEvent.SaveDashboard:
                    {
                        DashboardModel model = SerializationUtils.Deserialize<DashboardModel>(Event.Parameters["model"].ToString());
                        JDashManager.Provider.SaveDashboard(model);
                        break;
                    }


                case JEvent.ChangeDashboardLayout:
                    {
                        if (Event.Parameters["updatedPositions"] != null)
                        {
                            var positions = SerializationUtils.Deserialize<IEnumerable<UpdatePositionModel>>(Event.Parameters["updatedPositions"].ToString());
                            JDashManager.Provider.UpdateDashletPositions(positions);
                        }
                        this.DataBind();
                        break;
                    }

                case JEvent.CommandExecuting:
                    {
                        var dashletId = Event.Parameters["__relatedDashletId"];
                        var name = Event.Parameters.Get<string>("name");
                        var newEvent = new JEvent(name, Event.Parameters, null, string.Format("pre-{0}", name));
                        broadcastEventToDashlet(newEvent, dashletId);
                        break;
                    }


                case JEvent.CommandExecuted:
                    {
                        var dashletId = Event.Parameters["__relatedDashletId"];
                        var name = Event.Parameters.Get<string>("name");
                        var newEvent = new JEvent(string.Format("{0}", name), Event.Parameters);
                        broadcastEventToDashlet(newEvent, dashletId);
                        break;
                    }
            }
        }

        /// <summary>
        /// Removes dashlet from dashboard.
        /// </summary>
        /// <param name="dashletId">Id of dashlet to remove</param>
        public void RemoveDashlet(string dashletId)
        {
            var context = DashletContextList[dashletId];
            CloseDashletEditor(dashletId);
            containerPanel.ContentTemplateContainer.Controls.Remove(context.DashletPane);
            containerPanel.ContentTemplateContainer.Controls.Remove(context.EditorPane);
            if (contextList.ContainsKey(dashletId))
                this.contextList.Remove(dashletId);
            JDashManager.Provider.DeleteDashlet(dashletId);
        }

        /// <summary>
        /// Use to broadcast an event to all dashlets inside dashboard.
        /// </summary>
        /// <param name="Event"><seealso cref="JDash.WebForms.JEvent"/> object to broadcast</param>
        public void Broadcast(JEvent Event)
        {
            var controls = this.contextList.Select(p => p.Value.DashletControl).ToList();
            controls.AddRange(this.contextList.Where(p => p.Value.EditorControl != null).Select(p => p.Value.EditorControl).AsEnumerable());
            Broadcast(Event, controls.ToArray());
        }

        private void broadcastEventToDashlet(JEvent ewt, string dashletid)
        {
            var info = DashletContextList[dashletid];
            if (info != null)
            {
                ewt.Parameters["context"] = info;
                var control = info.DashletPane.LoadedControl;
                var editor = info.EditorPane == null ? null : info.EditorPane.LoadedControl;
                if (editor != null)
                    Broadcast(ewt, control, editor);
                else Broadcast(ewt, control);
            }
        }

        public void RaisePostBackEvent(string eventArgument)
        {
            var evt = JEvent.FromJson(eventArgument);
            if (evt.Parameters.ContainsKey("__relatedDashletId"))
            {
                var dashletId = evt.Parameters["__relatedDashletId"];
                broadcastEventToDashlet(evt, dashletId);
            }
            else Broadcast(evt);
        }



        protected override void AddAttributesToRender(HtmlTextWriter writer)
        {
            if (!DesignMode)
            {
                this.containerPanel.Attributes.Add("data-jdash-dashboardId", DashboardId);
                this.containerPanel.Attributes.Add("class", "wfDashboardContainer");
                if (!Page.IsPostBack)
                    this.Style.Add("opacity", "0");

            }
            base.AddAttributesToRender(writer);

        }

        /// <summary>
        /// Changes layout of dashboard. When layout is changed all dashlets are re-positioned
        /// according to the new layout.
        /// </summary>
        /// <param name="newLayout"><see cref="JDash.Models.LayoutModel"/> object.</param>
        public void ChangeLayout(LayoutModel newLayout)
        {
            if (IsDataBound)
            {
                if (this.UserDesignMode == DashboardDesignMode.full || this.UserDesignMode == DashboardDesignMode.dashboard)
                {
                    this.Dashboard.layout = newLayout;
                    JDashManager.Provider.SaveDashboard(this.Dashboard);
                    AddScript(string.Format("jdash.getCmp('{0}').changeLayout({1});", this.ClientWidgetID, Serialization.JsonStringify(newLayout)));
                }
                else throw new InvalidOperationException("Invalid UserDesignMode. To change layout JDashboard.UserDesignMode should have full or dashboard value.");
            }
        }


        /// <summary>
        /// Saves current <see cref="JDash.Models.DashboardModel"/> object using current provider.
        /// Also see <seealso cref="JDash.JDashManager.Provider.SaveDashboard"/> method.
        /// </summary>
        /// <returns></returns>
        public DashboardModel SaveDashboard()
        {
            if (IsDataBound)
            {
                return JDashManager.Provider.SaveDashboard(this.Dashboard);
            }
            else return null;
        }

        /// <summary>
        /// Unloads and deletes currently loaded dashboard. Also see <seealso cref="JDash.JDashManager.Provider.DeleteDashboard"/> method.
        /// </summary>
        public void DeleteDashboard()
        {
            if (IsDataBound)
            {
                UnloadDashboard();
                JDashManager.Provider.DeleteDashboard(this.Dashboard.id);
            }
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            if (IsDataBound && !DesignMode)
                AddScript(string.Format("jdash.manageDashboard('{0}', {1});", this.ClientWidgetID, Serialization.JsonStringify(manageDashboardProps)));
        }


        /// <summary>
        /// Reloads dashlet properties on client side.
        /// Call this method if you change a dashlet property and want to reflect changes
        /// on client side.
        /// </summary>
        /// <param name="model"><see cref="JDash.Models.DashletModel"/> object.</param>
        /// <param name="props">Updated properties.</param>
        public void LoadDashletProperties(DashletModel model, dynamic props)
        {
            AddScript(string.Format("jdash.getCmp('{0}').loadDashletProperties('{1}', {2})",
                this.ClientWidgetID,
                model.id,
                SerializationUtils.Serialize(props)));
        }

        internal void CallDashletContext(string dashletId, string method, object[] prms)
        {
            this.AddScript(string.Format("jdash.callDashletContext('{0}', '{1}', '{2}', {3});", this.ClientWidgetID, dashletId, method, SerializationUtils.Serialize(prms)));
        }

        internal void CallDashlet(string dashletId, string method, object[] prms)
        {
            this.AddScript(string.Format("jdash.callDashlet('{0}', '{1}', '{2}', {3});", this.ClientWidgetID, dashletId, method, SerializationUtils.Serialize(prms)));
        }


    }
}
