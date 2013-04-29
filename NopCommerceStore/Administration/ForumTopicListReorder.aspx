<%@ Page Language="C#" MasterPageFile="~/Administration/main.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.Administration.Administration_ForumTopicListReorder" CodeBehind="ForumTopicListReorder.aspx.cs" %>

<%@ Register TagPrefix="nopCommerce" TagName="ForumTopicListReorder" Src="Modules/ForumTopicListReorder.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="server">
    <nopCommerce:ForumTopicListReorder runat="server" ID="ctrlForumTopicListReorder" />
</asp:Content>