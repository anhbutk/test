<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.RelatedProductsControl"
    CodeBehind="RelatedProducts.ascx.cs" %>
<div id="sanphamcungloai">
    <a class="other_title">
        <%=GetLocaleResourceString("Products.RelatedProducts")%>
    </a>
</div>
<asp:DataList ID="dlRelatedProducts" runat="server" RepeatColumns="2" RepeatDirection="Horizontal"
    RepeatLayout="Table" OnItemDataBound="dlRelatedProducts_ItemDataBound" ItemStyle-CssClass="ItemBox" Width="100%">
    <ItemTemplate>
        <div id="otherproduct">
            <div class="image">
                <asp:HyperLink ID="hlImageLink" runat="server" />
            </div>
            <div class="productname">
                <asp:HyperLink ID="hlProduct" runat="server" CssClass="other_name" />
            </div>
        </div>
    </ItemTemplate>
    <ItemStyle Width="50%" />
</asp:DataList>
