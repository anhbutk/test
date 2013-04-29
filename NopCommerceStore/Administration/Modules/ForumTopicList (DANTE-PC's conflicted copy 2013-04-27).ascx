<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Administration.Modules.ForumTopicListControl"
    CodeBehind="ForumTopicList.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="NumericTextBox" Src="NumericTextBox.ascx" %>
<div class="section-header">
    <div class="title">
        <img src="Common/ico-content.png" alt="<%=GetLocaleResourceString("Admin.News.Title")%>" />
        News
    </div>
    <div class="options">
        <input type="button" onclick="location.href='ForumTopicAdd.aspx'" value="<%=GetLocaleResourceString("Admin.News.AddNewButton.Text")%>"
            id="btnAddNew" class="adminButtonBlue" title="<%=GetLocaleResourceString("Admin.News.AddNewButton.Tooltip")%>" />
    </div>
</div>
<p>
</p>
<asp:DropDownList ID="ddlForum" CssClass="adminInput" runat="server" 
    AutoPostBack="True" onselectedindexchanged="ddlForum_SelectedIndexChanged">
</asp:DropDownList>
<p>
</p>
<asp:GridView ID="gvNews" runat="server" AutoGenerateColumns="False" Width="100%"
    OnPageIndexChanging="gvNews_PageIndexChanging" AllowPaging="true" PageSize="15">
    <Columns>
        <asp:BoundField DataField="TopicID" HeaderText="News ID" Visible="False"></asp:BoundField>
        <asp:TemplateField HeaderText="<% $NopResources:Admin.News.Title %>" ItemStyle-Width="30%">
            <ItemTemplate>
                <%#Server.HtmlEncode(Eval("Subject").ToString())%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Video Clip" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
               <%#Server.HtmlEncode(Eval("VideoClip").ToString())%>
            </ItemTemplate>
        </asp:TemplateField>  
         <asp:TemplateField HeaderText="Views" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-Width="5%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
               <%#Server.HtmlEncode(Eval("Views").ToString())%>
            </ItemTemplate>
        </asp:TemplateField> 
         <asp:TemplateField HeaderText="Home Page" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <nopCommerce:ImageCheckBox runat="server" ID="cbPublished" Checked='<%# Eval("HomePage") %>'>
                </nopCommerce:ImageCheckBox>
            </ItemTemplate>
        </asp:TemplateField>     
        <asp:TemplateField HeaderText="<% $NopResources:Admin.News.Published %>" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-Width="5%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <nopCommerce:ImageCheckBox runat="server" ID="cbOnOff" Checked='<%# Eval("OnOff") %>'>
                </nopCommerce:ImageCheckBox>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<% $NopResources:Admin.News.CreatedOn %>" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <%#DateTimeHelper.ConvertToUserTime((DateTime)Eval("CreatedOn")).ToString()%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<% $NopResources:Admin.News.Edit %>" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <a href="ForumTopicAdd.aspx?TopicID=<%#Eval("ForumTopicID")%>" title="<%#GetLocaleResourceString("Admin.News.Edit.Tooltip")%>">
                    <%#GetLocaleResourceString("Admin.News.Edit")%></a>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
