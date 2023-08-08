<%@ Page Title="" Language="C#" MasterPageFile="~/Demo.Master" AutoEventWireup="true"
    CodeBehind="demo.aspx.cs"
    Inherits="JDash.WebForms.Demo.DashboardPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageContent" runat="server">
    <jdash:DashboardView runat="server" ID="dashboard" />
</asp:Content>
