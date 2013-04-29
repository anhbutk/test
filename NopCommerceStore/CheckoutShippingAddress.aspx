<%@ Page Language="C#" MasterPageFile="~/MasterPages/OneColumnPhanNu.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.CheckoutShippingAddressPage" CodeBehind="CheckoutShippingAddress.aspx.cs" %>

<%@ Register TagPrefix="nopCommerce" TagName="OrderProgress" Src="~/Modules/OrderProgress.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="CheckoutShippingAddress" Src="~/Modules/CheckoutShippingAddress.ascx" %>
<asp:Content ID="Content3" ContentPlaceHolderID="cphtitle" runat="Server">   
    <div id="page_diachigiaohang"></div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server">    
    <nopCommerce:CheckoutShippingAddress ID="ctrlCheckoutShippingAddress" runat="server" />
</asp:Content>
