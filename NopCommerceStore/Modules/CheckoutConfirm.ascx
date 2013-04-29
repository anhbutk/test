<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.CheckoutConfirmControl"
    CodeBehind="CheckoutConfirm.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="OrderSummary" Src="~/Modules/OrderSummary.ascx" %>
<div id="shippingaddress">
    <div class="title">
        <%=GetLocaleResourceString("Checkout.ConfirmYourOrder")%>
    </div>
    <div class="clear">
    </div>
    <div class="CheckoutData">
        <div>
            <div style="float: left; width: 636px; margin-bottom: 10px; text-align: left">
                 <%=GetLocaleResourceString("Checkout.CustomerNote")%>
                <asp:TextBox ID="txtCustomerNote" runat="server" TextMode="MultiLine" Height="100px"
                    Width="100%"></asp:TextBox>
            </div>
            <div class="SelectButton">
                <asp:Button runat="server" ID="btnNextStep" Text="<% $NopResources:Checkout.ConfirmButton %>"
                    OnClick="btnNextStep_Click" />
            </div>
            <div class="clear">
            </div>
            <div class="ErrorBlock">
                <div class="messageError">
                    <asp:Literal runat="server" ID="lError" EnableViewState="false"></asp:Literal>
                </div>
            </div>
        </div>
        <div class="clear">
        </div>
        <div class="title">
            <%=GetLocaleResourceString("Checkout.OrderSummary")%>
        </div>
        <div class="clear">
        </div>
        <div class="OrderSummaryBody">
            <nopCommerce:OrderSummary ID="OrderSummaryControl" runat="server" IsShoppingCart="false">
            </nopCommerce:OrderSummary>
        </div>
    </div>
</div>
