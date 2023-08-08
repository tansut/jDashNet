<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DashletModuleEditor.ascx.cs" Inherits="JDash.Webform.Management.Controls.DashletModule.DashletModuleEditor" %>
<%@ Register Src="~/Core/Controls/UI/JDashLabeledTextBox.ascx" TagPrefix="JD" TagName="JDashLabeledTextBox" %>
<%@ Register Src="~/Core/Controls/UI/JDashLabeledDropDown.ascx" TagPrefix="JD" TagName="JDashLabeledDropDown" %>
<%@ Register Src="~/Core/Controls/UI/JDashChekBoxGroup.ascx" TagPrefix="JD" TagName="JDashChekBoxGroup" %>
<%@ Register Src="~/Controls/DashletModule/DashletCommandEditor.ascx" TagPrefix="JD" TagName="DashletCommandEditor" %>
<%@ Register Src="~/Controls/Common/AuthenticationEditor.ascx" TagPrefix="JD" TagName="AuthenticationEditor" %>

<div id="Div2" runat="server" class="paneCommandEditorContainer" >
    <JD:DashletCommandEditor runat="server" ID="ctlDashletCommandEditor" />
</div>
<div id="DashletModuleEditorModal" runat="server" class="modal" tabindex="-1" role="dialog" aria-labelledby="modalHeader" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">

                <h3 id="modalHeader">
                    <asp:Localize ID="Localize1" runat="server" meta:resourcekey="modalHeader" />
                    <asp:Label ID="ctlModuleTitle" runat="server"></asp:Label>
                </h3>
            </div>
            <div class="modal-body">

                <ul class="nav nav-tabs" runat="server" clientidmode="Static" id="ctlTabs">
                    <li onclick="logTab(this)" id="ctlTabGeneral" class="active"><a href="#General" data-toggle="tab">
                        <asp:Localize ID="Localize2" runat="server" meta:resourcekey="tabGeneral" /></a></li>
                    <li onclick="logTab(this)" id="tabPaneCommands"><a href="#PaneCommands" data-toggle="tab">
                        <asp:Localize ID="Localize7" runat="server" meta:resourcekey="tabPaneCommands" /></a></li>
                    <li onclick="logTab(this)" id="tabModuleConfig"><a href="#ModuleConfig" data-toggle="tab">
                        <asp:Localize ID="Localize4" runat="server" meta:resourcekey="tabModuleConfig" /></a></li>
                    <li><a href="#DashletConfig" data-toggle="tab">
                        <asp:Localize ID="Localize6" runat="server" meta:resourcekey="tabDashletConfig" /></a></li>
                    <li><a href="#PaneConfig" data-toggle="tab">
                        <asp:Localize ID="Localize5" runat="server" meta:resourcekey="tabPaneConfig" /></a></li>
                    <li><a href="#Metadata" data-toggle="tab">
                        <asp:Localize ID="Localize3" runat="server" meta:resourcekey="tabMetadata" /></a></li>
                    <li onclick="logTab(this)" id="tabAuthentication"><a href="#Authentication" data-toggle="tab">
                        <asp:Localize ID="ctlAuthentication" runat="server" meta:resourcekey="tabAuthentication" /></a></li>
                </ul>
                <asp:HiddenField ClientIDMode="Static" runat="server" ID="ctlActiveTab" />
                <div class="tab-content">
                    <div class="tab-pane active" id="General">
                        <div class="form-horizontal">

                            <JD:JDashLabeledTextBox runat="server" ValidationText="<%$ Resources:Global, requiredField%>" ID="ctlTitle" meta:resourcekey="ctlTitle" />
                            <JD:JDashLabeledTextBox Type="multi" Rows="3" runat="server" ID="ctlDescription" meta:resourcekey="ctlDescrition" />
                            <JD:JDashChekBoxGroup runat="server" Checked="false" ClientCheck="toggleSelection(!this.checked,'ctlGroup');toggleSelection(this.checked,'ctlCustomGroup')" ID="ctlUseCustomGroup" meta:resourcekey="ctlUseCustomGroup" />
                            <JD:JDashLabeledDropDown runat="server" ID="ctlGroup" ContainerID="ctlGroup" meta:resourcekey="ctlGroup" />
                            <JD:JDashLabeledTextBox runat="server" ID="ctlCustomGroup" Hide="true" ContainerID="ctlCustomGroup" meta:resourcekey="ctlGroup" />
                            <JD:JDashLabeledTextBox runat="server" ContainerID="ctlControlPathConainer" ValidationText="<%$ Resources:Global, requiredField%>" ID="ctlControlPath" meta:resourcekey="ctlControlPath" />

                            <JD:JDashChekBoxGroup  runat="server" ClientCheck="toggleSelection(!this.checked,'ctlClientModulePath')" ID="ctlDefaultModulePath" meta:resourcekey="ctlUseDefaultModule" />
                            <JD:JDashLabeledTextBox runat="server" ID="ctlClientModulePath" Hide="true" ContainerID="ctlClientModulePath" meta:resourcekey="ctlClientModulePath" />

                            <JD:JDashLabeledTextBox runat="server" ID="ctlCssClass" meta:resourcekey="ctlCssClass" />
                            <JD:JDashChekBoxGroup runat="server" Checked="false" ClientCheck="toggleSelection(this.checked,'editor')" ID="ctlEditable" meta:resourcekey="ctlEditable" />

                            <asp:Panel runat="server" ID="editor" ClientIDMode="Static">
                                <b>Editor</b><hr />
                                <JD:JDashLabeledTextBox runat="server" ContainerID="ctlControlEditorPathConainer" ID="ctlEditorControlPath" meta:resourcekey="ctlEditorControlPath" />
                                <JD:JDashChekBoxGroup runat="server" Hide="true" Visible="false" ClientCheck="toggleSelection(!this.checked,'ctlEditorClientModulePath'); " ID="ctlEditorUseDefaultModule" meta:resourcekey="ctlUseDefaultModule" />
                                <JD:JDashLabeledTextBox Hide="true" Visible="false" runat="server" ContainerID="ctlEditorClientModulePath" ID="ctlEditorClientModulePath" meta:resourcekey="ctlEditorClientModulePath" />
                                <JD:JDashChekBoxGroup runat="server" Checked="false" ID="ctlShowInsideWindow" meta:resourcekey="ctlShowInsideWindow" />
                                <JD:JDashLabeledTextBox runat="server" ID="ctlEditorCssClass" meta:resourcekey="ctlCssClass" />

                                <JD:JDashLabeledTextBox runat="server" ID="ctlWidth" meta:resourcekey="ctlWidth" />
                                <JD:JDashLabeledTextBox runat="server" ID="ctlHeigth" meta:resourcekey="ctlHeigth" />
                                <JD:JDashChekBoxGroup runat="server" Checked="false" ID="ctlAutoEdit" meta:resourcekey="ctlAutoEdit" />
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="tab-pane" id="PaneCommands">
                        <div class="form-horizontal">
                            <div class="checkBoxSet">
                                <JD:JDashChekBoxGroup runat="server" Checked="false" ID="ctlMaximizeable" meta:resourcekey="ctlMaximizeable" />
                                <JD:JDashChekBoxGroup runat="server" Checked="false" ID="ctlNotifyMaximize" meta:resourcekey="ctlNotifyMaximize" />
                            </div>
                            <div class="checkBoxSet">
                                <JD:JDashChekBoxGroup runat="server" Checked="false" ID="ctlRefreshable" meta:resourcekey="ctlRefreshable" />
                                <JD:JDashChekBoxGroup runat="server" Checked="false" ID="ctlNotifyOnRefresh" meta:resourcekey="ctlNotifyOnRefresh" />
                            </div>
                            <div class="checkBoxSet">
                                <JD:JDashChekBoxGroup runat="server" Checked="true" ID="ctlRemoveable" meta:resourcekey="ctlRemoveable" />
                                <JD:JDashChekBoxGroup runat="server" Checked="false" ID="ctlNotifyOnRemove" meta:resourcekey="ctlNotifyOnRemove" />
                            </div>
                            <b>
                                <asp:Localize ID="Localize8" runat="server" meta:resourcekey="customCommands" /></b><hr />
                            <jdashUi:JDashButton ID="ctlAddCustomCommand" runat="server" ButtonType="basic" ButtonSize="small" meta:resourcekey="ctlAddCustomCommand" CausesValidation="false" OnClick="ctlAddCustomCommand_Click" />
                            <br />
                            <br />
                            <div class="control-group">
                                <asp:Repeater ID="ctlCommands" OnItemCommand="ctlCommands_ItemCommand" runat="server">
                                    <HeaderTemplate>
                                        <table class="table table-striped table-fullwidth" id="commandsTable">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# ((JDash.Webform.Management.Controls.DashletModule.DashletCommandEditorModel)Container.DataItem).Name %></td>
                                            </td>
                                    <td style="width: 60px;">
                                        <jdashUi:JDashButton ID="JDashButton1" runat="server" ButtonType="basic" ButtonSize="small" CausesValidation="false" CommandName="Edit" FullWidth="True" CommandArgument='<%# ((JDash.Webform.Management.Controls.DashletModule.DashletCommandEditorModel)Container.DataItem).Name %>' meta:resourcekey="ctlEditButton" /></td>
                                            <td style="width: 60px;">
                                                <jdashUi:JDashButton ID="JDashButton2" runat="server" ButtonType="basic" ButtonSize="small" CausesValidation="false" CommandName="Remove" FullWidth="True" CommandArgument='<%# ((JDash.Webform.Management.Controls.DashletModule.DashletCommandEditorModel)Container.DataItem).Name %>' meta:resourcekey="ctlRemoveButton" /></td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </table>  
                                    </FooterTemplate>
                                </asp:Repeater>

                            </div>

                        </div>
                    </div>
                    <div class="tab-pane" id="ModuleConfig">
                        <div class="form-horizontal">
                            <JD:JDashLabeledTextBox Type="multi" Rows="15" runat="server" ID="ctlModuleConfig" meta:resourcekey="ctlModuleConfig" />
                        </div>
                    </div>
                    <div class="tab-pane" id="DashletConfig">
                        <div class="form-horizontal">
                            <JD:JDashLabeledTextBox Type="multi" Rows="15" runat="server" ID="ctlDashletConfig" meta:resourcekey="ctlDashletConfig" />
                        </div>
                    </div>
                    <div class="tab-pane" id="PaneConfig">
                        <div class="form-horizontal">
                            <JD:JDashLabeledTextBox Type="multi" Rows="15" runat="server" ID="ctlPaneConfig" meta:resourcekey="ctlPaneConfig" />
                        </div>
                    </div>
                    <div class="tab-pane" id="Metadata">
                        <div class="form-horizontal">
                            <JD:JDashLabeledTextBox Type="multi" Rows="15" runat="server" ID="ctlMetadata" meta:resourcekey="ctlMetadata" />
                        </div>
                    </div>
                    <div class="tab-pane" id="Authentication">
                        <div class="form-horizontal">
                            <JD:AuthenticationEditor runat="server" ID="ctlAuthenticationEditor" />

                        </div>
                    </div>
                </div>

            </div>
            <script type="text/javascript">

                function toggleSelection(show, target) {
                    if (show)
                        $('#' + target).show();
                    else
                        $('#' + target).hide();
                }
                function activateTab() {
                    $('#ctlTabs a[href="#' + $('#ctlActiveTab').val() + '"]').tab('show');
                }

                function logTab(tab) {
                    $('#ctlActiveTab').val($("#" + tab.id + " a:first")[0].href.substring($("#" + tab.id + " a:first")[0].href.indexOf('#') + 1));
                }

            </script>
            <div class="modal-footer">
                <jdashUi:JDashButton ID="ctlCancelButton" data-dismiss="modal" runat="server" CausesValidation="false" OnClick="ctlCancelButton_Click" ButtonType="basic" ButtonSize="small" meta:resourcekey="ctlCancelButton" />
                <jdashUi:JDashButton ID="ctlSubmitButton"  runat="server" ButtonType="primary" ButtonSize="small" meta:resourcekey="ctlSubmitButton" OnClick="ctlSubmitButton_Click" />
                
            </div>
        </div>
    </div>
</div>


