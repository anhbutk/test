<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Administration.Modules.ForumTopicInfoControl"
    CodeBehind="ForumTopicInfo.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="SimpleTextBox" Src="SimpleTextBox.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="NumericTextBox" Src="NumericTextBox.ascx" %>
<table class="adminContent">    
    <tr>
        <td class="adminTitle">
             <nopCommerce:ToolTipLabel runat="server" ID="ToolTipLabel2" Text="<% $NopResources:Admin.ForumInfo.Category %>"
                ToolTip="<% $NopResources:Admin.ForumInfo.Category.Tooltip %>" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:DropDownList ID="ddlForum" CssClass="adminInput" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
             <nopCommerce:ToolTipLabel runat="server" ID="lblTitle" Text="<% $NopResources:Admin.NewsInfo.Title %>"
                ToolTip="<% $NopResources:Admin.NewsInfo.Title.Tooltip %>" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <nopCommerce:SimpleTextBox runat="server" ID="txtName" CssClass="adminInput" Width="300" ErrorMessage="<% $NopResources:Admin.ForumInfo.Name.ErrorMessage %>">
            </nopCommerce:SimpleTextBox>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblShort" Text="<% $NopResources:Admin.NewsInfo.Short %>"
                ToolTip="<% $NopResources:Admin.NewsInfo.Short.Tooltip %>" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
             <asp:TextBox ID="txtShort" runat="server" CssClass="adminInput" TextMode="MultiLine"
                Height="100" MaxLength="2000"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblFull" Text="<% $NopResources:Admin.NewsInfo.Full %>"
                ToolTip="<% $NopResources:Admin.NewsInfo.Full.Tooltip %>" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
             <FCKeditorV2:FCKeditor ID="txtDescription" runat="server" AutoDetectLanguage="false"
                Height="350">
            </FCKeditorV2:FCKeditor>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="ToolTipLabel3" Text="<% $NopResources:Admin.ForumInfo.Views %>"
                ToolTip="<% $NopResources:Admin.ForumInfo.Views.Tooltip %>" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <nopCommerce:NumericTextBox runat="server" ID="txtViewNums" CssClass="adminInput"
                Value="1" RequiredErrorMessage="<% $NopResources:Admin.ForumInfo.DisplayOrder.RequiredErrorMessage %>"
                MinimumValue="-99999" MaximumValue="99999" RangeErrorMessage="<% $NopResources:Admin.ForumInfo.DisplayOrder.RangeErrorMessage %>">
            </nopCommerce:NumericTextBox>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
          <nopCommerce:ToolTipLabel runat="server" ID="ToolTipLabel4" Text="<% $NopResources:Admin.ForumInfo.VideoClip %>"
                ToolTip="<% $NopResources:Admin.ForumInfo.VideoClip.Tooltip %>" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox ID="txtYoutube" runat="server" CssClass="adminInput" TextMode="SingleLine"
                MaxLength="2000" Width="400"></asp:TextBox>            
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
            <nopCommerce:ToolTipLabel runat="server" ID="ToolTipLabel6" Text="<% $NopResources:Admin.ForumInfo.ShowHomepage %>"
                ToolTip="<% $NopResources:Admin.ForumInfo.ShowHomepage.Tooltip %>" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:CheckBox runat="server" ID="chkHomepage" />            
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
    <tr runat="server" id="pnlCreatedOn">
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblCreatedOnTitle" Text="<% $NopResources:Admin.ForumInfo.CreatedOn %>"
                ToolTip="<% $NopResources:Admin.ForumInfo.CreatedOn.Tooltip %>" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:Label ID="lblCreatedOn" runat="server"></asp:Label>
        </td>
    </tr>
    <tr runat="server" id="pnlUpdatedOn">
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblUpdatedOnTitle" Text="<% $NopResources:Admin.ForumInfo.UpdatedOn %>"
                ToolTip="<% $NopResources:Admin.ForumInfo.UpdatedOn.Tooltip %>" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:Label ID="lblUpdatedOn" runat="server"></asp:Label>
        </td>
    </tr>
</table>
