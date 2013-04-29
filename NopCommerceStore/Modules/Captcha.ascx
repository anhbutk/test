<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.CaptchaControl"
    CodeBehind="Captcha.ascx.cs" %>
<img src="<%=Page.ResolveUrl("~/CaptchaImage.aspx")%>" alt="captcha" /><br />
<p>
    <em>
        <%=GetLocaleResourceString("Captcha.EnterTheCode")%></em><br />
    <asp:TextBox ID="txtCode" runat="server"></asp:TextBox>
     <asp:RequiredFieldValidator ID="CaptchaRequired" runat="server" ControlToValidate="txtCode"
            ErrorMessage="<% $NopResources:Captcha.EnterTheCode %>" ToolTip="<% $NopResources:Captcha.EnterTheCode %>" Display="Dynamic"
            ValidationGroup="CreateUserForm"></asp:RequiredFieldValidator>    
</p>
<p>
    <asp:Label ID="txtMessageLabel" runat="server" CssClass="messageError" EnableViewState="false"></asp:Label>
</p>
