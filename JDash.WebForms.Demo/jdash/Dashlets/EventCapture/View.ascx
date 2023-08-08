<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="JDash.WebForms.Demo.JDash.Dashlets.EventCapture.View" %>
<style type="text/css">

        .eventsTable 
    {
        border: none;
        margin:0px;
    }
</style>
<asp:Repeater runat="server" ID="eventGrid">
    <HeaderTemplate>
        <table class="table  eventsTable">
            <thead>
                <tr>
                    <th>Time</th>
                    <th>Event Name</th>
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
            <td><%#Eval("EventTime") %></td>
            <td><%#Eval("EventName") %></td>
        </tr>

    </ItemTemplate>
</asp:Repeater>
