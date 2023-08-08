<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="tableview.ascx.cs" Inherits="JDash.WebForms.Demo.JDash.Dashlets.DataAnalysis.tableview" %>
<style type="text/css">
    .dataTable
    {
        border: none;
        margin: 0px;
    }
</style>
<asp:Repeater runat="server" ID="dataGrid" OnItemCreated="dataGrid_ItemCreated" OnItemDataBound="dataGrid_ItemDataBound">
    <HeaderTemplate>
        <table class="table dataTable">
            <thead>
                <tr>
                    <th runat="server" id="th1"></th>
                    <th runat="server" id="th2"></th>
                    <th runat="server" id="th3"></th>
                    <th runat="server" id="th4"></th>
                </tr>
            </thead>
            <tbody>
    </HeaderTemplate>
    <FooterTemplate>
        </tbody>
            </table>

    </FooterTemplate>
    <ItemTemplate>
        <tr>
            <td runat="server" id="td1"></td>
            <td runat="server" id="td2"></td>
            <td runat="server" id="td3"></td>
            <td runat="server" id="td4"></td>
        </tr>
    </ItemTemplate>
</asp:Repeater>
