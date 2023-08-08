<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="JDash.WebForms.Demo.JDash.Dashlets.Publisher.View" %>
<div class="form">
    <div class="item">
        <span>Type a message</span>
    </div>
    <div class="item">
        <asp:TextBox CssClass="form-control" runat="server" ID="messageText" Text="Sample message"></asp:TextBox>
    </div>
</div>
<asp:Button ID="sendMessage" runat="server" Text="Broadcast Message" OnClick="sendMessage_Click" />
