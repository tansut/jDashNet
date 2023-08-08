using JDash.Models;
using JDash.Webform.Management.Controls.Common;
using JDash.Webform.Management.Core.Provider;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Newtonsoft.Json.Linq;

namespace JDash.Webform.Management.Controls.DashletModule
{
    public partial class DashletModuleEditor : BaseEditor
    {
        public override event BaseEditor.onSaveDelgete onSave;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DashletModuleEditorModal.ClientIDMode = ClientIDMode.Static;
                Hide();
                bindGroups();
                bindCommands();
            }
            ctlDashletCommandEditor.onSave += ctlDashletCommandEditor_onSave;
            if (!string.IsNullOrWhiteSpace(ctlActiveTab.Value))
                ScriptManager.RegisterClientScriptBlock(Page, GetType(), "activateTab", "activateTab()", true);

        }

        void ctlDashletCommandEditor_onSave()
        {
            var customCommands = getCommands();
            if (ViewState["command2EditIndex"] != null)
                customCommands[(int)ViewState["command2EditIndex"]] = ctlDashletCommandEditor.Model;
            else if (customCommands.Any(x => x.Name == ctlDashletCommandEditor.Model.Name))
            {
                customCommands[customCommands.IndexOf(customCommands.First(x => x.Name == ctlDashletCommandEditor.Model.Name))] = ctlDashletCommandEditor.Model;
            }
            else
                customCommands.Add(ctlDashletCommandEditor.Model);

            ViewState["customCommands"] = customCommands;
            ViewState["command2EditIndex"] = null;
            bindCommands();
        }


        private void bindGroups()
        {
            var modules = ProviderManager.CurrentProvider.SearchDashletModules();
            if (modules != null)
            {
                var groupedModules = modules.data.Where(d => d.metaData.group != null);
                if (groupedModules != null)
                {
                    ctlGroup.DropDown.DataSource = groupedModules.Select(d => d.metaData.group).Distinct().ToList();
                    ctlGroup.DropDown.DataBind();
                }
            }
            
        }

        private void bindCommands()
        {
            ctlCommands.DataSource = getCommands();
            ctlCommands.DataBind();
        }

        public List<DashletCommandEditorModel> getCommands()
        {
            return (List<DashletCommandEditorModel>)ViewState["customCommands"];
        }

        public override void Show()
        {

            DashletModuleEditorModal.Style.Add("display", "block");
        }

        public override void Hide()
        {
            DashletModuleEditorModal.Style.Add("display", "none");
        }


        public override void Clear()
        {
            ViewState["customCommands"] = null;
            ViewState["ModuleID"] = null;
            ViewState["command2EditIndex"] = null;
            bindCommands();
            DashletModule = new DashletModuleModel();

        }

        protected void ctlSubmitButton_Click(object sender, EventArgs e)
        {

            updateDashletModule();
            if (ViewState["ModuleID"] != null)
                ProviderManager.CurrentProvider.SaveDashletModule(DashletModule);
            else
                ProviderManager.CurrentProvider.CreateDashletModule(DashletModule);

            Hide();
            if (onSave != null)
                onSave();


        }

        protected void ctlCancelButton_Click(object sender, EventArgs e)
        {
            Clear();
            Hide();
        }

        public void updateDashletModule()
        {
            DashletModule.config = getConfigByFormString(ctlModuleConfig.Value);
            var WfConfig = DashletModule.config.Get<dynamic>("wfConfig", null);
            if (WfConfig == null)
            {
                WfConfig = new Config();
                dashletModule.config.Add("wfConfig", WfConfig);
            }

            setDynamicValue(WfConfig, "uc", ctlControlPath.Value);
            setDynamicValue(WfConfig, "ec",ctlEditable.Checked? ctlEditorControlPath.Value: null);
            setDynamicValue(WfConfig, "autoEdit", ctlAutoEdit.Checked);
            if (ctlEditable.Checked)
            {
                var editor = DashletModule.config.Get<dynamic>("editor", null);
                if (editor == null)
                {
                    editor = new Config();
                    dashletModule.config.Add("editor", editor);
                }

                setDynamicValue(editor,"paneConfig", editor.ContainsKey("paneConfig") ? editor["paneConfig"] : new Config());
                setDynamicValue(editor["paneConfig"], "cssClass", ctlEditorCssClass.Value);
                setDynamicValue(editor["paneConfig"], "width", ctlWidth.Value);
                setDynamicValue(editor["paneConfig"], "height", ctlHeigth.Value);
                setDynamicValue(editor, "useWindow", ctlShowInsideWindow.Checked);
                if (!ctlEditorUseDefaultModule.Checked)
                    setDynamicValue(editor, "path", ctlEditorClientModulePath.Value);
                else
                    editor.Remove("path");
            }
            else
                dashletModule.config.Remove("editor");

            List<string> paneCommands = new List<string>();
            if (ctlMaximizeable.Checked)
            {
                paneCommands.Add("maximize");
                paneCommands.Add("restore");
            }

            if (ctlRemoveable.Checked)
                paneCommands.Add("remove");

            if (ctlRefreshable.Checked)
                paneCommands.Add("refresh");

            List<string> notificationList = new List<string>();
            if (ctlNotifyMaximize.Checked)
            {
                notificationList.Add("maximize");
                notificationList.Add("restore");
            }
            if (ctlNotifyOnRefresh.Checked) notificationList.Add("refresh");
            if (ctlNotifyOnRemove.Checked) notificationList.Add("remove");
            notificationList.AddRange(getCommands().Where(x => x.Notifyable).Select(x => x.Name).ToList());
            var notifications = new Config();
            setDynamicValue(notifications, "commands", notificationList);
            setDynamicValue(WfConfig, "notifications", notifications);

            DashletModule.config["wfConfig"] = WfConfig;
            DashletModule.dashletConfig = getConfigByFormString(ctlDashletConfig.Value);
            DashletModule.metaData = Serializer.Deserialize<MetadataModel>(ctlMetadata.Value);
            if (DashletModule.metaData == null) DashletModule.metaData = new MetadataModel();

            DashletModule.paneConfig = getConfigByFormString(ctlPaneConfig.Value);
            setDynamicValue(DashletModule.paneConfig, "cssClass", ctlCssClass.Value);
            setDynamicValue(DashletModule.paneConfig, "builtInCommands", paneCommands.ToArray());

            setDynamicValue(DashletModule.paneConfig, "customCommands", getCommands().Select(x => x.getConfig()).ToArray());

            DashletModule.path = ctlDefaultModulePath.Checked ? "[WfDefault]" : ctlClientModulePath.Value;
            DashletModule.title = ctlTitle.Value;
            DashletModule.metaData.group = ctlUseCustomGroup.Checked ? ctlCustomGroup.Value : ctlGroup.Value;
            DashletModule.authorization = ctlAuthenticationEditor.AuthenticationDictionary;
            DashletModule.metaData.description = ctlDescription.Value;

        }

        private Config getConfigByFormString(string value)
        {
            var Config = Serializer.Deserialize<Config>(value);
            if (Config == null) Config = new Config();
            return Config;
        }

        private void setDynamicValue(Dictionary<string, object> config, string key, object value, bool validate=true)
        {
            if (validate && value != null && (value.GetType() == typeof(string) &&  value.ToString().Trim().Length == 0)) value = null;
            if (!config.ContainsKey(key)) config.Add(key, value); else config[key] = value;
        }

        private DashletModuleModel dashletModule;
        public DashletModuleModel DashletModule
        {
            get
            {
                if (dashletModule == null && ViewState["ModuleID"] != null)
                    dashletModule = ProviderManager.CurrentProvider.GetDashletModule(ViewState["ModuleID"].ToString());
                else if (dashletModule == null)
                    dashletModule = new DashletModuleModel();
                return dashletModule;
            }
            set
            {
                ctlAuthenticationEditor.Clear();
                ctlModuleTitle.Text = string.Format("- {0}", value.title);
                ViewState["customCommands"] = new List<DashletCommandEditorModel>();
                ctlActiveTab.Value = null;
                ctlEditorControlPath.Validator.Enabled = false;
                if (value.id != null)
                {
                    ViewState["ModuleID"] = value.id;
                    bindGroups();
                    ctlAuthenticationEditor.AuthenticationDictionary = value.authorization;
                    ctlTitle.Value = value.title;
                    ctlDescription.Value = value.metaData.description;
                    ctlMetadata.Value = getPrettyJson(value.metaData);
                    ctlGroup.DropDown.SelectedValue = value.metaData.group;
                    ctlPaneConfig.Value = getPrettyJson(value.paneConfig);
                    ctlModuleConfig.Value = getPrettyJson(value.config);
                    ctlDashletConfig.Value = getPrettyJson(value.dashletConfig);
                    ctlUseCustomGroup.Checked = false;
                    ctlDefaultModulePath.Checked = value.path == "[WfDefault]";
                    ctlClientModulePath.Hide = ctlDefaultModulePath.Checked;
                    ctlUseCustomGroup.Checked = false;

                    if (!ctlDefaultModulePath.Checked)
                        ctlClientModulePath.Value = value.path;

                    var WFConfig = value.config.Get<dynamic>("wfConfig", null);
                    if (WFConfig != null)
                    {
                        ctlControlPath.Value = WFConfig.uc == null ? string.Empty : WFConfig.uc;
                        if (WFConfig.autoEdit != null)
                            ctlAutoEdit.Checked = WFConfig.autoEdit;



                        if (WFConfig.notifications != null)
                        {
                            ctlNotifyMaximize.Checked = hasCommandNotification(WFConfig, "maximize");
                            ctlNotifyOnRefresh.Checked = hasCommandNotification(WFConfig, "refresh");
                            ctlNotifyOnRemove.Checked = hasCommandNotification(WFConfig, "remove");
                        }
                    }

                    var editorConfig = value.config.Get<dynamic>("editor", null);
                    if (editorConfig != null)
                    {
                        ctlEditable.Checked = true;

                        //      ctlEditorControlPath.Validator.Enabled = true;
                        ctlEditorControlPath.Value = WFConfig.ec;
                        editor.Attributes["style"] = "display:block";


                        ctlEditorUseDefaultModule.Checked = editorConfig.path == null;
                        if (ctlEditorUseDefaultModule.Checked)
                        {
                            ctlEditorClientModulePath.Hide = true;
                        }
                        else
                        {
                            ctlEditorClientModulePath.Hide = false;
                            ctlEditorClientModulePath.Value = editorConfig.path;
                        }
                        if (editorConfig.useWindow != null)
                            ctlShowInsideWindow.Checked = editorConfig.useWindow;

                        if (editorConfig.paneConfig != null)
                        {
                            ctlEditorCssClass.Value = editorConfig.paneConfig.cssClass;
                            ctlWidth.Value = editorConfig.paneConfig.width;
                            ctlHeigth.Value = editorConfig.paneConfig.height;
                            if (editorConfig.paneConfig.cssClass != null)
                                ctlCssClass.Value = editorConfig.paneConfig.cssClass;

                        }
                    }
                    else
                    {
                        ctlEditable.Checked = false;
                        editor.Attributes["style"] = "display:none";
                    }
                    if (value.paneConfig != null)
                    {
                        ctlCssClass.Value = value.paneConfig.Get<dynamic>("cssClass", string.Empty);
                        var builtInCommands = value.paneConfig.Get<dynamic>("builtInCommands", null);
                        if (builtInCommands != null && builtInCommands is JArray)
                        {
                            var commandList = ((JArray)builtInCommands).Select(x => x.ToString()).ToList();
                            ctlRemoveable.Checked = commandList.Contains("remove");
                            ctlRefreshable.Checked = commandList.Contains("refresh");
                            ctlMaximizeable.Checked = commandList.Contains("maximize");
                        }
                        var customCommands = value.paneConfig.Get<dynamic>("customCommands", null);
                        if (customCommands != null && customCommands is JArray)
                        {
                            var commandList = ((JArray)customCommands);
                            var convertedCommands = new List<DashletCommandEditorModel>();
                            foreach (var item in commandList)
                            {
                                var configItem = ((dynamic)item);
                                convertedCommands.Add(new DashletCommandEditorModel()
                                {
                                    Confirm = (bool)configItem.confirm,
                                    ConfirmMessage = (string)configItem.confirmMessage,
                                    CssClass = (string)configItem.ui.iconClass,
                                    Title = (string)configItem.ui.title,
                                    Label = (string)configItem.label,
                                    Name = (string)configItem.name,
                                    Type = (string)configItem.type,
                                    Notifyable = WFConfig == null ? false : hasCommandNotification(WFConfig, (string)configItem.name)
                                });


                            }
                            ViewState["customCommands"] = convertedCommands;
                            bindCommands();
                        }

                    }

                }
                else
                {
                    ctlModuleTitle.Text = string.Empty;
                    ViewState["customCommands"] = new List<DashletCommandEditorModel>();
                    ctlTitle.Value = string.Empty;
                    ctlDescription.Value = string.Empty;
                    ctlMetadata.Value = string.Empty;
                    ctlNotifyMaximize.Checked = false;
                    ctlNotifyOnRefresh.Checked = false;
                    ctlNotifyOnRemove.Checked = false;
                    ctlPaneConfig.Value = string.Empty;
                    ctlUseCustomGroup.Checked = false;
                    ctlDefaultModulePath.Checked = true;
                    ctlClientModulePath.Hide = true;
                    ctlClientModulePath.Value = string.Empty;
                    ctlControlPath.Value = string.Empty;
                    ctlAutoEdit.Checked = false;
                    ctlEditable.Checked = false;
                    ctlEditorControlPath.Value = string.Empty;
                    editor.Attributes["style"] = "display:none";
                    ctlEditorUseDefaultModule.Checked = true;
                    ctlEditorClientModulePath.Hide = true;
                    ctlEditorClientModulePath.Value = string.Empty;
                    ctlShowInsideWindow.Checked = false;
                    ctlEditorCssClass.Value = string.Empty;
                    ctlWidth.Value = string.Empty;
                    ctlHeigth.Value = string.Empty;
                    ctlCssClass.Value = string.Empty;
                    ctlModuleConfig.Value = string.Empty;
                    ctlMaximizeable.Checked = false;
                    ctlRefreshable.Checked = false;
                    ctlRemoveable.Checked = true;
                }

            }
        }

        private bool hasCommandNotification(dynamic WFConfig, string commandName)
        {

            return (WFConfig.notifications != null && WFConfig.notifications.commands is JArray && ((JArray)WFConfig.notifications.commands).Any(d => d.ToString().Equals(commandName)));

        }

        protected void ctlAddCustomCommand_Click(object sender, EventArgs e)
        {
            ViewState["command2EditIndex"] = null;
            ctlDashletCommandEditor.Clear();
            ctlDashletCommandEditor.Show();
        }

        protected void ctlCommands_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Edit":
                    ctlDashletCommandEditor.Model = getCommands().First(x => x.Name.Equals(e.CommandArgument.ToString()));
                    ViewState["command2EditIndex"] = getCommands().IndexOf(getCommands().First(x => x.Name.Equals(e.CommandArgument.ToString())));
                    ctlDashletCommandEditor.Show();
                    break;
                case "Remove":
                    getCommands().Remove(getCommands().First(x => x.Name.Equals(e.CommandArgument.ToString())));
                    ViewState["customCommands"] = getCommands();
                    bindCommands();
                    break;
            }
        }
    }
}