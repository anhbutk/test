<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Administration.Modules.QuestionInMonthDetailControl"
    CodeBehind="QuestionInMonthDetail.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="QuestionInMonth" Src="QuestionInMonth.ascx" %>
<div class="section-header">
    <div class="title">
        <img src="Common/ico-content.png" alt="Question" />
        Question In Month        
    </div>
    <div class="options">
        <asp:Button ID="SaveButton" runat="server" Text="<% $NopResources:Admin.NewsAdd.SaveButton.Text %>"
            CssClass="adminButtonBlue" OnClick="SaveButton_Click" ToolTip="<% $NopResources:Admin.NewsAdd.SaveButton.Tooltip %>" />        
    </div>
</div>
<asp:Label ID="lblResult" runat="server"></asp:Label>
<nopCommerce:QuestionInMonth ID="ctrlQuestionInMonth" runat="server" />
