<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.OrderDetailsControl"
    CodeBehind="OrderDetails.ascx.cs" %>
<div>
    <table width="100%">
        <tr>
            <td style="text-align: left;">
                <div class="productname">
                    <%=GetLocaleResourceString("Order.OrderInformation")%>
                </div>
            </td>
            <td style="text-align: right;">
                <%if (!this.HidePrintButton)
                  { %>
                <asp:HyperLink runat="server" ID="lnkPrint" Text="Print" Target="_blank" CssClass="orderdetailsprintbutton" />
                <%} %>
            </td>
        </tr>
    </table>
    <div class="clear">
    </div>
    <div style="text-align: left; margin-top: 10px">
        <div>
            <table width="100%" cellspacing="0" cellpadding="2" border="0">
                <tbody>
                    <tr>
                        <td>
                            <b>
                                <%=GetLocaleResourceString("Order.Order#")%>
                            </b>
                            <asp:Label ID="lblOrderID" runat="server" />
                        </td>
                        <td class="smallText" style="width: 50%">
                            <b>
                                <%=GetLocaleResourceString("Order.OrderDate")%>: </b>
                            <asp:Label ID="lblCreatedOn" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="smallText">
                            <b>
                                <%=GetLocaleResourceString("Order.OrderStatus")%></b>
                            <asp:Label ID="lblOrderStatus" runat="server"></asp:Label>
                        </td>
                        <td class="smallText">
                            <b>
                                <%=GetLocaleResourceString("Order.PaymentMethod")%>:</b>
                            <asp:Literal runat="server" ID="lPaymentMethod"></asp:Literal>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="clear">
        </div>
        <div style="width: 100%; float: left; margin: 10px 0">
            <asp:Panel runat="server" ID="pnlShipping" Style="width: 50%; float: left; margin: 10px 0">
                <table width="100%" border="0">
                    <tbody>
                        <tr>
                            <td>
                                <b>
                                    <%=GetLocaleResourceString("Order.ShippingAddress")%></b>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Literal ID="lShippingFirstName" runat="server"></asp:Literal>
                                <asp:Literal ID="lShippingLastName" runat="server"></asp:Literal><br />
                                <div>
                                    <%=GetLocaleResourceString("Order.Email")%>:
                                <asp:Literal ID="lShippingEmail" runat="server"></asp:Literal>
                                </div>
                                <div>
                                    <%=GetLocaleResourceString("Order.Phone")%>:
                                <asp:Literal ID="lShippingPhoneNumber" runat="server"></asp:Literal>
                                </div>
                                <div>
                                    <%=GetLocaleResourceString("Order.Fax")%>:
                                <asp:Literal ID="lShippingFaxNumber" runat="server"></asp:Literal>
                                </div>
                                <asp:Panel ID="pnlShippingCompany" runat="server">
                                    <%=GetLocaleResourceString("Address.Company")%>:
                                <asp:Literal ID="lShippingCompany" runat="server"></asp:Literal>
                                </asp:Panel>
                                <div>
                                    <%=GetLocaleResourceString("Address.Address1")%>:
                                <asp:Literal ID="lShippingAddress1" runat="server"></asp:Literal>
                                </div>
                                <asp:Panel ID="pnlShippingAddress2" runat="server">
                                    <%=GetLocaleResourceString("Address.Address2")%>:
                                <asp:Literal ID="lShippingAddress2" runat="server"></asp:Literal>
                                </asp:Panel>
                                <div>
                                    <%=GetLocaleResourceString("Address.City")%>:
                                <asp:Literal ID="lShippingCity" runat="server"></asp:Literal>,
                                <asp:Literal ID="lShippingStateProvince" runat="server"></asp:Literal>
                                    <asp:Literal ID="lShippingZipPostalCode" runat="server"></asp:Literal>
                                </div>
                                <asp:Panel ID="pnlShippingCountry" runat="server">
                                    <%=GetLocaleResourceString("Address.Country")%>:
                                <asp:Literal ID="lShippingCountry" runat="server"></asp:Literal>
                                </asp:Panel>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </asp:Panel>
            <div class="BillingBox" style="width: 50%; float: right; margin: 10px 0">
                <table width="100%" cellspacing="3" cellpadding="2" border="0">
                    <tbody>
                        <tr>
                            <td>
                                <b>
                                    <%=GetLocaleResourceString("Order.BillingAddress")%></b>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Literal ID="lBillingFirstName" runat="server"></asp:Literal>
                                <asp:Literal ID="lBillingLastName" runat="server"></asp:Literal><br />
                                <div>
                                    <%=GetLocaleResourceString("Order.Email")%>:
                                <asp:Literal ID="lBillingEmail" runat="server"></asp:Literal>
                                </div>
                                <div>
                                    <%=GetLocaleResourceString("Order.Phone")%>:
                                <asp:Literal ID="lBillingPhoneNumber" runat="server"></asp:Literal>
                                </div>
                                <div>
                                    <%=GetLocaleResourceString("Order.Fax")%>:
                                <asp:Literal ID="lBillingFaxNumber" runat="server"></asp:Literal>
                                </div>
                                <asp:Panel ID="pnlBillingCompany" runat="server">
                                    <%=GetLocaleResourceString("Address.Company")%>:
                                <asp:Literal ID="lBillingCompany" runat="server"></asp:Literal>
                                </asp:Panel>
                                <div>
                                    <%=GetLocaleResourceString("Address.Address1")%>:
                                <asp:Literal ID="lBillingAddress1" runat="server"></asp:Literal>
                                </div>
                                <asp:Panel ID="pnlBillingAddress2" runat="server">
                                    <%=GetLocaleResourceString("Address.Address2")%>:
                                <asp:Literal ID="lBillingAddress2" runat="server"></asp:Literal>
                                </asp:Panel>
                                <div>
                                    <%=GetLocaleResourceString("Address.City")%>:
                                <asp:Literal ID="lBillingCity" runat="server"></asp:Literal>,
                                <asp:Literal ID="lBillingStateProvince" runat="server"></asp:Literal>
                                    <asp:Literal ID="lBillingZipPostalCode" runat="server"></asp:Literal>
                                </div>
                                <asp:Panel ID="pnlBillingCountry" runat="server">
                                    <%=GetLocaleResourceString("Address.Country")%>:
                                <asp:Literal ID="lBillingCountry" runat="server"></asp:Literal>
                                </asp:Panel>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="clear">
        </div>
        <div style="margin-bottom: 10px">
            <b>
                <%=GetLocaleResourceString("Checkout.CustomerNote")%></b>
            <asp:Literal runat="server" ID="lblCustomerNote"></asp:Literal>
        </div>
        <div class="clear">
        </div>
        <div>
            <asp:GridView ID="gvOrderProductVariants" runat="server" AutoGenerateColumns="False"
                Width="100%">
                <Columns>
                    <asp:BoundField DataField="OrderProductVariantID" HeaderText="OrderProductVariantID"
                        Visible="False"></asp:BoundField>
                    <asp:TemplateField HeaderText="<% $NopResources:Order.ProductsGrid.Name %>">
                        <ItemTemplate>
                            <div style="padding-left: 10px; padding-right: 10px; text-align: left;">
                                <em><a href='<%#GetProductURL(Convert.ToInt32(Eval("ProductVariantID")))%>'>
                                    <%#Server.HtmlEncode(GetProductVariantName(Convert.ToInt32(Eval("ProductVariantID"))))%></a></em>
                                <%#Eval("AttributeDescription")%>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<% $NopResources:Order.ProductsGrid.Download %>" HeaderStyle-HorizontalAlign="Center"
                        ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <div style="padding-left: 10px; padding-right: 10px; text-align: left;">
                                <%#GetDownloadURL(Container.DataItem as OrderProductVariant)%>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<% $NopResources:Order.ProductsGrid.Price %>" HeaderStyle-HorizontalAlign="Center"
                        ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <div style="padding-left: 10px; padding-right: 10px; text-align: left;">
                                <%#GetProductVariantUnitPrice(Container.DataItem as OrderProductVariant)%>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Quantity" HeaderText="<% $NopResources:Order.ProductsGrid.Quantity %>"
                        HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                    <asp:TemplateField HeaderText="<% $NopResources:Order.ProductsGrid.Total %>" HeaderStyle-HorizontalAlign="Center"
                        ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <div style="padding-left: 10px; padding-right: 10px; text-align: left;">
                                <%#GetProductVariantSubTotal(Container.DataItem as OrderProductVariant)%>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div>
            <table style="width: 100%">
                <tbody>
                    <tr>
                        <td align="right">
                            <table width="100%" cellspacing="0" cellpadding="2" border="0">
                                <tbody>
                                    <tr>
                                        <td width="100%" align="right">
                                            <b>
                                                <%=GetLocaleResourceString("Order.Sub-Total")%>:</b>
                                        </td>
                                        <td align="right">
                                            <span style="white-space: nowrap;">
                                                <asp:Label ID="lblOrderSubtotal" runat="server"></asp:Label>
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="100%" align="right">
                                            <b>
                                                <%=GetLocaleResourceString("Order.OrderTotal")%>:</b>
                                        </td>
                                        <td align="right">
                                            <b><span style="white-space: nowrap;">
                                                <asp:Label ID="lblOrderTotal2" runat="server"></asp:Label>
                                            </span></b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="100%" align="right">
                                            <b>
                                                <%=GetLocaleResourceString("Order.SavePoint")%>:</b>
                                        </td>
                                        <td align="left">
                                            <b><span style="white-space: nowrap;">
                                                <asp:Label ID="lblSavePoint" runat="server"></asp:Label>
                                            </span></b>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
