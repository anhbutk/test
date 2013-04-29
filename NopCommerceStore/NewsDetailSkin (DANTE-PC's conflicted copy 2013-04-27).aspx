<%@ Page Language="C#" MasterPageFile="~/MasterPages/OneColumnPhanNu.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.NewsDetailSkinPage" CodeBehind="NewsDetailSkin.aspx.cs"
    ValidateRequest="false" %>

<%@ Register TagPrefix="nopCommerce" TagName="NewsDetail" Src="~/Modules/NewsDetail.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="NewsMenu" Src="~/Modules/NewsMenu.ascx" %>
<asp:Content ID="Content3" ContentPlaceHolderID="cphtitle" runat="Server">
    <div id="page_landadep">
    </div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server">
    <nopCommerce:NewsDetail ID="ctrlNewsDetail" runat="server" />
</asp:Content>
