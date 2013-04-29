<%@ Page Language="C#" MasterPageFile="~/MasterPages/HomePagePhanNu.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.Default" CodeBehind="Default.aspx.cs" %>

<%@ Register TagPrefix="nopCommerce" TagName="HomePageNewsLeft" Src="~/Modules/HomePageNewsLeft.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="HomePageNewsRight" Src="~/Modules/HomePageNewsRight.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="HomePageProducts" Src="~/Modules/HomePageProducts.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="HomeFlash" Src="~/Modules/HomeFlash.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="HomePageBanner" Src="~/Modules/HomePageBanner.ascx" %>
<asp:Content ID="Content2" ContentPlaceHolderID="left" runat="Server">
    <nopCommerce:HomePageNewsLeft ID="ctrlHomePageNewsLeft" runat="server" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="center" runat="Server">
   <nopCommerce:HomeFlash ID="ctrlHomeFlash" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="right" runat="Server">
    <nopCommerce:HomePageNewsRight ID="ctrlHomePageNewsRight" runat="server" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bottom" runat="Server">
    <nopCommerce:HomePageProducts ID="ctrlHomePageProducts" runat="server" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="bottom2" runat="Server">
    <nopCommerce:HomePageBanner ID="HomePageBanner" runat="server" />
</asp:Content>
