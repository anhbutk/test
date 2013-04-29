<%@ Page Language="C#" MasterPageFile="~/Administration/main.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.Administration.Administration_ResetSavePoint" CodeBehind="ResetSavePoint.aspx.cs" %>

<%@ Register TagPrefix="nopCommerce" TagName="ResetSavePoint" Src="Modules/ResetSavePoint.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="server">
    <nopCommerce:ResetSavePoint runat="server" ID="ctrlResetSavePoint" />
</asp:Content>