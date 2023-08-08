<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MetadataEditor.ascx.cs" Inherits="JDash.Webform.Management.Controls.Common.MetadataEditor" %>
<%@ Register Src="~/Controls/Common/TagEditor.ascx" TagPrefix="uc1" TagName="TagEditor" %>

<div class="form-horizontal">
    <div class="control-group">
        <label class="control-label" for="ctlDescription">
            <asp:Literal runat="server" ID="ctlDescriptionTitle" meta:resourcekey="ctlDescriptionTitle" /></label>
        <div class="controls">
            <jdashUi:JDashTextBox runat="server" ID="ctlDescription" meta:resourcekey="ctlDescriptionInfo"></jdashUi:JDashTextBox>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="ctlWorkspaceName">
            <asp:Literal runat="server" ID="Literal1" meta:resourcekey="ctlGroupTitle" /></label>
        <div class="controls">
            <jdashUi:JDashTextBox runat="server" ID="ctlGroup" ></jdashUi:JDashTextBox>
        </div>
    </div>
</div>
<uc1:TagEditor runat="server" id="TagEditor" />

