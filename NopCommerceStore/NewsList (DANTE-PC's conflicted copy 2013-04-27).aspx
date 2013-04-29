<%@ Page Language="C#" MasterPageFile="~/MasterPages/OneColumnPhanNu.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.NewsListPage" CodeBehind="NewsList.aspx.cs"
    ValidateRequest="false" %>

<%@ Register TagPrefix="nopCommerce" TagName="NewsList" Src="~/Modules/NewsList.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="NewsMenu" Src="~/Modules/NewsMenu.ascx" %>

<asp:Content ID="Content3" ContentPlaceHolderID="cphtitle" runat="Server">
    <div id="page_gioithieu">
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph2" runat="Server">
    <nopCommerce:NewsMenu ID="ctrlNewsMenu" runat="server" />   
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server">
    <nopCommerce:NewsList ID="ctrlNewsList" runat="server" />    
</asp:Content>
