<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AuthenticationEditor.ascx.cs" Inherits="JDash.Webform.Management.Controls.Common.AuthenticationEditor" %>
<%@ Register Src="~/Core/Controls/UI/JDashChekBoxGroup.ascx" TagPrefix="JD" TagName="JDashChekBoxGroup" %>
<%@ Register Src="~/Core/Controls/UI/JDashLabeledTextBox.ascx" TagPrefix="JD" TagName="JDashLabeledTextBox" %>
<%@ Register Src="~/Core/Controls/UI/JDashLabeledDropDown.ascx" TagPrefix="JD" TagName="JDashLabeledDropDown" %>

<JD:JDashLabeledTextBox runat="server" ValidationText="<%$ Resources:Global, requiredField%>" ValidationGroup="Authentication" ID="ctlName" meta:resourcekey="ctlName" />
<JD:JDashLabeledDropDown runat="server" ID="ctlPermision" meta:resourcekey="ctlPermision" />
<JD:JDashLabeledDropDown runat="server" ID="ctlAuthType" meta:resourcekey="ctlAuthType" />
<hr />
<jdashUi:JDashButton ID="ctlSubmitButton" runat="server" ButtonType="basic" ValidationGroup="Authentication" ButtonSize="small" CausesValidation="true" meta:resourcekey="ctlSubmitButton" OnClick="ctlSubmitButton_Click" />
<br />
<br />
<div class="control-group">
    <asp:Repeater ID="ctlAuths" OnItemCommand="ctlAuths_ItemCommand" runat="server">
        <HeaderTemplate>
            <table class="table table-striped table-fullwidth" id="commandsTable">
                
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><%# ((JDash.Webform.Management.Controls.Common.AuthenticationEditorModel)Container.DataItem).name %></td>
                <td><%# ((JDash.Webform.Management.Controls.Common.AuthenticationEditorModel)Container.DataItem).permission %></td>
                <td><%# ((JDash.Webform.Management.Controls.Common.AuthenticationEditorModel)Container.DataItem).authType %></td>
                <td style="width: 60px;">
                    <jdashUi:JDashButton ID="JDashButton2" runat="server" ButtonType="danger" ButtonSize="small" CausesValidation="false" CommandName="Remove" FullWidth="True" CommandArgument='<%# ((JDash.Webform.Management.Controls.Common.AuthenticationEditorModel)Container.DataItem).name%>' meta:resourcekey="ctlRemoveButton" /></td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>  
        </FooterTemplate>
    </asp:Repeater>

</div>

