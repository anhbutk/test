<%@ Page Language="C#" MasterPageFile="~/Administration/main.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.Administration.Administration_ForumTopicAdd"
    CodeBehind="ForumTopicAdd.aspx.cs" %>

<%@ Register TagPrefix="nopCommerce" TagName="ForumTopicAddControl" Src="Modules/ForumTopicAdd.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="server">
    <nopCommerce:ForumTopicAddControl runat="server" ID="ctrlForumTopicAdd" />
</asp:Content>