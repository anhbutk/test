<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" MasterPageFile="~/Administration/main.master"
    Inherits="NopSolutions.NopCommerce.Web.Administration.Administration_QuestionDetail"
    CodeBehind="QuestionDetail.aspx.cs" %>

<%@ Register TagPrefix="nopCommerce" TagName="QuestionDetail" Src="Modules/QuestionDetail.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="server">
    <nopCommerce:QuestionDetail runat="server" ID="ctrlQuestionDetail" />
</asp:Content>
