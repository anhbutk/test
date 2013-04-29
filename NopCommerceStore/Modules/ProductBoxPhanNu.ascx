<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.ProductBoxPhanNuControl"
    CodeBehind="ProductBoxPhanNu.ascx.cs" %>
<div id="product">
    <div class="picture">
        <asp:HyperLink ID="hlImageLink" runat="server" />
    </div>
    <div>
        <asp:HyperLink ID="hlProduct" runat="server" CssClass="product_name" />
    </div>
    <div>
        <div class="prices">
            <asp:Label ID="lblOldPrice" runat="server" CssClass="gia" />            
            <asp:Label ID="lblPrice" runat="server" CssClass="gia" />
        </div>
        <div>
            <asp:Button runat="server" ID="btnProductDetails" OnCommand="btnProductDetails_Click"
                Text="<% $NopResources:Products.ProductDetails %>" ValidationGroup="ProductDetails"
                CommandArgument='<%# Eval("ProductID") %>' CssClass="bu_more" />       
            <asp:Button runat="server" ID="btnAddToCart" OnCommand="btnAddToCart_Click" Text="<% $NopResources:Products.AddToCart %>"
                ValidationGroup="ProductDetails" CommandArgument='<%# Eval("ProductID") %>' 
                CssClass="bu_check" />
        </div>
    </div>
</div>
