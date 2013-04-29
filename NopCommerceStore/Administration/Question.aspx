<%@ Page Language="C#" MasterPageFile="~/Administration/main.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.Administration.Administration_Question" CodeBehind="Question.aspx.cs" %>

<%@ Register TagPrefix="nopCommerce" TagName="Question" Src="Modules/Question.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="server">
    <nopCommerce:Question runat="server" ID="ctrlQuestion" />
</asp:Content>