<%@ Page Language="C#" MasterPageFile="~/MasterPages/TwoColumnPhanNu.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.LoginPage" Title="Login" Codebehind="Login.aspx.cs" %>

<%@ Register TagPrefix="nopCommerce" TagName="CustomerLogin" Src="~/Modules/CustomerLogin.ascx" %>
<asp:Content ID="Content3" ContentPlaceHolderID="cphtitle" runat="Server">   
    <div id="page_dangnhap"></div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server">
    <nopCommerce:CustomerLogin ID="ctrlCustomerLogin" runat="server" TopicName="LoginInstruction" />
</asp:Content>
