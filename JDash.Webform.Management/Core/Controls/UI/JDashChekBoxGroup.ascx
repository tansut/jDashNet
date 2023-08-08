<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="JDashChekBoxGroup.ascx.cs" Inherits="JDash.Webform.Management.Core.Controls.UI.JDashChekBoxGroup" %>
<div id="<%=ContainerID%>" class="control-group" style="display:<%=!Hide?"block":"none"%>">
<div class="checkbox">
          <label>
             <asp:CheckBox  ID="ctlCheckbox" Checked="true"  runat="server" />
              <asp:Literal runat="server" ID="ctlTitle"  />
          </label>
        </div>
</div>
