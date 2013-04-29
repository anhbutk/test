<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.Game1IntroductionControl"
    CodeBehind="Game1Introduction.ascx.cs" %>
<div id="shoppingcart">
    <h2 class="productname">
        <asp:Literal runat="server" ID="lTitle" EnableViewState="false"></asp:Literal></h2>
    <div class="clear">
    </div>
    <div style="text-align: left; padding-top: 15px">
        <asp:Literal runat="server" ID="lBody" EnableViewState="false"></asp:Literal>
    </div>
    <div class="clear">
    </div>
    <div style="padding-top: 15px">
        <asp:CheckBox ID="chkAccept" runat="server" /><br />
        <asp:Label ID="lblAlert" runat="server" Visible="false" style="color:red"></asp:Label>
    </div>
    <div style="padding-top: 15px">
        <asp:Button ID="btnAccept" runat="server" onclick="btnAccept_Click" />
    </div>
</div>
