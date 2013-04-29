<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.ProductInfoControl"
    CodeBehind="ProductInfo.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductVariantsInGrid" Src="~/Modules/ProductVariantsInGrid.ascx" %>

<script language="javascript" type="text/javascript">
    function UpdateMainImage(url) {
        var imgMain = document.getElementById('<%=defaultImage.ClientID%>');
        imgMain.src = url;
    }
</script>


    <div class="picture">
        <asp:Image ID="defaultImage" runat="server" />
    </div>
    <div class="overview">
        <h3 class="productname">
            <asp:Literal ID="lProductName" runat="server" />
        </h3>
        <br />
        <div class="shortdescription">
            <asp:Literal ID="lblProductCode" runat="server" />
        </div>
        <br />
        <div class="shortdescription">
            <asp:Literal ID="lShortDescription" runat="server" />
        </div>
        <asp:ListView ID="lvProductPictures" runat="server" GroupItemCount="3">
            <LayoutTemplate>
                <table>
                    <asp:PlaceHolder runat="server" ID="groupPlaceHolder"></asp:PlaceHolder>
                </table>
            </LayoutTemplate>
            <GroupTemplate>
                <tr>
                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder"></asp:PlaceHolder>
                </tr>
            </GroupTemplate>
            <ItemTemplate>
                <td align="left">
                    <a href="<%#PictureManager.GetPictureUrl((int)Eval("PictureID"))%>" rel="lightbox-p"
                        title="<%= lProductName.Text%>">
                        <img src="<%#PictureManager.GetPictureUrl((int)Eval("PictureID"), 70)%>" alt="Product image" /></a>
                </td>
            </ItemTemplate>
        </asp:ListView>
        <nopCommerce:ProductVariantsInGrid ID="ctrlProductVariantsInGrid" runat="server">
        </nopCommerce:ProductVariantsInGrid>
    </div>
    <div class="fulldescription">
        <asp:Literal ID="lFullDescription" runat="server" />
    </div>
    <div>
    <!-- AddThis Button BEGIN -->
    <div class="addthis_toolbox addthis_default_style addthis_32x32_style">
    <a class="addthis_button_preferred_1"></a>
    <a class="addthis_button_preferred_2"></a>
    <a class="addthis_button_preferred_3"></a>
    <a class="addthis_button_preferred_4"></a>
    <a class="addthis_button_compact"></a>
    <a class="addthis_counter addthis_bubble_style"></a>
    </div>
    <script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js#pubid=xa-50543e486ccfca54"></script>
    <!-- AddThis Button END -->
    </div>

