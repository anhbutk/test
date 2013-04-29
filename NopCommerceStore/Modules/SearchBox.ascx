<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.SearchBoxControl"
    CodeBehind="SearchBox.ascx.cs" %>
<ul>
    <li>
        <asp:TextBox ID="txtSearchTerms" runat="server" />&nbsp;
    </li>
    <li>
        <asp:Button runat="server" ID="btnSearch" OnClick="btnSearch_Click" Text="<% $NopResources:Search.SearchButton %>"
            CausesValidation="false" />
    </li>
</ul>
