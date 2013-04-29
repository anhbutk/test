<%@ Page Language="C#" MasterPageFile="~/Administration/main.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.Administration.Administration_QuestionInMonth" CodeBehind="QuestionInMonth.aspx.cs" %>

<%@ Register TagPrefix="nopCommerce" TagName="QuestionInMonth" Src="Modules/QuestionInMonthDetail.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="server">
    <nopCommerce:QuestionInMonth runat="server" ID="ctrlQuestionInMonth" />
</asp:Content>