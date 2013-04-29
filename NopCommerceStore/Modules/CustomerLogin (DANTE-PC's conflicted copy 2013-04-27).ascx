<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.CustomerLoginControl"
    CodeBehind="CustomerLogin.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="Captcha" Src="~/Modules/Captcha.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="Topic" Src="~/Modules/Topic.ascx" %>
<div id="shoppingcart"">
    <div class="productname">
        <%=GetLocaleResourceString("Login.Welcome")%>
    </div>
    <div class="clear">        
    </div>
    <br />
    <asp:Label ID="lblAlert" runat="server"></asp:Label>
    <div>
        <asp:Panel ID="pnlLogin" runat="server" DefaultButton="LoginForm$LoginButton">
            <asp:Login ID="LoginForm" TitleText="" OnLoggedIn="OnLoggedIn" OnLoggingIn="OnLoggingIn"
                runat="server" CreateUserUrl="~/Register.aspx" DestinationPageUrl="~/Default.aspx"
                OnLoginError="OnLoginError" RememberMeSet="True" FailureText="<% $NopResources:Login.FailureText %>">
                <LayoutTemplate>
                    <table cellspacing="5px">
                        <tbody style="text-align: left">
                            <tr>
                                <td>
                                    <asp:Literal runat="server" ID="lUsernameOrEmail" Text="E-Mail" />:
                                </td>
                                <td>
                                    <asp:TextBox ID="UserName" runat="server" Width="200px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameOrEmailRequired" runat="server" ControlToValidate="UserName"
                                        ErrorMessage="Username is required." ToolTip="Username is required." ValidationGroup="ctl00$LoginForm">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Literal runat="server" ID="lPassword" Text="<% $NopResources:Login.Password %>" />:
                                </td>
                                <td>
                                    <asp:TextBox ID="Password" TextMode="Password" runat="server" MaxLength="50" Width="200px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                        ErrorMessage="<% $NopResources:Login.PasswordRequired %>" ToolTip="<% $NopResources:Login.PasswordRequired %>"
                                        ValidationGroup="ctl00$LoginForm">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:CheckBox ID="RememberMe" runat="server" Text="<% $NopResources:Login.RememberMe %>">
                                    </asp:CheckBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:HyperLink ID="hlForgotPassword" runat="server" NavigateUrl="~/PasswordRecovery.aspx"
                                        Text="<% $NopResources:Login.ForgotPassword %>" CssClass="text_bold"></asp:HyperLink>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <nopCommerce:Captcha ID="CaptchaCtrl" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <div>
                                        <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="<% $NopResources:Login.LoginButton %>"
                                            ValidationGroup="ctl00$LoginForm" />
                                        <asp:Button runat="server" ID="btnRegister" Text="<% $NopResources:Account.Register %>"
                                            OnClick="btnRegister_Click" />
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </LayoutTemplate>
            </asp:Login>
        </asp:Panel>
    </div>
    <div class="clear">
        &nbsp;
    </div>
    <div style="text-align: left; padding-top: 15px">
        <asp:Label ID="lblInstruction" runat="server"></asp:Label>
    </div>
</div>
