<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TagEditor.ascx.cs" Inherits="JDash.Webform.Management.Controls.Common.TagEditor" %>
<%@ Register Src="~/Controls/Common/TagItemEditor.ascx" TagPrefix="uc1" TagName="TagItemEditor" %>

<uc1:TagItemEditor runat="server" id="TagItemEditor" />
<asp:UpdatePanel runat="server" ID="basePanel">
        <ContentTemplate>
            <asp:Repeater ID="ctlTagRepeater" runat="server" OnItemCommand="ctlTagRepeater_ItemCommand" >
                <HeaderTemplate>
                    <table class="table table-striped table-fullwidth" id="searchResultTable">
                        <tr>
                            <th>
                                <asp:Localize runat="server" ID="ctlTableTagColumn" meta:resourcekey="ctlTableTagColumn" /></th>
                            <th></th>
                            <th></th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Container.DataItem %></td>
                        <td style="width: 60px;">
                            <jdashUi:JDashButton runat="server" ButtonType="primary" ButtonSize="small" CommandName="Edit" FullWidth="True" CommandArgument='<%# Container.DataItem %>' meta:resourcekey="ctlEditButton"  /></td>
                        <td style="width: 60px;">
                            <jdashUi:JDashButton runat="server" ButtonType="danger" ButtonSize="small" CommandName="Remove" FullWidth="True" CommandArgument='<%# Container.DataItem %>' meta:resourcekey="ctlRemoveButton" /></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>  
                </FooterTemplate>
            </asp:Repeater>
            <asp:UpdateProgress ID="updProgress"
                AssociatedUpdatePanelID="basePanel"
                runat="server">
                <ProgressTemplate>                    
                    <img class="updateProgress" src="/Content/images/WorkInProgress.gif" />
                </ProgressTemplate>
            </asp:UpdateProgress>
            <jdashUi:JDashButton ID="ctlAddTagButton" runat="server" ButtonType="success" ButtonSize="small" OnClick="ctlAddTagButton_Click" meta:resourcekey="ctlAddTagButton" /></td>
        </ContentTemplate>
    </asp:UpdatePanel>