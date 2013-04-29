<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Administration.Modules.QuestionControl"
    CodeBehind="Question.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="NumericTextBox" Src="NumericTextBox.ascx" %>
<div class="section-header">
    <div class="title">
        <img src="Common/ico-content.png" alt="Game Question" />
        Question
    </div>
    <div class="options">
        <input type="button" onclick="location.href='QuestionDetail.aspx'" value="<%=GetLocaleResourceString("Admin.News.AddNewButton.Text")%>"
            id="btnAddNew" class="adminButtonBlue" title="<%=GetLocaleResourceString("Admin.News.AddNewButton.Tooltip")%>" />
    </div>
</div>
<p>
</p>
<asp:GridView ID="gvQuestion" runat="server" AutoGenerateColumns="False" Width="100%"
    OnPageIndexChanging="gvQuestion_PageIndexChanging" AllowPaging="true" PageSize="15">
    <Columns>
        <asp:BoundField DataField="QuestionID" HeaderText="Question ID"></asp:BoundField>
        <asp:TemplateField HeaderText="Question Content" ItemStyle-Width="50%">
            <ItemTemplate>
                <%#Server.HtmlEncode(Eval("QuestionContent").ToString())%>
            </ItemTemplate>
        </asp:TemplateField>              
        <asp:TemplateField HeaderText="<% $NopResources:Admin.News.Published %>" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <nopCommerce:ImageCheckBox runat="server" ID="cbPublished" Checked='<%# Eval("OnOff") %>'>
                </nopCommerce:ImageCheckBox>
            </ItemTemplate>
        </asp:TemplateField> 
         <asp:TemplateField HeaderText="Answer" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <a href="Answer.aspx?QuestionID=<%#Eval("QuestionID")%>" title="View Answer">
                    Answer</a>
            </ItemTemplate>
        </asp:TemplateField>       
        <asp:TemplateField HeaderText="<% $NopResources:Admin.News.Edit %>" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <a href="QuestionDetail.aspx?ID=<%#Eval("QuestionID")%>" title="<%#GetLocaleResourceString("Admin.News.Edit.Tooltip")%>">
                    <%#GetLocaleResourceString("Admin.News.Edit")%></a>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
