<%@ Page Language="C#" MasterPageFile="~/MasterPages/OneColumnPhanNu.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.NewsDetailSkinPage" CodeBehind="NewsDetailSkin.aspx.cs"
    ValidateRequest="false" %>
<%@ Register TagPrefix="nopCommerce" TagName="BannerList" Src="~/Modules/BannerList.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="NewsDetailSkin" Src="~/Modules/NewsDetailSkin.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="NewsMenuSkin" Src="~/Modules/NewsMenuSkin.ascx" %>
<asp:Content ID="Content3" ContentPlaceHolderID="cphtitle" runat="Server">
    <div id="page_landadep">
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph2" runat="Server">
    <nopCommerce:NewsMenuSkin ID="NewsMenuSkin1" runat="server"/> 
     <nopCommerce:BannerList ID="ctrlBannerList1" runat="server" /> 
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server">
    <nopCommerce:NewsDetailSkin ID="ctrlNewsDetailSkin" runat="server" />
</asp:Content>
