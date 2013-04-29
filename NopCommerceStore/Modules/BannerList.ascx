<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.BannerListControl"
    CodeBehind="BannerList.ascx.cs" %>
<div id="bannerlist">
    <asp:DataGrid ID="gridtest" runat="server" AutoGenerateColumns="false" GridLines="None"
        ShowHeader="false">
        <Columns>
            <asp:TemplateColumn>
                <ItemTemplate>
                    <div id="banner">
                        <a href="<%# GetRedirectURL(Convert.ToInt32(Eval("BannerID"))) %>" target="_blank">
                            <img src="<%# GetPictureURL(Convert.ToInt32(Eval("PictureID"))) %>" alt="<%#Server.HtmlEncode(Eval("BannerName").ToString())%>" />
                        </a>
                    </div>
                </ItemTemplate>
            </asp:TemplateColumn>
        </Columns>
    </asp:DataGrid>
</div>
