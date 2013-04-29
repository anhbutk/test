<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Administration.Modules.BannerAddControl"
    CodeBehind="BannerAdd.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="BannerInfo" Src="BannerInfo.ascx" %>
<div class="section-header">
    <div class="title">
        <img src="Common/ico-content.png" alt="<%=GetLocaleResourceString("Admin.ForumAdd.Title")%>" />
        Add a new banner <a href="BannerList.aspx" title="back to news list">(back to banner
            list)</a>
    </div>
    <div class="options">
        <asp:Button ID="AddButton" runat="server" Text="<% $NopResources:Admin.ForumAdd.AddButton.Text %>"
            CssClass="adminButtonBlue" OnClick="AddButton_Click" ToolTip="<% $NopResources:Admin.ForumAdd.AddButton.Tooltip %>" />
        <asp:Button ID="DeleteButton" runat="server" CssClass="adminButtonBlue" Text="<% $NopResources:Admin.TopicDetails.DeleteButton.Text %>"
            OnClick="DeleteButton_Click" CausesValidation="false" ToolTip="<% $NopResources:Admin.TopicDetails.DeleteButton.Tooltip %>" />
    </div>
</div>
<nopCommerce:BannerInfo ID="ctrlBannerInfo" runat="server" />
