<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Edit.ascx.cs" Inherits="JDash.WebForms.Demo.JDash.Dashlets.PopClient.Edit" %>
<%@ Register Assembly="JDash.WebForms" Namespace="JDash.WebForms" TagPrefix="jdash" %>

<div class="form">
    <div class="item">
        <span><asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:Global, Title%>"></asp:Literal></span>
        <jdash:DashletTitleEditor CssClass="form-control"  ID="ctlTitle" runat="server"></jdash:DashletTitleEditor>
    </div>

    <div class="itemGroup">
        <div class="item">
            <span><asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:Global, Style%>"></asp:Literal></span>
            <jdash:DashletStylesList ID="ctlStyle" runat="server"></jdash:DashletStylesList>
        </div>
        <div class="item">
            <span><asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:Global, CssClass%>"></asp:Literal></span>
            <jdash:DashletCssEditor CssClass="form-control" ID="ctlCss" runat="server"></jdash:DashletCssEditor>
        </div>
    </div>

    <div class="item">
        <span>User name</span>
        <asp:TextBox CssClass="form-control" ID="txtUsername" runat="server"></asp:TextBox>
    </div>

    <div class="item">
        <span>Password</span>
        <asp:TextBox CssClass="form-control" ID="txtPassword" runat="server" TextMode="Password" Width="100%"></asp:TextBox>
    </div>

    <div class="item">
        <span>Pop3 Server</span>
        <asp:TextBox CssClass="form-control" ID="txtServer" runat="server" Width="100%"></asp:TextBox>
    </div>

    <div class="item">
        <span>Port</span>
        <asp:TextBox CssClass="form-control" ID="txtPort" runat="server">110</asp:TextBox>
    </div>

    <div class="item h">
        <span>Use SSL</span>
        <asp:CheckBox ID="ctlSSL" runat="server" />
    </div>
</div>

