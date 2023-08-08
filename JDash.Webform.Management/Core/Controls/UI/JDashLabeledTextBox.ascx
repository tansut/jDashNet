<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="JDashLabeledTextBox.ascx.cs" Inherits="JDash.Webform.Management.Core.Controls.UI.JDashLabeledTextBox" %>
<div id="<%=ContainerID%>" class="control-group" style="display: <%=!Hide?"block":"none"%>">

    
        <asp:Literal runat="server" ID="ctlDescriptionTitle" /><asp:RequiredFieldValidator ID="validator" Enabled="false" ControlToValidate="ctlDescription" ClientIDMode="AutoID" runat="server" ForeColor="Red"></asp:RequiredFieldValidator><%--</label>--%><br />
    
        <jdashUi:JDashTextBox  CssClass="form-control" runat="server" ClientIDMode="AutoID" data-provide="typeahead"   ID="ctlDescription"></jdashUi:JDashTextBox><br />
        
        <span class="help-block">
            <%=Help%></span>
    
</div>

