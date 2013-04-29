<%@ Page Language="C#" MasterPageFile="~/MasterPages/TwoColumnPhanNu.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.PasswordRecoveryPage" Codebehind="PasswordRecovery.aspx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="PasswordRecovery" Src="~/Modules/CustomerPasswordRecovery.ascx" %>
<asp:Content ID="Content3" ContentPlaceHolderID="cphtitle" runat="Server">   
    <div id="page_quenmatkhau"></div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server">    
    <nopCommerce:PasswordRecovery ID="ctrlPasswordRecovery" runat="server" />
</asp:Content>
