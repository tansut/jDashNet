<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DashletCommandEditor.ascx.cs" Inherits="JDash.Webform.Management.Controls.DashletModule.DashletCommandEditor" %>
<%@ Register Src="~/Core/Controls/UI/JDashChekBoxGroup.ascx" TagPrefix="JD" TagName="JDashChekBoxGroup" %>
<%@ Register Src="~/Core/Controls/UI/JDashLabeledTextBox.ascx" TagPrefix="JD" TagName="JDashLabeledTextBox" %>
<%@ Register Src="~/Core/Controls/UI/JDashLabeledDropDown.ascx" TagPrefix="JD" TagName="JDashLabeledDropDown" %>



<div id="CommandEditorModal" runat="server" class="commandEditor" >
    <div class="modal-header">
        <h3 id="modalHeader">
            <asp:Localize ID="Localize1" runat="server" meta:resourcekey="modalHeader" /></h3>
    </div>
    <div class="modal-body">        
        <JD:JDashLabeledTextBox runat="server" ValidationText="<%$ Resources:Global, requiredField%>"  ValidationGroup="DashletCommand" ID="ctlName" meta:resourcekey="ctlName"  />
        <JD:JDashLabeledTextBox runat="server"   ID="ctlLabel" meta:resourcekey="ctlLabel"  />
        <JD:JDashLabeledTextBox runat="server" AutoComplateData="[&quot;d-icon-plus&quot;, &quot;d-icon-minus&quot;, &quot;d-icon-delete&quot;, &quot;d-icon-arrow-r&quot;, &quot;d-icon-arrow-l&quot;, &quot;d-icon-arrow-u&quot;, &quot;d-icon-arrow-d&quot;, &quot;d-icon-check&quot;, &quot;d-icon-gear&quot;, &quot;d-icon-refresh&quot;, &quot;d-icon-forward&quot;, &quot;d-icon-back&quot;, &quot;d-icon-grid&quot;, &quot;d-icon-star&quot;, &quot;d-icon-alert&quot;, &quot;d-icon-info&quot;, &quot;d-icon-home&quot;, &quot;d-icon-search&quot;,  &quot;d-icon-checkbox-off&quot;, &quot;d-icon-checkbox-on&quot;, &quot;d-icon-radio-off&quot;, &quot;d-icon-radio-on&quot;, &quot;d-icon-email&quot;, &quot;d-icon-page&quot;, &quot;d-icon-question&quot;, &quot;d-icon-foursquare&quot;, &quot;d-icon-twitter&quot;, &quot;d-icon-facebook&quot;, &quot;d-icon-dollar&quot;, &quot;d-icon-euro&quot;, &quot;d-icon-pound&quot;, &quot;d-icon-apple&quot;, &quot;d-icon-chat&quot;, &quot;d-icon-trash&quot;, &quot;d-icon-bell&quot;, &quot;d-icon-mappin&quot;, &quot;d-icon-direction&quot;, &quot;d-icon-heart&quot;, &quot;d-icon-wrench&quot;, &quot;d-icon-play&quot;, &quot;d-icon-pause&quot;, &quot;d-icon-stop&quot;, &quot;d-icon-person&quot;, &quot;d-icon-music&quot;, &quot;d-icon-rss&quot;, &quot;d-icon-wifi&quot;, &quot;d-icon-phone&quot;, &quot;d-icon-power&quot;, &quot;d-icon-lock&quot;, &quot;d-icon-flag&quot;, &quot;d-icon-calendar&quot;, &quot;d-icon-lightning&quot;, &quot;d-icon-drink&quot;, &quot;d-icon-android&quot;, &quot;d-icon-edit&quot;]" AutoComplateItemSize="10"  ID="ctlCssClass" meta:resourcekey="ctlCssClass"  />        
        <JD:JDashLabeledTextBox runat="server" ID="ctlTitle" meta:resourcekey="ctlTitle"  />
        <JD:JDashChekBoxGroup runat="server" ClientCheck="toggleSelection(this.checked,'ctlConfirmMessage');" ID="ctlConfirm" meta:resourcekey="ctlConfirm" Checked="false" />
        <JD:JDashLabeledTextBox runat="server" ID="ctlConfirmMessage" Hide="true" ContainerID="ctlConfirmMessage"  meta:resourcekey="ctlConfirmMessage"  />                
        <JD:JDashLabeledDropDown runat="server" ID="ctlType"  meta:resourcekey="ctlType"   />
        <JD:JDashChekBoxGroup runat="server" ID="ctlNotifyOnCommand" meta:resourcekey="ctlNotifyOnCommand" Checked="false" />
    </div>
    <div class="modal-footer">
        <jdashUi:JDashButton ID="ctlCancelButton" OnClick="ctlCancelButton_Click" data-dismiss="modal" runat="server" CausesValidation="false" ButtonType="basic" ButtonSize="small" meta:resourcekey="ctlCancelButton" />
        <jdashUi:JDashButton ID="ctlSubmitButton"  runat="server" ButtonType="primary" ValidationGroup="DashletCommand"  ButtonSize="small" CausesValidation="true" meta:resourcekey="ctlSubmitButton" OnClick="ctlSubmitButton_Click" />
        
    </div>
    <script type="text/javascript">
            function toggleSelection(show, target) {
            if (show)
                $('#' + target).show();
            else
                $('#' + target).hide();
            }
        </script>
</div>
