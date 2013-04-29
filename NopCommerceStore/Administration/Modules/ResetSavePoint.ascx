<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Administration.Modules.ResetSavePointControl"
    CodeBehind="ResetSavePoint.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="NumericTextBox" Src="NumericTextBox.ascx" %>
<div class="section-header">
    <div class="title">
        <img src="Common/ico-content.png" alt="<%=GetLocaleResourceString("Admin.Customer.ResetSavePoint")%>" />
        <%=GetLocaleResourceString("Admin.Customer.ResetSavePoint")%>
    </div>
</div>
<p>
</p>
<nopCommerce:ToolTipLabel runat="server" ID="lblResetSavePoint" Text="<% $NopResources:Admin.Customer.ResetSavePoint.Introduction %>"
                ToolTip="<% $NopResources:Admin.Customer.ResetSavePoint.Introduction.Tooltip %>" ToolTipImage="~/Administration/Common/ico-help.gif" />
<p>
</p>
<asp:DropDownList ID="ddlYear" CssClass="adminInput" runat="server">
</asp:DropDownList>
<p>
</p>
<asp:Button Visible="true" runat="server" Text="<% $NopResources:Admin.Customer.ResetSavePoint %>"
            CssClass="adminButtonBlue" ID="btnReset" OnClick="btnReset_Click" />

