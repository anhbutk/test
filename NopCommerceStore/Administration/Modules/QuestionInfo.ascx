<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Administration.Modules.QuestionInfoControl"
    CodeBehind="QuestionInfo.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="SimpleTextBox" Src="SimpleTextBox.ascx" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<table class="adminContent">  
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblQuestion" Text="Question"
                ToolTip="Question" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox ID="txtQuestionContent" runat="server" CssClass="adminInput" TextMode="MultiLine" Width="450px"></asp:TextBox>
        </td>
    </tr>    
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblPublished" Text="<% $NopResources:Admin.NewsInfo.Published %>"
                ToolTip="<% $NopResources:Admin.NewsInfo.Published.Tooltip %>" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:CheckBox ID="cbPublished" runat="server" Checked="True"></asp:CheckBox>
        </td>
    </tr>     
</table>
