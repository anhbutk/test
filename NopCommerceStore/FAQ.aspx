<%@ Page Language="C#" MasterPageFile="~/MasterPages/TwoColumnPhanNu.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.FAQPage" Codebehind="FAQ.aspx.cs" %>

<%@ Register TagPrefix="nopCommerce" TagName="FAQ" Src="~/Modules/FAQ.ascx" %>
<asp:Content ID="Content3" ContentPlaceHolderID="cphtitle" runat="Server">   
    <div id="page_hoidap"></div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server">
    <nopCommerce:FAQ ID="FAQ" runat="server">
    </nopCommerce:FAQ>
</asp:Content>
