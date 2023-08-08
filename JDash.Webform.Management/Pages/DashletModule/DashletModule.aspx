<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Management.Master" AutoEventWireup="true" CodeBehind="DashletModule.aspx.cs" Inherits="JDash.Webform.Management.Pages.DashletModule.DashletModule" %>

<%@ Register Src="~/Controls/DashletModule/DashletModuleEditor.ascx" TagPrefix="uc1" TagName="DashletModuleEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../Scripts/jquery-1.9.1.min.js"></script>
    <script src="../../Scripts/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="daslethsContainer">

        <asp:UpdatePanel runat="server" ID="ctlListerUpdatePanel">
            <ContentTemplate>

                <jdashUi:JDashButton ID="ctlNewButton" OnClick="ctlNewButton_Click" runat="server" CausesValidation="false" ButtonType="primary" ButtonSize="small" CommandName="Edit" FullWidth="False" meta:resourcekey="ctlNewButton" />
            
                <asp:Repeater ID="ctlDashletModuleRepeater" OnItemDataBound="ctlDashletModuleRepeater_ItemDataBound" OnItemCommand="ctlDashletModuleRepeater_ItemCommand" runat="server">
                    <HeaderTemplate>
                        <table class="table table-condensed table-striped" id="searchResultTable">
                            <tr>
                                <th>
                                    <asp:Localize ID="ctlName" runat="server" meta:resourcekey="ctlName" /></th>
                                <th>
                                    <asp:Localize ID="ctlPath" runat="server" meta:resourcekey="ctlPath" /></th>
                                <th>
                                    <asp:Localize ID="ctlEditorPath" runat="server" meta:resourcekey="ctlEditorPath" /></th>
                                <th colspan="3"></th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td runat="server" id="ctlTitle"><%# ((JDash.Models.DashletModuleModel)Container.DataItem).title %></td>
                            <td runat="server">
                                <asp:Label ID="ctlUCPath" runat="server"></asp:Label>
                            </td>
                            <td id="Td1" runat="server">
                                <asp:Label ID="ctlEUCPath" runat="server"></asp:Label>
                            </td>
                            <td class="commandButtons">
                                
                                <jdashUi:JDashButton ID="JDashButton1" runat="server" ButtonType="basic" ButtonSize="small" CausesValidation="false" CommandName="Edit" FullWidth="True" CommandArgument='<%# ((JDash.Models.DashletModuleModel)Container.DataItem).id %>' meta:resourcekey="ctlEditButton" />
                            </td>
                            <td class="commandButtons" >
                                <jdashUi:JDashButton ID="JDashButton3" runat="server" ButtonType="basic" ButtonSize="small" CausesValidation="false" CommandName="Clone" FullWidth="True" CommandArgument='<%# ((JDash.Models.DashletModuleModel)Container.DataItem).id %>' meta:resourcekey="ctlCloneButton" />
                            </td>
                            <td class="commandButtons">
                                <jdashUi:JDashButton ID="JDashButton2" runat="server" ButtonType="danger" ButtonSize="small" CausesValidation="false" CommandName="Remove" FullWidth="True" CommandArgument='<%# ((JDash.Models.DashletModuleModel)Container.DataItem).id %>' meta:resourcekey="ctlRemoveButton" /></td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>  
                    </FooterTemplate>
                </asp:Repeater>
                <hr />

                <uc1:DashletModuleEditor runat="server" ID="ctlDashletModuleEditorModal" />
                <asp:UpdateProgress ID="updProgress"
                    AssociatedUpdatePanelID="ctlListerUpdatePanel"
                    runat="server">
                    <ProgressTemplate>
                        <img class="updateProgress" src="/Content/images/WorkInProgress.gif" />
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
