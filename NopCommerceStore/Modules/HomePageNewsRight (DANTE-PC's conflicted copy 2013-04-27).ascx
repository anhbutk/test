<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.HomePageNewsRightControl"
    CodeBehind="HomePageNewsRight.ascx.cs" %>
<div id="rightdoor">
    <div id="home_newstitle">
        <ul>
            <asp:HyperLink ID="lbltitle" runat="server" CssClass="tieude"></asp:HyperLink>
        </ul>
    </div>
    <div id="news1_ct">
        <asp:Image ID="imgNews" runat="server" Width="72" />
        <asp:Label ID="lblShortContent" runat="server" CssClass="home_detail"></asp:Label>
    </div>
    <div id="chitieticon">
        <img src="images/iconline.jpg" width="110" height="8" />
        <asp:HyperLink ID="lblViewall" runat="server" CssClass="chitiet"><%=GetLocaleResourceString("News.MoreInfo")%></asp:HyperLink>
    </div>
    <div id="othernews">
        <asp:Repeater ID="rptOther" runat="server">
            <ItemTemplate>
                <img src="images/dot.jpg" width="8" height="6" alt="dot" />
                <a class="other_news" href="NewsDetail.aspx?TopicID=<%#Eval("ForumTopicID")%>">
                    <%#Server.HtmlEncode(Eval("Subject").ToString())%>
                </a>
                <br />
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div id="chitieticon">
        <img src="images/iconline2.jpg" width="85" height="8" />
        <a href="NewsList.aspx" class="chitiet">Các tin khác ></a>
    </div>
</div>
