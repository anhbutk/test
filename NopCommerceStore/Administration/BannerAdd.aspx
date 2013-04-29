<%@ Page Language="C#" MasterPageFile="~/Administration/main.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.Administration.Administration_BannerAdd"
    CodeBehind="BannerAdd.aspx.cs" %>

<%@ Register TagPrefix="nopCommerce" TagName="BannerAddControl" Src="Modules/BannerAdd.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="server">
    <nopCommerce:BannerAddControl runat="server" ID="ctrlBannerAdd" />
</asp:Content>