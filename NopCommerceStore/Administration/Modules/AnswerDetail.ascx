<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Administration.Modules.AnswerDetailControl"
    CodeBehind="AnswerDetail.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="AnswerInfo" Src="AnswerInfo.ascx" %>
<div class="section-header">
    <div class="title">
        <img src="Common/ico-content.png" alt="Question" />
        Answer
        <a href="Answer.aspx" title="Back to answer list">
            (back to answer list)</a>
    </div>
    <div class="options">
        <asp:Button ID="SaveButton" runat="server" Text="<% $NopResources:Admin.NewsAdd.SaveButton.Text %>"
            CssClass="adminButtonBlue" OnClick="SaveButton_Click" ToolTip="<% $NopResources:Admin.NewsAdd.SaveButton.Tooltip %>" />
        <asp:Button ID="DeleteButton" runat="server" CssClass="adminButtonBlue" Text="<% $NopResources:Admin.BlogPostDetails.DeleteButton.Text %>"
            OnClick="DeleteButton_Click" CausesValidation="false" ToolTip="<% $NopResources:Admin.BlogPostDetails.DeleteButton.Tooltip %>" />
    </div>
</div>
<nopCommerce:AnswerInfo ID="ctrlAnswerInfo" runat="server" />
