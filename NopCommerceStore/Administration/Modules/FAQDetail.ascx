<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Administration.Modules.FAQDetailControl"
    CodeBehind="FAQDetail.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="FAQInfo" Src="FAQInfo.ascx" %>
<div class="section-header">
    <div class="title">
        <img src="Common/ico-content.png" alt="<%=GetLocaleResourceString("Admin.NewsAdd.Title")%>" />
        <%=GetLocaleResourceString("Admin.NewsAdd.Title")%>
        <a href="FAQ.aspx" title="<%=GetLocaleResourceString("Admin.NewsAdd.BackToNews")%>">
            (<%=GetLocaleResourceString("Admin.NewsAdd.BackToNews")%>)</a>
    </div>
    <div class="options">
        <asp:Button ID="SaveButton" runat="server" Text="<% $NopResources:Admin.NewsAdd.SaveButton.Text %>"
            CssClass="adminButtonBlue" OnClick="SaveButton_Click" ToolTip="<% $NopResources:Admin.NewsAdd.SaveButton.Tooltip %>" />
        <asp:Button ID="DeleteButton" runat="server" CssClass="adminButtonBlue" Text="<% $NopResources:Admin.BlogPostDetails.DeleteButton.Text %>"
            OnClick="DeleteButton_Click" CausesValidation="false" ToolTip="<% $NopResources:Admin.BlogPostDetails.DeleteButton.Tooltip %>" />
    </div>
</div>
<nopCommerce:FAQInfo ID="ctrlFAQInfo" runat="server" />
