<%@ Page Language="C#" MasterPageFile="~/MasterPages/OneColumnPhanNu.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.CheckoutPaymentInfoPage" CodeBehind="CheckoutPaymentInfo.aspx.cs" %>

<%@ Register Src="~/Modules/OrderProgress.ascx" TagName="OrderProgress" TagPrefix="nopCommerce" %>
<%@ Register TagPrefix="nopCommerce" TagName="CheckoutPaymentInfo" Src="~/Modules/CheckoutPaymentInfo.ascx" %>
<asp:Content ID="Content3" ContentPlaceHolderID="cphtitle" runat="Server">   
    <div id="page_thongtinthanhtoan"></div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server">
    
    <nopCommerce:CheckoutPaymentInfo ID="ctrlCheckoutPaymentInfo" runat="server" />
</asp:Content>
