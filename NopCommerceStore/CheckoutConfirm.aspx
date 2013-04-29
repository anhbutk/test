<%@ Page Language="C#" MasterPageFile="~/MasterPages/OneColumnPhanNu.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.CheckoutConfirmPage" Codebehind="CheckoutConfirm.aspx.cs" %>

<%@ Register Src="~/Modules/OrderProgress.ascx" TagName="OrderProgress" TagPrefix="nopCommerce" %>
<%@ Register TagPrefix="nopCommerce" TagName="CheckoutConfirm" Src="~/Modules/CheckoutConfirm.ascx" %>
<asp:Content ID="Content3" ContentPlaceHolderID="cphtitle" runat="Server">   
    <div id="page_xacnhanmuahang"></div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server">    
    <nopCommerce:CheckoutConfirm ID="ctrlCheckoutConfirm" runat="server" />
</asp:Content>
