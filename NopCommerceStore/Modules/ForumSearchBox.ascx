<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.ForumSearchBoxControl"
    CodeBehind="ForumSearchBox.ascx.cs" %>
<div class="forumsearchbox">
    <asp:TextBox ID="txtSearchTerms" runat="server"  />&nbsp;
    <asp:Button runat="server" ID="btnSearch" OnClick="btnSearch_Click" Text="<% $NopResources:Forum.SearchButton %>"
       />
</div>
