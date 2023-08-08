<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="JDash.WebForms.Demo.JDash.Dashlets.PopClient.View" %>
<style type="text/css">
        .popClient .d-dashlet-content 
    {
        padding: 0px;
       
    }

    
</style>

<asp:Label ID="Label1" runat="server"></asp:Label>
<asp:Timer ID="waitTimer" runat="server" Interval="1" OnTick="waitTimer_Tick" Enabled="false">
</asp:Timer>
<asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="1">
    <asp:View ID="loadingview" runat="server">
        <jdash:BusyImage runat="server" />
    </asp:View>
    <asp:View ID="loadedview" runat="server">
        <asp:Repeater ID="ctlRep" runat="server" OnItemDataBound="ctlRep_ItemDataBound">

            <HeaderTemplate>
                <table class="table">
                    <thead>
                        <tr>
                            <th>From</th>
                            <th>Subject</th>
                            <th>Date</th>
                            <th>Attach</th>
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
                    
                        <td>
                            <asp:Literal Mode="PassThrough" runat="server" ID="ctlFrom" Text='<%# Eval("From") %>'></asp:Literal>
                        </td>
                        <td>
                            <asp:Literal Mode="PassThrough" runat="server" ID="ctlSubject" Text='<%# Eval("Subject") %>'></asp:Literal>
                        </td>
                        <td>
                            <asp:Literal Mode="PassThrough" runat="server" ID="ctlDate" Text='<%# DataBinder.Eval(Container.DataItem, "Date","{0:d}") %>'></asp:Literal>
                        </td>
                        <td>
                            <asp:Image ID="ctlAttach" runat="server" ImageUrl="Resource/attach.jpg" />
                        </td>
                    </tr>

      

            </ItemTemplate>

        </asp:Repeater>
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
    </asp:View>
</asp:MultiView>
