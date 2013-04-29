<%@ Page Language="C#" MasterPageFile="~/MasterPages/TwoColumnPhanNu.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.CommentPage" Codebehind="Comment.aspx.cs" ValidateRequest="false" %>

<%@ Register TagPrefix="nopCommerce" TagName="Comment" Src="~/Modules/Comment.ascx" %>
<asp:Content ID="Content3" ContentPlaceHolderID="cphtitle" runat="Server">   
    <div id="page_gopy"></div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server">
    <nopCommerce:Comment ID="ctrlComment" runat="server" />
</asp:Content>
