<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.Game1OverControl"
    CodeBehind="Game1Over.ascx.cs" %>
<div id="shoppingcart">
    <h2 class="productname">
        <%=GetLocaleResourceString("Game1Play.Title")%></h2>
    <div class="clear">
    </div>
    <div style="text-align: left; padding-top: 15px">
        <%=GetLocaleResourceString("Game1Over.Body")%>
    </div>
    <div class="clear">
    </div>    
    <div style="text-align: center; padding-top: 15px">
        <asp:Button ID="btnComplete" runat="server" onclick="btnComplete_Click" Text="<% $NopResources:Game1Over.Backtohome %>" />
    </div>
</div>
