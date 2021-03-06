<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Administration.Modules.ManufacturerProductAddControl"
    CodeBehind="ManufacturerProductAdd.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="SelectCategoryControl" Src="SelectCategoryControl.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="NumericTextBox" Src="NumericTextBox.ascx" %>
<div class="section-header">
    <div class="title">
        <img src="Common/ico-catalog.png" alt="<%=GetLocaleResourceString("Admin.AddManufacturerProduct.Title")%>" />
        <%=GetLocaleResourceString("Admin.AddManufacturerProduct.Title")%>
    </div>
</div>
<table width="100%">
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblProductName" Text="<% $NopResources:Admin.AddManufacturerProduct.ProductName %>"
                ToolTip="<% $NopResources:Admin.AddManufacturerProduct.ProductName.Tooltip %>"
                ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox ID="txtProductName" CssClass="adminInput" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblCategory" Text="<% $NopResources:Admin.AddManufacturerProduct.Category %>"
                ToolTip="<% $NopResources:Admin.AddManufacturerProduct.Category.Tooltip %>" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <nopCommerce:SelectCategoryControl ID="ParentCategory" CssClass="adminInput" runat="server">
            </nopCommerce:SelectCategoryControl>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblManufacturer" Text="<% $NopResources:Admin.AddManufacturerProduct.Manufacturer %>"
                ToolTip="<% $NopResources:Admin.AddManufacturerProduct.Manufacturer.Tooltip %>"
                ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:DropDownList ID="ddlManufacturer" runat="server" CssClass="adminInput">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td colspan="2" class="adminData">
            <asp:Button ID="SearchButton" runat="server" Text="<% $NopResources:Admin.AddManufacturerProduct.SearchButton.Text %>"
                CssClass="adminButtonBlue" OnClick="SearchButton_Click" ToolTip="<% $NopResources:Admin.AddManufacturerProduct.SearchButton.Tooltip %>" />
        </td>
    </tr>
</table>
<p>
</p>
<asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False" Width="100%"
    OnPageIndexChanging="gvProducts_PageIndexChanging" AllowPaging="true" PageSize="10">
    <Columns>
        <asp:TemplateField HeaderText="<% $NopResources:Admin.AddManufacturerProduct.ProductColumn %>"
            ItemStyle-Width="70%">
            <ItemTemplate>
                <asp:CheckBox ID="cbProductInfo" runat="server" Text='<%# Server.HtmlEncode(Eval("Name").ToString()) %>'
                    ToolTip="<% $NopResources:Admin.AddManufacturerProduct.ProductColumn.Tooltip %>" />
                <asp:HiddenField ID="hfProductID" runat="server" Value='<%# Eval("ProductID") %>' />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<% $NopResources:Admin.AddManufacturerProduct.PublishedColumn %>"
            HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <nopCommerce:ImageCheckBox runat="server" ID="cbPublished" Checked='<%# Eval("Published") %>'>
                </nopCommerce:ImageCheckBox>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<% $NopResources:Admin.AddManufacturerProduct.DisplayOrderColumn %>"
            HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <nopCommerce:NumericTextBox runat="server" CssClass="adminInput" Width="50px" ID="txtDisplayOrder"
                    Value="1" RequiredErrorMessage="<% $NopResources:Admin.AddManufacturerProduct.DisplayOrderColumn.RequiredErrorMessage %>"
                    RangeErrorMessage="<% $NopResources:Admin.AddManufacturerProduct.DisplayOrderColumn.RangeErrorMessage %>"
                    MinimumValue="-99999" MaximumValue="99999"></nopCommerce:NumericTextBox>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<br />
<asp:Label runat="server" ID="lblNoProductsFound" Text="<% $NopResources:Admin.AddManufacturerProduct.NoProductsFound %>"
    Visible="false"></asp:Label>
<br />
<asp:Button ID="btnSave" runat="server" CssClass="adminButton" Text="<% $NopResources:Admin.AddManufacturerProduct.SaveColumn %>"
    ToolTip="<% $NopResources:Admin.AddManufacturerProduct.SaveColumn.Tooltip %>"
    OnClick="btnSave_Click" Visible="false" />
