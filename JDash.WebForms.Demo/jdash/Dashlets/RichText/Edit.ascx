﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Edit.ascx.cs" Inherits="JDash.WebForms.Demo.JDash.Dashlets.RichText.Edit" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
 

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

</div>

    		<CKEditor:CKEditorControl ID="ctlCkEditor" runat="server"  Height="200" BasePath="~/JDash/Dashlets/RichText/resources" >
		
		</CKEditor:CKEditorControl>


