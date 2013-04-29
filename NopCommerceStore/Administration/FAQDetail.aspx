<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" MasterPageFile="~/Administration/main.master"
    Inherits="NopSolutions.NopCommerce.Web.Administration.Administration_FAQDetail"
    CodeBehind="FAQDetail.aspx.cs" %>

<%@ Register TagPrefix="nopCommerce" TagName="FAQDetail" Src="Modules/FAQDetail.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="server">
    <nopCommerce:FAQDetail runat="server" ID="ctrlFAQDetail" />
</asp:Content>
