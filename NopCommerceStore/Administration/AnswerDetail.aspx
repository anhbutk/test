<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" MasterPageFile="~/Administration/main.master"
    Inherits="NopSolutions.NopCommerce.Web.Administration.Administration_AnswerDetail"
    CodeBehind="AnswerDetail.aspx.cs" %>

<%@ Register TagPrefix="nopCommerce" TagName="AnswerDetail" Src="Modules/AnswerDetail.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="server">
    <nopCommerce:AnswerDetail runat="server" ID="ctrlAnswerDetail" />
</asp:Content>
