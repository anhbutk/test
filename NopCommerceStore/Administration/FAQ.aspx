<%@ Page Language="C#" MasterPageFile="~/Administration/main.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.Administration.Administration_FAQ" CodeBehind="FAQ.aspx.cs" %>

<%@ Register TagPrefix="nopCommerce" TagName="FAQ" Src="Modules/FAQ.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="server">
    <nopCommerce:FAQ runat="server" ID="ctrlFAQ" />
</asp:Content>