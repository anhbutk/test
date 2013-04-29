<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.FAQControl"
    CodeBehind="FAQ.ascx.cs" %>
<div id="shoppingcart">
    <h2 class="productname">
        <%=GetLocaleResourceString("FAQ.Title")%>
    </h2>
    <div class="clear">
    </div>
    <div style="text-align: left; padding-top: 15px">
        <ajaxToolkit:Accordion ID="FAQList" runat="Server" SelectedIndex="0" HeaderCssClass="question"
            HeaderSelectedCssClass="question" ContentCssClass="answer" AutoSize="None" FadeTransitions="true"
            TransitionDuration="250" FramesPerSecond="40" RequireOpenedPane="false" SuppressHeaderPostbacks="true" Width="640px">                       
        </ajaxToolkit:Accordion>
    </div>
</div>
