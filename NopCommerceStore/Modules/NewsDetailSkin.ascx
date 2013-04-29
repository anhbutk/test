<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.NewsDetailSkinControl"
    CodeBehind="NewsDetailSkin.ascx.cs" %>
<div id="shoppingcart">
    <div class="productname">
        <table style="width: 100%;">
            <tr>
                <td style="text-align: left; vertical-align: middle;">
                    <asp:Label ID="lblTitle" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <div class="clear">
    </div>
    <div id="phongsuchinh">
        <div id="tenphongsuchinh">
            <asp:Label ID="lblTieude" runat="server" CssClass="tieudephongsuchinh"></asp:Label>
        </div>
        <div id="freetext1">
           <asp:Literal ID="litVideo" runat="server"></asp:Literal>
           <br />
            <asp:Label ID="lblNoidung" runat="server" CssClass="text"></asp:Label>
        </div>
    </div>
    <div class="clear">
    </div>
    <br />
    <div>
        <!-- AddThis Button BEGIN -->
        <div class="addthis_toolbox addthis_default_style addthis_32x32_style">
            <a class="addthis_button_preferred_1"></a><a class="addthis_button_preferred_2">
            </a><a class="addthis_button_preferred_3"></a><a class="addthis_button_preferred_4">
            </a><a class="addthis_button_compact"></a><a class="addthis_counter addthis_bubble_style">
            </a>
        </div>
        <script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js#pubid=xa-50543e486ccfca54"></script>
        <!-- AddThis Button END -->
    </div>
    <asp:Panel ID="pnlTinkhac" runat="server">
        <div id="phongsukhac">
            <a class="other_title">
                <%=GetLocaleResourceString("News.OtherNews")%></a>
        </div>
    </asp:Panel>
    <asp:DataGrid ID="gridtest" runat="server" AllowPaging="true" AutoGenerateColumns="false"
        GridLines="None" OnPageIndexChanged="gridtest_PageIndexChanged" PageSize="5"
        ShowHeader="false">
        <PagerStyle CssClass="phantrang" HorizontalAlign="Center" Mode="NumericPages" NextPageText="Next"
            PrevPageText="Previous" VerticalAlign="Middle" />
        <Columns>
            <asp:TemplateColumn>
                <ItemTemplate>
                    <div id="tenphongsukhac">
                        <img src="images/dot.jpg" width="8" height="6" alt="icon" />
                        <a href="<%# SEOHelper.GetNewsURL(int.Parse(Eval("ForumTopicID").ToString())) %>" class="other_event" title="<%#Eval("Subject")%>">
                            <%#Eval("Subject")%>
                        </a>
                    </div>
                </ItemTemplate>
            </asp:TemplateColumn>
        </Columns>
    </asp:DataGrid>
</div>
