<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.ContactUsControl"
    CodeBehind="ContactUs.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="SimpleTextBox" Src="~/Modules/SimpleTextBox.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="EmailTextBox" Src="~/Modules/EmailTextBox.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="Topic" Src="~/Modules/Topic.ascx" %>
<div class="contactform">
    <div>
        <nopCommerce:Topic ID="topicContactUs" runat="server" TopicName="ContactUs"></nopCommerce:Topic>
    </div>
    <div class="clear">
    </div>
    <asp:Panel runat="server" ID="pnlResult" Visible="false" CssClass="result">
        <strong>
            <%=GetLocaleResourceString("ContactUs.YourEnquiryHasBeenSent")%></strong>
    </asp:Panel>
    <div class="clear">
    </div>
    <div runat="server" id="pnlContactUs" style="padding-top:15px">
        <table>
            <tr>
                <td>
                    <%=GetLocaleResourceString("ContactUs.FullName")%></strong> :
                </td>
                <td>
                    <nopCommerce:SimpleTextBox runat="server" ID="txtFullName" ValidationGroup="ContactUs"
                        Width="250px"></nopCommerce:SimpleTextBox>
                </td>
            </tr>
             <tr>
                <td>
                    <%=GetLocaleResourceString("ContactUs.E-MailAddress")%> :
                </td>
                <td>
                    <nopCommerce:EmailTextBox runat="server" ID="txtEmail" ValidationGroup="ContactUs"
                        Width="250px"></nopCommerce:EmailTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <%=GetLocaleResourceString("ContactUs.Address")%> :
                </td>
                <td>
                    <nopCommerce:SimpleTextBox runat="server" ID="txtAddress" ValidationGroup="ContactUs"
                        Width="250px"></nopCommerce:SimpleTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <%=GetLocaleResourceString("ContactUs.Tel")%> :
                </td>
                <td>
                    <nopCommerce:SimpleTextBox runat="server" ID="txtTel" ValidationGroup="ContactUs"
                        Width="250px"></nopCommerce:SimpleTextBox>
                </td>
            </tr>           
            <tr>
                <td>
                    <%=GetLocaleResourceString("ContactUs.Subject")%> :
                </td>
                <td>
                    <nopCommerce:SimpleTextBox runat="server" ID="txtSubject" ValidationGroup="ContactUs"
                        Width="250px"></nopCommerce:SimpleTextBox>
                </td>
            </tr>           
            <tr>
                <td>
                    <%=GetLocaleResourceString("ContactUs.Enquiry")%> :
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtEnquiry" TextMode="MultiLine" style="height:150px;width:500px"></asp:TextBox>
                </td>
            </tr>
            <tr>                
                <td colspan="2" align="center">
                    <asp:Button runat="server" ID="btnContactUs" Text="<% $NopResources:ContactUs.ContactUsButton %>"
                        ValidationGroup="ContactUs" OnClick="btnContactUs_Click" >
                    </asp:Button>
                </td>
            </tr>
        </table>
    </div>
</div>
