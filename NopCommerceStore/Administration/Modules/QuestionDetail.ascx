<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Administration.Modules.QuestionDetailControl"
    CodeBehind="QuestionDetail.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="QuestionInfo" Src="QuestionInfo.ascx" %>
<div class="section-header">
    <div class="title">
        <img src="Common/ico-content.png" alt="Question" />
        Question
        <a href="Question.aspx" title="back to question list">
            (back to question list)</a>
    </div>
    <div class="options">
        <asp:Button ID="SaveButton" runat="server" Text="<% $NopResources:Admin.NewsAdd.SaveButton.Text %>"
            CssClass="adminButtonBlue" OnClick="SaveButton_Click" ToolTip="<% $NopResources:Admin.NewsAdd.SaveButton.Tooltip %>" />
        <asp:Button ID="DeleteButton" runat="server" CssClass="adminButtonBlue" Text="<% $NopResources:Admin.BlogPostDetails.DeleteButton.Text %>"
            OnClick="DeleteButton_Click" CausesValidation="false" ToolTip="<% $NopResources:Admin.BlogPostDetails.DeleteButton.Tooltip %>" />
    </div>
</div>
<nopCommerce:QuestionInfo ID="ctrlQuestionInfo" runat="server" />
