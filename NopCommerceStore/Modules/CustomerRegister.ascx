<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.CustomerRegisterControl"
    CodeBehind="CustomerRegister.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="Captcha" Src="~/Modules/Captcha.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="Topic" Src="~/Modules/Topic.ascx" %>
<div id="shoppingcart">
    <div class="productname">
        <%=GetLocaleResourceString("Account.Registration")%>
    </div>
    <div class="clear">
    </div>
    <div style="text-align: left;margin-top:10px">
        <asp:CreateUserWizard ID="CreateUserForm" EmailRegularExpression="[\w\.-]+(\+[\w-]*)?@([\w-]+\.)+[\w-]+"
            RequireEmail="False" runat="server" OnCreatedUser="CreatedUser" OnCreatingUser="CreatingUser"
            OnCreateUserError="CreateUserError" FinishDestinationPageUrl="~/Default.aspx"
            ContinueDestinationPageUrl="~/Default.aspx" Width="100%" LoginCreatedUser="true">
            <WizardSteps>
                <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server" Title="">
                    <ContentTemplate>
                        <div style="text-align: left;">
                            <%=GetLocaleResourceString("Account.RegisterInstruction")%>
                        </div>
                        <div style="font-weight: bold; color: red">
                            <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                        </div>
                        <div class="clear">
                        </div>
                        <div style="font-weight: bold; margin-top: 15px;">
                            <%=GetLocaleResourceString("Account.YourPersonalDetails")%>
                        </div>
                        <div class="clear">
                        </div>
                        <div>
                            <table>
                                <tbody>
                                    <tr style="display: none">
                                        <td style="width: 133px">
                                            <%=GetLocaleResourceString("Account.Gender")%>:
                                        </td>
                                        <td>
                                            <asp:RadioButton runat="server" ID="rbGenderM" GroupName="Gender" Text="<% $NopResources:Account.GenderMale %>"
                                                Checked="true" />
                                            <asp:RadioButton runat="server" ID="rbGenderF" GroupName="Gender" Text="<% $NopResources:Account.GenderFemale %>" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 133px">
                                            <%=GetLocaleResourceString("Account.FirstName")%>:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtFirstName" runat="server" MaxLength="40"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName"
                                                ErrorMessage="<% $NopResources:Login.FirstNameRequired %>" ToolTip="<% $NopResources:Login.FirstNameRequired %>" ValidationGroup="CreateUserForm"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <%=GetLocaleResourceString("Account.LastName")%>:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLastName" runat="server" MaxLength="40"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName"
                                                ErrorMessage="<% $NopResources:Login.LastNameRequired %>" ToolTip="<% $NopResources:Login.LastNameRequired %>" ValidationGroup="CreateUserForm"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <%=GetLocaleResourceString("Account.DateOfBirth")%>:
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="txtDateOfBirth" />
                                            <asp:ImageButton runat="Server" ID="iDateOfBirth" ImageUrl="~/images/Calendar_scheduleHS.png"
                                                AlternateText="Click to show calendar" /><br />
                                            <ajaxToolkit:CalendarExtender ID="cDateOfBirthButtonExtender" runat="server" TargetControlID="txtDateOfBirth"
                                                PopupButtonID="iDateOfBirth" />
                                        </td>
                                    </tr>
                                    <%--pnlEmail is visible only when customers are authenticated by usernames and is used to get an email--%>
                                    <tr runat="server" id="pnlEmail">
                                        <td>
                                            <%=GetLocaleResourceString("Account.E-Mail")%>:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Email" runat="server" MaxLength="40"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                                                ErrorMessage="<% $NopResources:Login.E-MailRequired %>" ToolTip="<% $NopResources:Login.E-MailRequired %>" Display="Dynamic"
                                                ValidationGroup="CreateUserForm"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator runat="server" ID="revEmail" Display="Dynamic" ControlToValidate="Email"
                                                ErrorMessage="<% $NopResources:Account.InvalidEmail %>" ToolTip="<% $NopResources:Account.InvalidEmail %>" ValidationExpression="[\w\.-]+(\+[\w-]*)?@([\w-]+\.)+[\w-]+"
                                                ValidationGroup="CreateUserForm"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <%--this table row is used to get an username when customers are authenticated by usernames--%>
                                    <%--this table row is used to get an email when customers are authenticated by emails--%>
                                    <tr>
                                        <td>
                                            <asp:Literal runat="server" ID="lUsernameOrEmail" Text="E-Mail" />:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="UserName" runat="server" MaxLength="40"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="UserNameOrEmailRequired" runat="server" ControlToValidate="UserName"
                                                ErrorMessage="<% $NopResources:Login.E-MailRequired %>" ToolTip="<% $NopResources:Login.E-MailRequired %>" Display="Dynamic"
                                                ValidationGroup="CreateUserForm"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator runat="server" ID="refUserNameOrEmail" Display="Dynamic"
                                                ControlToValidate="UserName" ErrorMessage="<% $NopResources:Account.InvalidEmail %>" ToolTip="<% $NopResources:Account.Account.InvalidEmail %>"
                                                ValidationExpression="[\w\.-]+(\+[\w-]*)?@([\w-]+\.)+[\w-]+" ValidationGroup="CreateUserForm"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div style="font-weight: bold; display: none">
                            <%=GetLocaleResourceString("Account.CompanyDetails")%>
                        </div>
                        <div class="clear">
                        </div>
                        <div style="display: none">
                            <table>
                                <tbody>
                                    <tr>
                                        <td style="width: 133px">
                                            <%=GetLocaleResourceString("Account.CompanyName")%>:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtCompany" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="clear">
                            &nbsp;
                        </div>
                        <div style="font-weight: bold">
                            <%=GetLocaleResourceString("Account.YourAddress")%>
                        </div>
                        <div class="clear">
                        </div>
                        <div>
                            <table>
                                <tbody>
                                    <tr>
                                        <td style="width: 133px">
                                            <%=GetLocaleResourceString("Account.StreetAddress")%>:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtStreetAddress" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvStreetAddress" runat="server" ControlToValidate="txtStreetAddress"
                                                ErrorMessage="<% $NopResources:Login.AddressRequired %>" ToolTip="<% $NopResources:Login.AddressRequired %>"
                                                ValidationGroup="CreateUserForm"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr style="display: none">
                                        <td>
                                            <%=GetLocaleResourceString("Account.StreetAddress2")%>:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtStreetAddress2" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr style="display: none">
                                        <td>
                                            <%=GetLocaleResourceString("Account.PostCode")%>:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtZipPostalCode" runat="server"></asp:TextBox>
                                            <%--<asp:RequiredFieldValidator ID="rfvZipPostalCode" runat="server" ControlToValidate="txtZipPostalCode"
                                                ErrorMessage="Zip / Postal code is required." ToolTip="Zip / Postal code is required."
                                                ValidationGroup="CreateUserForm">*</asp:RequiredFieldValidator>--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <%=GetLocaleResourceString("Account.City")%>:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtCity" runat="server" MaxLength="40"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity"
                                                ErrorMessage="<% $NopResources:Login.CityRequired %>" ToolTip="<% $NopResources:Login.CityRequired %>" ValidationGroup="CreateUserForm"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <%=GetLocaleResourceString("Account.Country")%>:
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlCountry" AutoPostBack="True" runat="server" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged"
                                                Width="137px">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr style="display: none">
                                        <td>
                                            <%=GetLocaleResourceString("Account.StateProvince")%>:
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlStateProvince" AutoPostBack="False" runat="server" Width="137px">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="clear">
                            &nbsp;
                        </div>
                        <div style="font-weight: bold">
                            <%=GetLocaleResourceString("Account.YourContactInformation")%>
                        </div>
                        <div class="clear">
                        </div>
                        <div>
                            <table>
                                <tbody>
                                    <tr>
                                        <td style="width: 133px">
                                            <%=GetLocaleResourceString("Account.TelephoneNumber")%>:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPhoneNumber" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server" ControlToValidate="txtPhoneNumber"
                                                ErrorMessage="<% $NopResources:Login.TelephoneRequired %>" ToolTip="<% $NopResources:Login.TelephoneRequired %>"
                                                ValidationGroup="CreateUserForm"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr style="display: none">
                                        <td>
                                            <%=GetLocaleResourceString("Account.FaxNumber")%>:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtFaxNumber" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="clear">
                            &nbsp;
                        </div>
                        <div style="font-weight: bold">
                            <%=GetLocaleResourceString("Account.Options")%>
                        </div>
                        <div class="clear">
                        </div>
                        <div>
                            <table>
                                <tbody>
                                    <tr>
                                        <td style="width: 133px">
                                            <%=GetLocaleResourceString("Account.Newsletter")%>:
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="cbNewsletter" runat="server" Checked="true"></asp:CheckBox>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="clear">
                            &nbsp;
                        </div>
                        <div style="font-weight: bold">
                            <%=GetLocaleResourceString("Account.YourPassword")%>
                        </div>
                        <div class="clear">
                        </div>
                        <div>
                            <table>
                                <tbody>
                                    <tr>
                                        <td style="width: 133px">
                                            <%=GetLocaleResourceString("Account.Password")%>:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Password" runat="server" MaxLength="50" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                ErrorMessage="<% $NopResources:Login.PasswordRequired %>" ToolTip="<% $NopResources:Login.PasswordRequired %>" ValidationGroup="CreateUserForm"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <%=GetLocaleResourceString("Account.PasswordConfirmation")%>:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword"
                                                ErrorMessage="<% $NopResources:Login.ConfirmPasswordRequired %>" ToolTip='<% $NopResources:Login.ConfirmPasswordRequired %>' ValidationGroup="CreateUserForm"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                                                ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="<% $NopResources:Account.EnteredPasswordsDoNotMatch %>"
                                                ToolTip="<% $NopResources:Account.EnteredPasswordsDoNotMatch %>" ValidationGroup="CreateUserForm"></asp:CompareValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <nopCommerce:Captcha ID="CaptchaCtrl" runat="server" />
                                        </td>
                                    </tr>                                    
                                </tbody>
                            </table>
                        </div>
                        <div class="clear">
                        </div>
                    </ContentTemplate>
                    <CustomNavigationTemplate>
                        <div style="text-align: center">
                            <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" Text="<% $NopResources:Account.RegisterNextStepButton %>"
                                ValidationGroup="CreateUserForm" />
                        </div>
                    </CustomNavigationTemplate>
                </asp:CreateUserWizardStep>
                <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                    <ContentTemplate>
                        <div style="text-align: left; margin-top: 15px">
                            <p>
                                <asp:Label runat="server" ID="lblCompleteStep"></asp:Label>
                            </p>
                            <br />
                            <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" CommandName="Continue"
                                Text="<% $NopResources:Account.RegisterContinueButton %>" ValidationGroup="CreateUserForm" />
                        </div>
                        <div class="clear">
                        </div>
                    </ContentTemplate>
                </asp:CompleteWizardStep>
            </WizardSteps>
        </asp:CreateUserWizard>
        <nopCommerce:Topic ID="topicRegistrationNotAllowed" runat="server" TopicName="RegistrationNotAllowed"
            Visible="false"></nopCommerce:Topic>
    </div>
</div>
