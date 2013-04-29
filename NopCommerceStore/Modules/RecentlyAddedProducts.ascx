<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.Modules.RecentlyAddedProductsControl" Codebehind="RecentlyAddedProducts.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductBoxPhanNu" Src="~/Modules/ProductBoxPhanNu.ascx" %>
<div id="shoppingcart">
    <div class="productname">
        <table width="100%">
            <tr>
                <td style="text-align: left;">
                    <%=GetLocaleResourceString("Products.NewProducts")%>
                </td>               
            </tr>
        </table>
    </div>
    <div class="clear">
    &nbsp;
    </div>
    <div>
        <asp:Repeater ID="dlCatalog" runat="server">
           <ItemTemplate>
                <nopCommerce:ProductBoxPhanNu ID="ProductBoxPhanNu" Product='<%# Container.DataItem %>' runat="server" />
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>
