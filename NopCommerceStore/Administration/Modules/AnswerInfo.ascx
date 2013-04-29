<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Administration.Modules.AnswerInfoControl"
    CodeBehind="AnswerInfo.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="SimpleTextBox" Src="SimpleTextBox.ascx" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<table class="adminContent">
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblQuestion" Text="Question" ToolTip="Question"
                ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:DropDownList ID="drpQuestion" runat="server" Width="450px">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="ToolTipLabel1" Text="Answer" ToolTip="Answer"
                ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox ID="txtAnswerContent" runat="server" CssClass="adminInput" TextMode="MultiLine" Height="100px"
                Width="450px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblIsCorrect" Text="Is Correct" ToolTip="Is Correct"
                ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:CheckBox ID="cbIsCorrect" runat="server" Checked="false"></asp:CheckBox>
        </td>
    </tr>
</table>
