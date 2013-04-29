<%@ Page Language="C#" MasterPageFile="~/MasterPages/OneColumnPhanNu.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.CheckoutBillingAddressPage" CodeBehind="CheckoutBillingAddress.aspx.cs" %>

<%@ Register Src="~/Modules/OrderProgress.ascx" TagName="OrderProgress" TagPrefix="nopCommerce" %>
<%@ Register TagPrefix="nopCommerce" TagName="CheckoutBillingAddress" Src="~/Modules/CheckoutBillingAddress.ascx" %>
<asp:Content ID="Content3" ContentPlaceHolderID="cphtitle" runat="Server">   
    <div id="page_diachithanhtoan"></div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server">    
    <nopCommerce:CheckoutBillingAddress ID="ctrlCheckoutBillingAddress" runat="server" />
</asp:Content>
