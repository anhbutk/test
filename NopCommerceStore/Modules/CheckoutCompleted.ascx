<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.CheckoutCompletedControl"
    CodeBehind="CheckoutCompleted.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="OrderDetails" Src="~/Modules/OrderDetails.ascx" %>
<div id="shippingaddress">
    <div class="title">
        <%=GetLocaleResourceString("Checkout.ThankYou")%>
    </div>
    <div class="clear">
    </div>
    <div class="CheckoutData">
        <div class="OrderCompleted">
            <asp:Panel ID="pnlSucess" runat="server" Visible="false">
                <div class="Body">
                    <b>
                        <%=GetLocaleResourceString("Checkout.YourOrderHasBeenSuccessfullyProcessed")%></b>
                    <p>
                        <%=GetLocaleResourceString("Checkout.OrderNumber")%>:
                        <asp:Label runat="server" ID="lblOrderNumber" />
                    </p>
                    <p>
                        <asp:HyperLink runat="server" ID="hlOrderDetails" Text="<% $NopResources:Checkout.OrderCompleted.Details %>" />
                    </p>
                </div>
            </asp:Panel>
            <asp:Panel ID="pnlError" runat="server" Visible="false">
                <b>
                    <%=GetLocaleResourceString("Checkout.YourOrderHasBeenUnsuccessful")%></b>    
                    <asp:Label ID="lblError" runat="server"></asp:Label>            
            </asp:Panel>
            <div class="clear">
            </div>
            <div class="SelectButton">
                <asp:Button runat="server" ID="btnContinue" Text="<% $NopResources:Checkout.Continue %>"
                    OnClick="btnContinue_Click" />
            </div>
        </div>
    </div>
</div>
