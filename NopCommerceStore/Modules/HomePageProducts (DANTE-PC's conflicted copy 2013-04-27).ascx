<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.HomePageProductsControl"
    CodeBehind="HomePageProducts.ascx.cs" %>
<div id="special" style="overflow: hidden; position: relative; width: 1000px;">
    <div class="sliceMenu">
        <ul class="selectList" style="list-style: none outside none; overflow: hidden; width: 10000px;">
            <asp:Repeater ID="dlCatalog" runat="server" OnItemDataBound="dlRelatedProducts_ItemDataBound">
                <ItemTemplate>
                    <li class="png" style="display: block; float: left; padding-left: 15px;
                        padding-right: 5px; text-align: left; width: 280px;">
                        <div id="specialproduct">
                            <asp:HyperLink ID="hlImageLink" runat="server" />
                            <asp:HyperLink ID="hlProduct" runat="server" CssClass="home_sp_name" />
                            <p>
                                <a class="special_detail"><asp:Label ID="lblShortDes" runat="server"></asp:Label></a>
                            </p>
                        </div>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
    <a href="#" class="previousButton png" style="background-position: 0 0; left: 23px;
        position: absolute; top: 70px; display: block; height: 40px; width: 22px;">
        <img src="images/leftscroll.jpg" name="Image22" width="12" height="32" border="0"
            id="Image22" /></a><a href="#" class="nextButton png" style="background-position: 0 -40px;
                left: 947px; position: absolute; top: 70px; display: block; height: 40px; width: 22px;">
                <img src="images/rightscroll.jpg" name="Image23" width="12" height="32" border="0"
                    id="Image23" /></a>
</div>
