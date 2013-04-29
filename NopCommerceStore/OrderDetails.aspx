<%@ Page Language="C#" MasterPageFile="~/MasterPages/OneColumnPhanNu.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.OrderDetailsPage" Codebehind="OrderDetails.aspx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="OrderDetails" Src="~/Modules/OrderDetails.ascx" %>
<asp:Content ID="Content3" ContentPlaceHolderID="cphtitle" runat="Server">   
    <div id="page_chitietdonhang"></div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server">
    <nopCommerce:OrderDetails ID="ctrlOrderDetails" runat="server" />
</asp:Content>
