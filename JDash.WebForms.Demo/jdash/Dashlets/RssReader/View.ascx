<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="JDash.WebForms.Demo.JDash.Dashlets.RssReader.View" %>
<%@ Register Assembly="RssToolkit" Namespace="RssToolkit.Web.WebControls" TagPrefix="cc1" %>
<link href="/jdash/dashlets/rssreader/Resource/rssreader.css" rel="stylesheet" />


<asp:Timer ID="waitTimer" runat="server" Interval="1000" OnTick="Timer1_Tick" Enabled="false">
</asp:Timer>
<asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="1">
    <asp:View ID="loadingview" runat="server">
    </asp:View>
    <asp:View ID="loadedview" runat="server">
        <asp:Repeater ID="ctlRep" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
            <HeaderTemplate>
                <ul class="rssList">
            </HeaderTemplate>
            <FooterTemplate>
                </ul>
            </FooterTemplate>
            <ItemTemplate>
                <li>
                    <asp:HyperLink runat="server" NavigateUrl='<%# Eval("link") %>' Target="_blank"
                        Text='<%# Eval("title") %>'></asp:HyperLink><p>
                            <asp:Literal Mode="PassThrough" runat="server" ID="description"></asp:Literal>
                        </p>
                </li>
            </ItemTemplate>

        </asp:Repeater>
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </asp:View>
</asp:MultiView>