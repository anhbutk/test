<%@ Page Language="C#" MasterPageFile="~/Administration/main.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.Administration.Administration_ForumTopicList" CodeBehind="ForumTopicList.aspx.cs" %>

<%@ Register TagPrefix="nopCommerce" TagName="ForumTopicList" Src="Modules/ForumTopicList.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="server">
    <nopCommerce:ForumTopicList runat="server" ID="ctrlForumTopicList" />
</asp:Content>