<%@ Page Language="C#" MasterPageFile="~/MasterPages/TwoColumnPhanNu.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.ContactUsPage" Codebehind="ContactUs.aspx.cs" ValidateRequest="false" %>

<%@ Register TagPrefix="nopCommerce" TagName="ContactUs" Src="~/Modules/ContactUs.ascx" %>
<asp:Content ID="Content3" ContentPlaceHolderID="cphtitle" runat="Server">   
    <div id="page_lienhe"></div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server">
    <nopCommerce:ContactUs ID="ctrlContactUs" runat="server" />
</asp:Content>
