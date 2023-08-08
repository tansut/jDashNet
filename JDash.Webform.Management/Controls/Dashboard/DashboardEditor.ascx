<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DashboardEditor.ascx.cs" Inherits="JDash.Webform.Management.Controls.Dashboard.DashboardEditor" %>
<%@ Register Src="~/Core/Controls/UI/JDashLabeledTextBox.ascx" TagPrefix="JD" TagName="JDashLabeledTextBox" %>
<%@ Register Src="~/Core/Controls/UI/JDashLabeledDropDown.ascx" TagPrefix="JD" TagName="JDashLabeledDropDown" %>
<%@ Register Src="~/Controls/Common/AuthenticationEditor.ascx" TagPrefix="JD" TagName="AuthenticationEditor" %>

<div id="dashboarEditorModal" runat="server" class="modal" tabindex="-1" role="dialog" aria-labelledby="modalHeader" aria-hidden="true">
    <div class="modal-header">
        <h3 id="modalHeader">
            <asp:Localize ID="Localize1" runat="server" meta:resourcekey="modalHeader" /></h3>
    </div>
    <div class="modal-body">
        <ul class="nav nav-tabs" id="Tabs">
            <li  onclick="logdashboardEditorTab(this)" id="t1" class="active"><a href="#General" data-toggle="tab">
                <asp:Localize runat="server" meta:resourcekey="tabGeneral" /></a></li>
            <li  onclick="logdashboardEditorTab(this)" id="t2" ><a href="#Metadata" data-toggle="tab">
                <asp:Localize runat="server" meta:resourcekey="tabMetadata" /></a></li>
            <li  onclick="logdashboardEditorTab(this)" id="t3" ><a href="#Layout" data-toggle="tab">
                <asp:Localize ID="Localize2" runat="server" meta:resourcekey="tabLayout" /></a></li>
            <li  onclick="logdashboardEditorTab(this)" id="t4" ><a href="#PaneConfig" data-toggle="tab">
                <asp:Localize ID="Localize4" runat="server" meta:resourcekey="tabPaneConfig" /></a></li>
            <li  onclick="logdashboardEditorTab(this)" id="t5" ><a href="#Config" data-toggle="tab">
                <asp:Localize ID="Localize3" runat="server" meta:resourcekey="tabConfig" /></a></li>
            <li  onclick="logdashboardEditorTab(this)" id="t6" ><a href="#Authentication" data-toggle="tab">
                <asp:Localize ID="ctlAuthentication" runat="server" meta:resourcekey="tabAuthentication" /></a></li>
        </ul>
        <asp:HiddenField ClientIDMode="Static" runat="server" ID="ctlDashboardEditorActiveTab" />
        <div class="tab-content">
            <div class="tab-pane active" id="General">
                <div class="form-horizontal">
                    <JD:JDashLabeledTextBox runat="server" ValidationText="<%$ Resources:Global, requiredField%>" ID="ctlTitle" meta:resourcekey="ctlTitle" />
                    <JD:JDashLabeledTextBox runat="server" ID="ctlDescription" meta:resourcekey="ctlDescrition" />
                    <JD:JDashLabeledDropDown runat="server" ID="ctlType" meta:resourcekey="ctlDashboardType" />

                </div>
            </div>
            <div class="tab-pane" id="Metadata">
                <div class="form-horizontal">
                    <JD:JDashLabeledTextBox Type="multi" Rows="15" runat="server" ID="ctlMetadata" meta:resourcekey="ctlMetadata" />
                </div>
            </div>
            <div class="tab-pane" id="Layout">
                <div class="form-horizontal">
                    <JD:JDashLabeledTextBox Type="multi" Rows="15" runat="server" ID="ctlLayout" meta:resourcekey="ctlLayout" />
                </div>
            </div>
            <div class="tab-pane" id="PaneConfig">
                <div class="form-horizontal">
                    <JD:JDashLabeledTextBox Type="multi" Rows="15" runat="server" ID="ctlPaneConfig" meta:resourcekey="ctlPaneConfig" />
                </div>
            </div>
            <div class="tab-pane" id="Config">
                <div class="form-horizontal">
                    <JD:JDashLabeledTextBox Type="multi" Rows="15" runat="server" ID="ctlConfig" meta:resourcekey="ctlConfig" />
                </div>
            </div>
            <div class="tab-pane" id="Authentication">
                <div class="form-horizontal">
                    <JD:AuthenticationEditor runat="server" id="ctlAuthenticationEditor" />
                  
                </div>
            </div>
        </div>
    </div>
    <div class="modal-footer">
         <jdashUi:JDashButton ID="ctlCancelButton" data-dismiss="modal" runat="server" OnClick="ctlCancelButton_Click" CausesValidation="false" ButtonType="basic" ButtonSize="small" meta:resourcekey="ctlCancelButton" />
        <jdashUi:JDashButton ID="ctlSubmitButton" runat="server" ButtonType="basic" CssClass="form-control"  meta:resourcekey="ctlSubmitButton" OnClick="ctlSubmitButton_Click" />
    </div>

    <script type="text/javascript" >
        function activateDashboardEditorTab() {
            $('#Tabs a[href="#' + $('#ctlDashboardEditorActiveTab').val() + '"]').tab('show');
        }

        function logdashboardEditorTab(tab) {
            $('#ctlDashboardEditorActiveTab').val($("#" + tab.id + " a:first")[0].href.substring($("#" + tab.id + " a:first")[0].href.indexOf('#') + 1));
        }
    </script>
</div>
