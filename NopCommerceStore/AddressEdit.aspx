<%@ Page Language="C#" MasterPageFile="~/MasterPages/OneColumnPhanNu.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.AddressEditPage" CodeBehind="AddressEdit.aspx.cs" %>

<%@ Register TagPrefix="nopCommerce" TagName="AddressEdit" Src="~/Modules/AddressEdit.ascx" %>
<asp:Content ID="Content3" ContentPlaceHolderID="cphtitle" runat="Server">   
    <div id="page_dangnhap"></div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server">
<div id="shoppingcart"">
    <div class="productname">
        <asp:Literal runat="server" ID="lHeaderTitle"></asp:Literal>
    </div>
    <div class="clear">        
    </div>
    <br />
    <div class="AddressEditPage">       
        <div class="clear">
        </div>
        <div class="body">
            <nopCommerce:AddressEdit ID="AddressEditControl" runat="server"></nopCommerce:AddressEdit>
            <table width="100%" cellspacing="0" cellpadding="2" border="0">
                <tbody>
                    <tr>
                        <td align="left">
                            <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" />
                        </td>
                        <td align="left">
                            <asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" Text="<% $NopResources:Address.Delete %>"
                                CausesValidation="false" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</asp:Content>
