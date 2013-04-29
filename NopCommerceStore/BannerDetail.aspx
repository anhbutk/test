<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/OneColumnPhanNu.master"
    Inherits="NopSolutions.NopCommerce.Web.BannerDetailPage" CodeBehind="BannerDetail.aspx.cs" %>

<%@ Register TagPrefix="nopCommerce" TagName="BannerDetail" Src="~/Modules/BannerDetail.ascx" %>

<asp:Content ID="Content3" ContentPlaceHolderID="cphtitle" runat="Server">  
<nopCommerce:BannerDetail ID="ctrlBannerDetail" runat="server" />
                   
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server">
</asp:Content>