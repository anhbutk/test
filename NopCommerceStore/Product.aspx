<%@ Page Language="C#" MasterPageFile="~/MasterPages/TwoColumnPhanNu.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.ProductPage" CodeBehind="Product.aspx.cs" %>
<asp:Content ID="Content3" ContentPlaceHolderID="cphtitle" runat="Server">   
    <div id="page_sanpham"></div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server">
    <asp:PlaceHolder runat="server" ID="ProductPlaceHolder"></asp:PlaceHolder>
</asp:Content>
