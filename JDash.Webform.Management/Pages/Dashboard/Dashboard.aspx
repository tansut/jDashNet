<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Management.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="JDash.Webform.Management.Pages.Dashboard.Dashboard" %>

<%@ Register Src="~/Controls/Dashboard/DashboardEditor.ascx" TagPrefix="uc1" TagName="DashboardEditor" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../Scripts/jquery-1.9.1.min.js"></script>
    <script src="../../Scripts/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:UpdatePanel runat="server" ID="ctlListerUpdatePanel">
            <ContentTemplate> 
                <div style="width:80px;">  
                           
                <jdashUi:JDashButton  CssClass="btn btn-primary form-control"  ID="ctlNewButton"  OnClick="ctlNewButton_Click" CausesValidation="false" runat="server" ButtonType="basic" ButtonSize="small" CommandName="Edit" FullWidth="False" meta:resourcekey="ctlNewButton" />
                </div>
                    <br /><br />
                <asp:Repeater ID="ctlDashboardRepeater" OnItemCommand="ctlDashboardRepeater_ItemCommand" runat="server">
                    <HeaderTemplate>
                        <table class="table table-striped table-fullwidth" id="searchResultTable">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td runat="server" id="ctlTitle"><%# ((JDash.Models.DashboardModel)Container.DataItem).title %></td>
                            <td style="width: 60px;">
                                <jdashUi:JDashButton  ID="JDashButton1"  runat="server" ButtonType="basic" ButtonSize="small" CausesValidation="false" CommandName="Edit"  FullWidth="True" CommandArgument='<%# ((JDash.Models.DashboardModel)Container.DataItem).id %>' meta:resourcekey="ctlEditButton" /></td>
                            <td style="width: 60px;">
                                <jdashUi:JDashButton ID="JDashButton2" runat="server" ButtonType="danger" ButtonSize="small" CausesValidation="false" CommandName="Remove" FullWidth="True" CommandArgument='<%# ((JDash.Models.DashboardModel)Container.DataItem).id %>' meta:resourcekey="ctlRemoveButton" /></td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>  
                    </FooterTemplate>
                </asp:Repeater>
                <hr />
                                
                
                <uc1:DashboardEditor runat="server"  Id="ctlDashboarEditorModal" />
                <asp:UpdateProgress ID="updProgress"
                    AssociatedUpdatePanelID="ctlListerUpdatePanel"
                    runat="server">
                    <ProgressTemplate>
                        <img class="updateProgress"  src="/Content/images/WorkInProgress.gif" />
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
