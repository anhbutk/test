<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.HomePageNewsLeftControl"
    CodeBehind="HomePageNewsLeft.ascx.cs" %>
<div id="leftdoor">
    <div id="video">
        <p id="player1">
            <object type="application/x-shockwave-flash" data="/files/FlvPlayer/player_flv_maxi.swf" 
            width="171" height="150">                 
                 <param name="movie" value="/files/FlvPlayer/player_flv_maxi.swf" />    
                 <param name="allowFullScreen" value="true" />             
                 <param name="FlashVars" value="flv=/Uploaded/VideoClip/<%= FileName() %>&amp;bgcolor=860000&amp;bgcolor1=860000&amp;bgcolor2=550E08&amp;showfullscreen=1&amp;playercolor=860000&amp;autoplay=1&amp;buttoncolor=F3C476&amp;slidercolor1=F3C476" />
            </object>
</p>      
    </div>
    <div align="justify" id="homelefttext">
        <asp:Label ID="lblShortContent" runat="server" CssClass="home_detail"></asp:Label>
    </div>
    <div id="chitieticon">
        <img src="images/iconline3.jpg" width="110" height="8" />
        <asp:HyperLink ID="lblViewall" runat="server" CssClass="chitiet"><%=GetLocaleResourceString("News.MoreInfo")%></asp:HyperLink>
    </div>
</div>
