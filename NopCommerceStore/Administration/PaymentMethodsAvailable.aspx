<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Administration/main.master"
    Inherits="NopSolutions.NopCommerce.Web.Administration.Administration_PaymentMethodsAvailable"
    CodeBehind="PaymentMethodsAvailable.aspx.cs" %>

<%@ Register TagPrefix="nopCommerce" TagName="PaymentMethodsAvailable" Src="Modules/PaymentMethodsAvailable.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="server">
    <nopCommerce:PaymentMethodsAvailable runat="server" ID="ctrlPaymentMethodsAvailable" />
</asp:Content>
