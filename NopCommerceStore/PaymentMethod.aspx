<%@ Page Language="C#" MasterPageFile="~/MasterPages/TwoColumnPhanNu.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.PaymentMethodPage" Codebehind="PaymentMethod.aspx.cs" %>

<%@ Register TagPrefix="nopCommerce" TagName="Topic" Src="~/Modules/Topic.ascx" %>
<asp:Content ID="Content3" ContentPlaceHolderID="cphtitle" runat="Server">   
    <div id="page_cachinhthucthanhtoan"></div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server">
    <nopCommerce:Topic ID="topicPrivacyInfo" runat="server" TopicName="PaymentMethod">
    </nopCommerce:Topic>
</asp:Content>
