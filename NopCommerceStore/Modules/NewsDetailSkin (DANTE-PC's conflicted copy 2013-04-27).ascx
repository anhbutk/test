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
            <asp:Label ID="lblNoidung" runat="server" CssClass="text"></asp:Label>
        </div>
    </div>
    <div id="phongsukhac">
        <a class="other_title">
            <%=GetLocaleResourceString("News.OtherNews")%></a>
    </div>
    <asp:DataGrid ID="gridtest" runat="server" AllowPaging="true" AutoGenerateColumns="false"
        GridLines="None" OnPageIndexChanged="gridtest_PageIndexChanged" PageSize="5" ShowHeader=false>
        <PagerStyle CssClass="phantrang" HorizontalAlign="Center" Mode="NumericPages" NextPageText="Next"
            PrevPageText="Previous" VerticalAlign="Middle" />
        <Columns>
            <asp:TemplateColumn>
                <ItemTemplate>                   
                    <div id="tenphongsukhac">
                        <img src="images/dot.jpg" width="8" height="6" alt="icon" />
                        <a href="NewsDetail.aspx?TopicID=<%#Eval("ForumTopicID")%>" class="other_event">
                            <%#Eval("Subject")%>
                        </a>
                    </div>
                </ItemTemplate>
            </asp:TemplateColumn>
        </Columns>
    </asp:DataGrid>
</div>
