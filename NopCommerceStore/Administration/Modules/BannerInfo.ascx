<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Administration.Modules.BannerInfoControl"
    CodeBehind="BannerInfo.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="SimpleTextBox" Src="SimpleTextBox.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="NumericTextBox" Src="NumericTextBox.ascx" %>
<table class="adminContent">
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblTitle" Text="Banner Name" ToolTip="Banner Name"
                ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <nopCommerce:SimpleTextBox runat="server" ID="txtName" CssClass="adminInput" Width="300"
                ErrorMessage="<% $NopResources:Admin.ForumInfo.Name.ErrorMessage %>"></nopCommerce:SimpleTextBox>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="ToolTipLabel1" Text="URL" ToolTip="URL"
                ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <nopCommerce:SimpleTextBox runat="server" ID="txtURL" CssClass="adminInput"
                Width="300" ErrorMessage="<% $NopResources:Admin.ForumInfo.URL.ErrorMessage %>">
            </nopCommerce:SimpleTextBox>
        </td>
    </tr>
     <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="ToolTipLabel2" Text="Views" ToolTip="Views"
                ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <nopCommerce:SimpleTextBox runat="server" ID="txtViews" CssClass="adminInput"
                Width="300" ErrorMessage="<% $NopResources:Admin.ForumInfo.Views.ErrorMessage %>">
            </nopCommerce:SimpleTextBox>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="ToolTipLabel5" Text="<% $NopResources:Admin.ForumInfo.Images %>"
                ToolTip="<% $NopResources:Admin.ForumInfo.Images.Tooltip %>" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:FileUpload ID="fuImage" CssClass="adminInput" runat="server" />
            <asp:HyperLink ID="defaultImage" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblPublished" Text="<% $NopResources:Admin.NewsInfo.Published %>"
                ToolTip="<% $NopResources:Admin.NewsInfo.Published.Tooltip %>" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:CheckBox runat="server" ID="chkOnOff" />
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="ToolTipLabel3" Text="<% $NopResources:Admin.NewsInfo.Position %>"
                ToolTip="<% $NopResources:Admin.NewsInfo.Position %>" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:DropDownList ID="drpPosition" runat="server">
                <asp:ListItem Text="Homepage" Value="2">        
                </asp:ListItem>
                <asp:ListItem Text="Left Menu" Value="1"></asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
</table>
