<%@ Page Language="C#" MasterPageFile="~/MasterPages/OneColumnPhanNu.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.ShoppingCartPage" CodeBehind="ShoppingCart.aspx.cs" %>

<%@ Register TagPrefix="nopCommerce" TagName="OrderSummary" Src="~/Modules/OrderSummary.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="OrderProgress" Src="~/Modules/OrderProgress.ascx" %>
<asp:Content ID="Content3" ContentPlaceHolderID="cphtitle" runat="Server">   
    <div id="page_giohang"></div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server">
    <div id="shoppingcart">
        <div class="productname">
            <%=GetLocaleResourceString("Account.ShoppingCart")%>            
        </div>
        <div class="clear">
        &nbsp;
        </div>
        <div class="body">
            <nopCommerce:OrderSummary ID="OrderSummaryControl" runat="server" IsShoppingCart="true">
            </nopCommerce:OrderSummary>
        </div>
    </div>
</asp:Content>
