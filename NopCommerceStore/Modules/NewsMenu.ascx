<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.NewsMenuControl"
    CodeBehind="NewsMenu.ascx.cs" %>
<div id="menudoc">    
    <ul>
        <asp:Repeater ID="rptForumGroup" runat="server">
            <ItemTemplate>
                <li class="unselected">
                    <div align="left">
                        <a href="<%# SEOHelper.GetNewsListURL(int.Parse(Eval("ForumID").ToString())) %>" title=" <%#Server.HtmlEncode(Eval("Name").ToString())%>">
                            <%#Server.HtmlEncode(Eval("Name").ToString())%>
                        </a>
                    </div>
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
</div>


