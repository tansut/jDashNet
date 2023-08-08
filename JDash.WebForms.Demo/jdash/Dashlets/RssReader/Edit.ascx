﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Edit.ascx.cs" Inherits="JDash.WebForms.Demo.JDash.Dashlets.RssReader.Edit" %>
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
            <jdash:DashletCssEditor  CssClass="form-control" ID="ctlCss" runat="server"></jdash:DashletCssEditor>
        </div>
    </div>
    <div class="item">
        <span>Rss Url</span>
        <asp:TextBox CssClass="form-control" ID="ctlRss" runat="server"></asp:TextBox>
    </div>

    <div class="item h">
        <span>Limit feeds</span>
        <asp:TextBox CssClass="form-control" ID="ctlInterval" runat="server" Width="43px">10</asp:TextBox>
    </div>

    <div class="item h">
        <span>Detailed View</span>
        <asp:CheckBox ID="ctlDesc" runat="server" />
    </div>
</div>


