<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="JDash.WebForms.Demo.JDash.Dashlets.DashboardList.View" %>
<style type="text/css">

    .dashboardsTable 
    {
        border: none;
        margin:0px;
    }
</style>
<asp:Repeater runat="server" ID="dataGrid" OnItemCommand="dataGrid_ItemCommand">
    <HeaderTemplate>
        <table class="table dashboardsTable">
    </HeaderTemplate>
    <FooterTemplate>
            </table>

    </FooterTemplate>
    <ItemTemplate>
        <tr>
            <td>
                <asp:LinkButton ID="LinkButton1" Text='<%# Eval("title") %>' CommandArgument='<%# Eval("id") %>' runat="server" />
            </td>
            
        </tr>

    </ItemTemplate>
</asp:Repeater>
