<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Administration.Modules.FAQControl"
    CodeBehind="FAQ.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="NumericTextBox" Src="NumericTextBox.ascx" %>
<div class="section-header">
    <div class="title">
        <img src="Common/ico-content.png" alt="<%=GetLocaleResourceString("Admin.News.Title")%>" />
        <%=GetLocaleResourceString("Admin.News.Title")%>
    </div>
    <div class="options">
        <input type="button" onclick="location.href='FAQDetail.aspx'" value="<%=GetLocaleResourceString("Admin.News.AddNewButton.Text")%>"
            id="btnAddNew" class="adminButtonBlue" title="<%=GetLocaleResourceString("Admin.News.AddNewButton.Tooltip")%>" />
    </div>
</div>
<p>
</p>
<asp:GridView ID="gvFAQ1" runat="server" AutoGenerateColumns="False" Width="100%"
    OnPageIndexChanging="gvFAQ_PageIndexChanging" AllowPaging="true" PageSize="15">
    <Columns>
        <asp:BoundField DataField="FAQID" HeaderText="FAQ ID" Visible="False"></asp:BoundField>
        <asp:TemplateField HeaderText="Question" ItemStyle-Width="25%">
            <ItemTemplate>
                <%#Server.HtmlEncode(Eval("Question").ToString())%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Answer" ItemStyle-Width="50%">
            <ItemTemplate>
                <%#Server.HtmlEncode(Eval("Answer").ToString())%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Display Order" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-Width="35%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <%#((Int32)Eval("DisplayOrder"))%>
            </ItemTemplate>
        </asp:TemplateField>        
        <asp:TemplateField HeaderText="<% $NopResources:Admin.News.Published %>" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <nopCommerce:ImageCheckBox runat="server" ID="cbPublished" Checked='<%# Eval("OnOff") %>'>
                </nopCommerce:ImageCheckBox>
            </ItemTemplate>
        </asp:TemplateField>        
        <asp:TemplateField HeaderText="<% $NopResources:Admin.News.Edit %>" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <a href="FAQDetail.aspx?FAQID=<%#Eval("FAQID")%>" title="<%#GetLocaleResourceString("Admin.News.Edit.Tooltip")%>">
                    <%#GetLocaleResourceString("Admin.News.Edit")%></a>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
