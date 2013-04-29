<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" MasterPageFile="~/Administration/main.master"
    Inherits="NopSolutions.NopCommerce.Web.Administration.Administration_CustomerResultDetail"
    CodeBehind="CustomerResultDetail.aspx.cs" %>

<%@ Register TagPrefix="nopCommerce" TagName="CustomerResultDetail" Src="Modules/CustomerResultDetail.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="server">
    <nopCommerce:CustomerResultDetail runat="server" ID="ctrlCustomerResultDetail" />
</asp:Content>
