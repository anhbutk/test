<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Administration.Modules.CustomerResultDetailControl"
    CodeBehind="CustomerResultDetail.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="CustomerResultInfo" Src="CustomerResultInfo.ascx" %>
<div class="section-header">
    <div class="title">
        <img src="Common/ico-content.png" alt="Question" />
        Customer Result Detail
        <a href="CustomerResult.aspx" title="Back to Customer Result">
            (back to customer result list)</a>
    </div>
    <div class="options">
        <asp:Button ID="SaveButton" runat="server" Text="<% $NopResources:Admin.NewsAdd.SaveButton.Text %>"
            CssClass="adminButtonBlue" OnClick="SaveButton_Click" ToolTip="<% $NopResources:Admin.NewsAdd.SaveButton.Tooltip %>" />
        <asp:Button ID="DeleteButton" runat="server" CssClass="adminButtonBlue" Text="<% $NopResources:Admin.BlogPostDetails.DeleteButton.Text %>"
            OnClick="DeleteButton_Click" CausesValidation="false" ToolTip="<% $NopResources:Admin.BlogPostDetails.DeleteButton.Tooltip %>" />
    </div>
</div>
<nopCommerce:CustomerResultInfo ID="ctrlCustomerResultInfo" runat="server" />
