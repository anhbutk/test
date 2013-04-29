<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.NewsMenuControl"
    CodeBehind="NewsMenu.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="BannerList" Src="~/Modules/BannerList.ascx" %>
<div id="menudoc">    
    <ul>
        <asp:Repeater ID="rptForumGroup" runat="server">
            <ItemTemplate>
                <li class="unselected">
                    <div align="left">
                        <a href="NewsList.aspx?ForumID=<%# Eval("ForumID")%>">
                            <%#Server.HtmlEncode(Eval("Name").ToString())%>
                        </a>
                    </div>
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
</div>
<br />
<nopCommerce:BannerList ID="ctrlBannerList1" runat="server" />
