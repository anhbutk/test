<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Administration.Modules.FAQInfoControl"
    CodeBehind="FAQInfo.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="SimpleTextBox" Src="SimpleTextBox.ascx" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<table class="adminContent">  
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblQuestion" Text="<% $NopResources:Admin.FAQInfo.Question %>"
                ToolTip="<% $NopResources:Admin.FAQInfo.Question.Tooltip %>" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox ID="txtQuestion" runat="server" CssClass="adminInput" TextMode="SingleLine" Width="450px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblFull" Text="<% $NopResources:Admin.FAQInfo.Answer %>"
                ToolTip="<% $NopResources:Admin.FAQInfo.Answer.Tooltip %>" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
           <asp:TextBox ID="txtAnswer" runat="server" CssClass="adminInput" TextMode="MultiLine"
                Height="100" Width="450px"></asp:TextBox>
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
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblDisplayOrder" Text="<% $NopResources:Admin.FAQInfo.DisplayOrder %>"
                ToolTip="<% $NopResources:Admin.FAQInfo.DisplayOrder.Tooltip %>" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox ID="txtDisplayOrder" runat="server" CssClass="adminInput" TextMode="SingleLine"></asp:TextBox>
        </td>
    </tr> 
</table>
