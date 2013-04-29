<%@ Page Language="C#" MasterPageFile="~/Administration/main.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.Administration.Administration_BannerList" CodeBehind="BannerList.aspx.cs" %>

<%@ Register TagPrefix="nopCommerce" TagName="BannerList" Src="Modules/BannerList.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="server">
    <nopCommerce:BannerList runat="server" ID="ctrlBannerList" />
</asp:Content>