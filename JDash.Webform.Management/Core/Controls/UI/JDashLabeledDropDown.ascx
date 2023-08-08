<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="JDashLabeledDropDown.ascx.cs" Inherits="JDash.Webform.Management.Core.Controls.UI.JDashLabeledDropDown" %>
<div id="<%=ContainerID%>" class="control-group" style="display:<%=!Hide?"block":"none"%>">
    <%--<label class="control-label" for="ctlDescription">--%>
        <asp:Literal runat="server" ID="ctlDescriptionTitle"/><br /><%--</label>--%>
<%--    <div class="controls">--%>
        <jdashUi:JDashDropDown ID="ctlDropDown" CssClass="form-control" runat="server"></jdashUi:JDashDropDown>
    <%--</div>   --%> 
</div>
