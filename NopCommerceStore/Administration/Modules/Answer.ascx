<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Administration.Modules.AnswerControl"
    CodeBehind="Answer.ascx.cs" %>
<%@ Import Namespace="NopSolutions.NopCommerce.BusinessLogic.Game"%>
<%@ Register TagPrefix="nopCommerce" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="NumericTextBox" Src="NumericTextBox.ascx" %>
<div class="section-header">
    <div class="title">
        <img src="Common/ico-content.png" alt="Game Answer" />
        Answer
    </div>
    <div class="options">
        <input type="button" onclick="location.href='AnswerDetail.aspx'" value="<%=GetLocaleResourceString("Admin.News.AddNewButton.Text")%>"
            id="btnAddNew" class="adminButtonBlue" title="<%=GetLocaleResourceString("Admin.News.AddNewButton.Tooltip")%>" />
    </div>
</div>
<p>
</p>
<asp:GridView ID="gvAnswer" runat="server" AutoGenerateColumns="False" Width="100%"
    OnPageIndexChanging="gvAnswer_PageIndexChanging" AllowPaging="true" PageSize="15">
    <Columns>
        <asp:BoundField DataField="AnswerID" HeaderText="Answer ID" Visible="false"></asp:BoundField>
        <asp:TemplateField HeaderText="Question" ItemStyle-Width="40%">
            <ItemTemplate>
                <%#GameManager.GetQuestionByID(int.Parse(Eval("QuestionID").ToString())).QuestionContent%>
            </ItemTemplate>
        </asp:TemplateField>             
        <asp:TemplateField HeaderText="Answer Content" ItemStyle-Width="40%">
            <ItemTemplate>
                <%#Server.HtmlEncode(Eval("AnswerContent").ToString())%>
            </ItemTemplate>
        </asp:TemplateField>              
        <asp:TemplateField HeaderText="Is Correct" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <nopCommerce:ImageCheckBox runat="server" ID="cbPublished" Checked='<%# Eval("IsCorrect") %>'>
                </nopCommerce:ImageCheckBox>
            </ItemTemplate>
        </asp:TemplateField>         
        <asp:TemplateField HeaderText="<% $NopResources:Admin.News.Edit %>" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <a href="AnswerDetail.aspx?ID=<%#Eval("AnswerID")%>" title="<%#GetLocaleResourceString("Admin.News.Edit.Tooltip")%>">
                    <%#GetLocaleResourceString("Admin.News.Edit")%></a>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
