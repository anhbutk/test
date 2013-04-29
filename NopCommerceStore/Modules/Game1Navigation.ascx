<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.Game1NavigationControl"
    CodeBehind="Game1Navigation.ascx.cs" %>
<div id="menudoc">
    <ul>
        <li class="unselected">
            <asp:HyperLink ID="lnkGame1Introduction" runat="server"><%=GetLocaleResourceString("Game1Navigation.Introduction")%></asp:HyperLink>
        </li>
        <li class="unselected">
            <asp:HyperLink ID="lnkViewAwardList" runat="server"><%=GetLocaleResourceString("Game1Navigation.ViewAward")%></asp:HyperLink>
        </li>
    </ul>
</div>
