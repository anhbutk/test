<%@ Page Language="C#" MasterPageFile="~/MasterPages/TwoColumnPhanNu.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.AccountActivationPage" Codebehind="AccountActivation.aspx.cs" %>

<%@ Register TagPrefix="nopCommerce" TagName="AccountActivation" Src="~/Modules/CustomerAccountActivation.ascx" %>
<asp:Content ID="Content3" ContentPlaceHolderID="cphtitle" runat="Server">   
    <div id="page_dangnhap"></div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server">
    <nopCommerce:AccountActivation ID="ctrlAccountActivation" runat="server" />
</asp:Content>
