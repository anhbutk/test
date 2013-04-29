<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Templates.Products.VariantsInGridPhanNu"
    CodeBehind="VariantsInGridPhanNu.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductVariantsInGrid" Src="~/Modules/ProductVariantsInGrid.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductInfo" Src="~/Modules/ProductInfo.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductCategoryBreadcrumb" Src="~/Modules/ProductCategoryBreadcrumb.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductRating" Src="~/Modules/ProductRating.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductEmailAFriendButton" Src="~/Modules/ProductEmailAFriendButton.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductAddToCompareList" Src="~/Modules/ProductAddToCompareList.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductSpecs" Src="~/Modules/ProductSpecifications.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="RelatedProducts" Src="~/Modules/RelatedProducts.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductReviews" Src="~/Modules/ProductReviews.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductsAlsoPurchased" Src="~/Modules/ProductsAlsoPurchased.ascx" %>
<nopCommerce:ProductCategoryBreadcrumb ID="ctrlProductCategoryBreadcrumb" runat="server">
</nopCommerce:ProductCategoryBreadcrumb>
<div class="productinfo">
    <div>
        <nopCommerce:ProductInfo ID="ctrlProductInfo" runat="server"></nopCommerce:ProductInfo>
    </div>
    <div class="related">
        <nopCommerce:RelatedProducts ID="ctrlRelatedProducts" runat="server"></nopCommerce:RelatedProducts>
    </div>
</div>
