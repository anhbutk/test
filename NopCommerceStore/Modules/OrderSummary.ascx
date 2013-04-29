<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.OrderSummaryControl"
    CodeBehind="OrderSummary.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="GoogleCheckoutButton" Src="~/Modules/GoogleCheckoutButton.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="OrderTotals" Src="~/Modules/OrderTotals.ascx" %>
<asp:Panel class="OrderSummaryContent" runat="server" ID="pnlEmptyCart">
    <%=GetLocaleResourceString("ShoppingCart.CartIsEmpty")%>
</asp:Panel>
<asp:Panel class="OrderSummaryContent" runat="server" ID="pnlCart">
    <%if (IsShoppingCart)
      { %>
    <asp:Panel runat="server" ID="phCoupon" CssClass="CouponBox">
        <%=GetLocaleResourceString("ShoppingCart.CouponCode")%>
        <asp:TextBox ID="txtCouponCode" runat="server" Width="125px" />&nbsp;
        <asp:Button runat="server" ID="btnApplyCouponCode" OnClick="btnApplyCouponCode_Click"
            Text="<% $NopResources:ShoppingCart.ApplyCouponCode %>" CausesValidation="false" />
    </asp:Panel>
    <div class="clear">
    </div>
    <%} %>
    <div id="table_cart1">
        <table width="100%">
            <tbody>
                <tr>
                    <%if (IsShoppingCart)
                      { %>
                    <td width="35px" style="background-color: #C08328; height: 22px; color: #FFFFFF; font-size: 12px;">
                        <%=GetLocaleResourceString("ShoppingCart.Remove")%>
                    </td>
                    <%} %>
                    <%if (SettingManager.GetSettingValueBoolean("Display.ShowProductImagesOnShoppingCart"))
                      {%>
                    <td style="background-color: #C08328; height: 22px; color: #FFFFFF; font-size: 12px;">
                    </td>
                    <%} %>
                    <td width="250px" style="background-color: #C08328; height: 22px; color: #FFFFFF; font-size: 12px;">
                        <%=GetLocaleResourceString("ShoppingCart.Product(s)")%>
                    </td>
                    <td style="background-color: #C08328; height: 22px; color: #FFFFFF; font-size: 12px;">
                        <%=GetLocaleResourceString("ShoppingCart.UnitPrice")%>
                    </td>
                    <td width="70px" style="background-color: #C08328; height: 22px; color: #FFFFFF; font-size: 12px;">
                        <%=GetLocaleResourceString("ShoppingCart.Quantity")%>
                    </td>
                    <td style="background-color: #C08328; height: 22px; color: #FFFFFF; font-size: 12px;">
                        <%=GetLocaleResourceString("ShoppingCart.ItemTotal")%>
                    </td>
                </tr>
                <asp:Repeater ID="rptShoppingCart" runat="server">
                    <ItemTemplate>
                        <tr class="cart-item-row">
                            <%if (IsShoppingCart)
                              { %>
                            <td>
                                <asp:CheckBox runat="server" ID="cbRemoveFromCart" />
                            </td>
                            <%} %>
                            <%if (SettingManager.GetSettingValueBoolean("Display.ShowProductImagesOnShoppingCart"))
                              {%>
                            <td class="productpicture">
                                <asp:Image ID="iProductVariantPicture" runat="server" ImageUrl='<%#GetProductVariantImageUrl((ShoppingCartItem)Container.DataItem)%>'
                                    AlternateText="Product picture" />
                            </td>
                            <%} %>
                            <td>
                                <a href='<%#GetProductURL((ShoppingCartItem)Container.DataItem)%>' title="View details">
                                    <%#Server.HtmlEncode(GetProductVariantName((ShoppingCartItem)Container.DataItem))%></a>
                                <%#GetAttributeDescription((ShoppingCartItem)Container.DataItem)%>
                                <asp:Panel runat="server" ID="pnlWarnings" CssClass="WarningBox" EnableViewState="false"
                                    Visible="false">
                                    <asp:Label runat="server" ID="lblWarning" CssClass="WarningText" EnableViewState="false"
                                        Visible="false"></asp:Label>
                                </asp:Panel>
                            </td>
                            <td>
                                <%#GetShoppingCartItemUnitPriceString((ShoppingCartItem)Container.DataItem)%>
                            </td>
                            <td>
                                <%if (IsShoppingCart)
                                  { %>
                                <asp:TextBox ID="txtQuantity" size="4" runat="server" Text='<%# Eval("Quantity") %>' />
                                <%}
                                  else
                                  { %>
                                <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("Quantity") %>' CssClass="Label" />
                                <%} %>
                            </td>
                            <td>
                                <%#GetShoppingCartItemSubTotalString((ShoppingCartItem)Container.DataItem)%>
                                <asp:Label ID="lblShoppingCartItemID" runat="server" Visible="false" Text='<%# Eval("ShoppingCartItemID") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>
    <div class="clear">
    </div>
    <%if (IsShoppingCart)
      { %>
    <div class="clear">
        &nbsp;
    </div>
    <div>
        <div>
            <asp:Button ID="btnUpdate" OnClick="btnUpdate_Click" runat="server" Text="<% $NopResources:ShoppingCart.UpdateCart %>" />
            <asp:Button ID="btnContinueShopping" OnClick="btnContinueShopping_Click" runat="server"
                Text="<% $NopResources:ShoppingCart.ContinueShopping %>" />
            <asp:Button ID="btnCheckout" OnClick="btnCheckout_Click" runat="server" Text="<% $NopResources:ShoppingCart.Checkout %>" />
        </div>
        <div>
            <nopCommerce:GoogleCheckoutButton runat="server" ID="btnGoogleCheckoutButton"></nopCommerce:GoogleCheckoutButton>
        </div>
    </div>
    <%} %>
    <div id="table_cart2">
        <nopCommerce:OrderTotals runat="server" ID="ctrlOrderTotals"></nopCommerce:OrderTotals>
    </div>
</asp:Panel>
