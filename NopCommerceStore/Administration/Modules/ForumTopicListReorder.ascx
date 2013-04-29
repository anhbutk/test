<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Administration.Modules.ForumTopicListReorderControl"
    CodeBehind="ForumTopicListReorder.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="NumericTextBox" Src="NumericTextBox.ascx" %>
<div class="section-header">
    <div class="title">
        <img src="Common/ico-content.png" alt="<%=GetLocaleResourceString("Admin.News.Title")%>" />
        News
    </div>
</div>
<p>
</p>
<asp:DropDownList ID="ddlForum" CssClass="adminInput" runat="server" AutoPostBack="True"
    OnSelectedIndexChanged="ddlForum_SelectedIndexChanged">
</asp:DropDownList>
<p>
</p>
<style type="text/css">
    /*Reorder List*/
    .dragHandle
    {
        width: 30px;
        height: 30px;
        cursor: move;
    }
    .callbackStyle
    {
        border: thin blue inset;
    }
    .callbackStyle table
    {
        background-color: #5377A9;
        color: Black;
    }
    .reorderListDemo li
    {
        list-style: none;
        margin: 2px;
        background-repeat: repeat-x;
        border: 1px solid;
    }
    .reorderListDemo li a
    {
        color: grey !important;
        font-weight: bold;
    }
    .reorderCue
    {
        border: dashed thin black;
        width: 100%;
        list-style: none;
    }
    .itemArea
    {
        margin-left: 15px;
        font-family: Arial, Verdana, sans-serif;
        font-size: 1em;
        text-align: left;
    }
</style>
<div class="reorderListDemo">
    <ajaxToolkit:ReorderList ID="ReorderList" runat="server" AllowReorder="True" PostBackOnReorder="false"
        CallbackCssStyle="callbackStyle" DragHandleAlignment="Left"
        DataKeyField="ForumTopicID" SortOrderField="Position"
        Width="650px" OnItemReorder="ReorderList1_ItemReorder">
        <ItemTemplate>
            <asp:Label ID="ID" Visible="false" runat="server" Text='<%# Eval("ForumTopicID") %>'></asp:Label>
            <asp:Label ID="ItemLabel" runat="server" Text='<%#Eval("Subject") %>' />
        </ItemTemplate>
        <ReorderTemplate>
            <asp:Panel ID="Panel1" runat="server" CssClass="reorderCue" />
        </ReorderTemplate>
        <DragHandleTemplate>
            <div style="height: 30px; width: 30px; cursor: move; float: left;">
                <img src="Common/move_64.png" style="height: 20px; width: 20px; margin-top: 5px;" alt="" />
            </div>
        </DragHandleTemplate>
    </ajaxToolkit:ReorderList>
</div>
