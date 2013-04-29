<%@ Page Language="C#" MasterPageFile="~/MasterPages/OneColumnPhanNu.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.NewsListSkinPage" CodeBehind="NewsListSkin.aspx.cs"
    ValidateRequest="false" %>

<%@ Register TagPrefix="nopCommerce" TagName="NewsListSkin" Src="~/Modules/NewsListSkin.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="NewsMenu" Src="~/Modules/NewsMenu.ascx" %>
<asp:Content ID="Content3" ContentPlaceHolderID="cphtitle" runat="Server">
    <div id="page_landadep">
    </div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server">
    <nopCommerce:NewsListSkin ID="ctrlNewsListSkin" runat="server" />    
</asp:Content>
