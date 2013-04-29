<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Administration.Modules.CustomerResultInfoControl"
    CodeBehind="CustomerResultInfo.ascx.cs" %>
<%@ Import Namespace="NopSolutions.NopCommerce.BusinessLogic.Game"%>
<%@ Register TagPrefix="nopCommerce" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="SimpleTextBox" Src="SimpleTextBox.ascx" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<table class="adminContent">
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblName" Text="Name" ToolTip="Full name"
                ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:Label ID="lblName1" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblEmail" Text="Email" ToolTip="Email"
                ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:Label ID="lblEmail1" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblCompleteDate" Text="Complete Date"
                ToolTip="Complete Date" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:Label ID="lblCompleteDate1" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblIsCorrectAll" Text="Is Correct All"
                ToolTip="Is Correct All" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:CheckBox ID="cbIsCorrectAll" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblIsWinner" Text="Is Winner" ToolTip="Is Winner"
                ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:CheckBox ID="cbIsWinner" runat="server"></asp:CheckBox>
        </td>
    </tr>
     <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="ToolTipLabel1" Text="Send email winner to customer" ToolTip="Send email winner to customer"
                ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:CheckBox ID="cbSendEmail" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:GridView ID="gvResultDetail" runat="server" AutoGenerateColumns="False" Width="100%"
                OnPageIndexChanging="gvResultDetail_PageIndexChanging" AllowPaging="true" PageSize="15">
                <Columns>
                    <asp:BoundField DataField="CustomerResultDetailID" HeaderText="Customer Result Detail ID" Visible="false">
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Question" ItemStyle-Width="25%">
                        <ItemTemplate>
                            <%#GameManager.GetQuestionByID(int.Parse(Eval("QuestionID").ToString())).QuestionContent%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Answer" ItemStyle-Width="25%">
                        <ItemTemplate>
                            <%#GameManager.GetAnswerByID(int.Parse(Eval("AnswerID").ToString())).AnswerContent%>
                        </ItemTemplate>
                    </asp:TemplateField>                   
                    <asp:TemplateField HeaderText="Is Correct" HeaderStyle-HorizontalAlign="Center"
                        ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <nopCommerce:ImageCheckBox runat="server" ID="cbIsCorrect" Checked='<%# Eval("IsCorrect") %>'>
                            </nopCommerce:ImageCheckBox>
                        </ItemTemplate>
                    </asp:TemplateField>                   
                </Columns>
            </asp:GridView>
        </td>
    </tr>
</table>
