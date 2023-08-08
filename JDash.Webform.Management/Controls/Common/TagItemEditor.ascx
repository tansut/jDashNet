<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TagItemEditor.ascx.cs" Inherits="JDash.Webform.Management.Controls.Common.TagItemEditor" %>
<asp:UpdatePanel ID="ctlModalUpdatePanel" runat="server">
    <ContentTemplate>
        <div id="ctlTagEditorModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-header">

                <h3 id="myModalLabel">
                    <asp:Literal runat="server" ID="ctlNewTagTitle" meta:resourcekey="ctlNewTagTitle" /></h3>
            </div>
            <div class="modal-body">
                <div class="form-horizontal">
                    <div class="control-group">
                        <label class="control-label" for="ctlTag">
                            <asp:Literal runat="server" ID="ctlTagTitle" meta:resourcekey="ctlTagTitle" /></label>
                        <div class="controls">
                            <jdashUi:JDashTextBox runat="server" ID="ctlTag"></jdashUi:JDashTextBox>
                        </div>
                    </div>

                </div>

            </div>
            <div class="modal-footer">
                <asp:UpdateProgress ID="updProgress"
                    AssociatedUpdatePanelID="ctlModalUpdatePanel"
                    runat="server">
                    <ProgressTemplate>
                        <img class="updateProgress" src="/Content/images/WorkInProgress.gif" />
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <jdashUi:JDashButton ID="ctlSaveButton" runat="server" ButtonType="primary" ButtonSize="small" OnClick="ctlSaveButton_Click" meta:resourcekey="ctlSaveButton" />
                <jdashUi:JDashButton ID="ctlCloseButton" runat="server" ButtonType="basic" ButtonSize="small" OnClick="ctlCloseButton_Click" meta:resourcekey="ctlCloseButton" />
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
