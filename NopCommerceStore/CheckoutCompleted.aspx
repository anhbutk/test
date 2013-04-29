<%@ Page Language="C#" MasterPageFile="~/MasterPages/OneColumnPhanNu.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.CheckoutCompletedPage" CodeBehind="CheckoutCompleted.aspx.cs" %>

<%@ Register TagPrefix="nopCommerce" TagName="CheckoutCompleted" Src="~/Modules/CheckoutCompleted.ascx" %>
<%@ Register Src="~/Modules/OrderProgress.ascx" TagName="OrderProgress" TagPrefix="nopCommerce" %>
<asp:Content ID="Content3" ContentPlaceHolderID="cphtitle" runat="Server">   
    <div id="page_hoantatmuahang"></div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server">   
    <nopCommerce:CheckoutCompleted ID="ctrlCheckoutCompleted" runat="server" />
</asp:Content>
