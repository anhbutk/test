<%@ Page Language="C#" MasterPageFile="~/MasterPages/TwoColumnPhanNuGame.master"
    AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Game1PlayPage"
    CodeBehind="Game1Play.aspx.cs" %>

<%@ Register TagPrefix="nopCommerce" TagName="Game1Play" Src="~/Modules/Game1Play.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="LeftInfo" Src="~/Modules/LeftInfo.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="Game1Navigation" Src="~/Modules/Game1Navigation.ascx" %>
<asp:Content ID="Content3" ContentPlaceHolderID="cphtitle" runat="Server">
    <div id="page_thusuc">
    </div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server">
    <nopCommerce:Game1Play ID="ctrlGame1Play" runat="server"></nopCommerce:Game1Play>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph2" runat="Server">
    <nopCommerce:Game1Navigation ID="Game1Navigation1" runat="server"></nopCommerce:Game1Navigation>
    <nopCommerce:LeftInfo ID="LeftInfo1" runat="server" />
</asp:Content>
