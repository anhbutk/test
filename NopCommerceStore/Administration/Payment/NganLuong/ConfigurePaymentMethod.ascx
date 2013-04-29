<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.Administration.Payment.PhanNu.ConfigurePaymentMethod" Codebehind="ConfigurePaymentMethod.ascx.cs" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<table class="adminContent">
    <tr>
        <td colspan="2" width="100%">
            <hr />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <b>Enter info that will be shown to customers during checkout:</b>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <FCKeditorV2:FCKeditor ID="txtInfo" runat="server" AutoDetectLanguage="false" Height="350">
                
            </FCKeditorV2:FCKeditor>
        </td>
    </tr>
    <tr>
        <td>
            Ngan Luong URL :
        </td>
        <td style="width:85%">
            <asp:TextBox ID="txtURL" runat="server" Width="400px"></asp:TextBox>
        </td>
    </tr>
     <tr>
        <td>
            Merchant Code :
        </td>
        <td>
            <asp:TextBox ID="txtCode" runat="server"></asp:TextBox>
        </td>
    </tr>
     <tr>
        <td>
            Secure Pass :
        </td>
        <td>
            <asp:TextBox ID="txtPass" runat="server"></asp:TextBox>
        </td>
    </tr>
     <tr>
        <td>
            Transact email :
        </td>
        <td>
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        </td>
    </tr>
</table>
