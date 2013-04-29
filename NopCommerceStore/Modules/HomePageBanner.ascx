<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.HomePageBannerControl"
    CodeBehind="HomePageBanner.ascx.cs" %>
<div id="special1" style="overflow: hidden; position: relative; width: 1000px;">
    <div class="theme-default" style="height: 100%;">
        <div id="slider" class="nivoSlider">
            <asp:Repeater ID="gridtest" runat="server">
                <ItemTemplate>
                    <a href="<%# GetRedirectURL(Convert.ToInt32(Eval("BannerID"))) %>" target="_blank">
                        <img src="<%# GetPictureURL(Convert.ToInt32(Eval("PictureID"))) %>" data-thumb="<%# GetPictureURL(Convert.ToInt32(Eval("PictureID"))) %>"
                            alt="<%#Server.HtmlEncode(Eval("BannerName").ToString())%>" />
                    </a>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    <script type="text/javascript">
        $(window).load(function () {
            $('#slider').nivoSlider();
        });
    </script>
</div>
