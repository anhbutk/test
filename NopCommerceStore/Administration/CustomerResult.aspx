<%@ Page Language="C#" MasterPageFile="~/Administration/main.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.Administration.Administration_CustomerResult" CodeBehind="CustomerResult.aspx.cs" %>

<%@ Register TagPrefix="nopCommerce" TagName="CustomerResult" Src="Modules/CustomerResult.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="server">
    <nopCommerce:CustomerResult runat="server" ID="ctrlCustomerResult" />
</asp:Content>