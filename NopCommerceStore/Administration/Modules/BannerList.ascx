<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Administration.Modules.BannerListControl"
    CodeBehind="BannerList.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="NumericTextBox" Src="NumericTextBox.ascx" %>
<div class="section-header">
    <div class="title">
        <img src="Common/ico-content.png" alt="Banner" />
        Banner
    </div>
    <div class="options">
        <input type="button" onclick="location.href='BannerAdd.aspx'" value="<%=GetLocaleResourceString("Admin.News.AddNewButton.Text")%>"
            id="btnAddNew" class="adminButtonBlue" title="<%=GetLocaleResourceString("Admin.News.AddNewButton.Tooltip")%>" />
    </div>
</div>
<p>
</p>
<asp:GridView ID="gvBanner" runat="server" AutoGenerateColumns="False" Width="100%"
    OnPageIndexChanging="gvBanner_PageIndexChanging" AllowPaging="true" PageSize="15">
    <Columns>
        <asp:BoundField DataField="BannerID" HeaderText="Banner ID" Visible="False"></asp:BoundField>
        <asp:TemplateField HeaderText="Banner Name" ItemStyle-Width="30%">
            <ItemTemplate>
                <%#Server.HtmlEncode(Eval("BannerName").ToString())%>
            </ItemTemplate>
        </asp:TemplateField>       
        <asp:TemplateField HeaderText="Image" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-Width="5%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
               <asp:HyperLink ID="defaultImage" runat="server" ImageUrl='<%# GetPictureURL(Convert.ToInt32(Eval("PictureID"))) %>' />
            </ItemTemplate>
        </asp:TemplateField>            
        <asp:TemplateField HeaderText="URL" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-Width="5%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
               <asp:HyperLink ID="defaultImage" runat="server" NavigateUrl='<%#Eval("URL")%>' Text='<%#Eval("URL")%>' Target="_blank" />
            </ItemTemplate>
        </asp:TemplateField>    
        <asp:TemplateField HeaderText="<% $NopResources:Admin.News.Published %>" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-Width="5%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <nopCommerce:ImageCheckBox runat="server" ID="cbOnOff" Checked='<%# Eval("IsPublish") %>'>
                </nopCommerce:ImageCheckBox>
            </ItemTemplate>
        </asp:TemplateField>       
        <asp:TemplateField HeaderText="<% $NopResources:Admin.News.Edit %>" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <a href="BannerAdd.aspx?BannerID=<%#Eval("BannerID")%>" title="<%#GetLocaleResourceString("Admin.News.Edit.Tooltip")%>">
                    <%#GetLocaleResourceString("Admin.News.Edit")%></a>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
