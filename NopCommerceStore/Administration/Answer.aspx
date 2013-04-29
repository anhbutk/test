<%@ Page Language="C#" MasterPageFile="~/Administration/main.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.Administration.Administration_Answer" CodeBehind="Answer.aspx.cs" %>

<%@ Register TagPrefix="nopCommerce" TagName="Answer" Src="Modules/Answer.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="server">
    <nopCommerce:Answer runat="server" ID="ctrlAnswer" />
</asp:Content>