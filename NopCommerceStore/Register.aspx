<%@ Page Language="C#" MasterPageFile="~/MasterPages/TwoColumnPhanNu.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.RegisterPage" Codebehind="Register.aspx.cs" %>

<%@ Register TagPrefix="nopCommerce" TagName="CustomerRegister" Src="~/Modules/CustomerRegister.ascx" %>
<asp:Content ID="Content3" ContentPlaceHolderID="cphtitle" runat="Server">   
    <div id="page_dangkytaikhoan"></div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server">
    <nopCommerce:CustomerRegister ID="ctrlCustomerRegister" runat="server" />
</asp:Content>
