<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Administration.Modules.CustomerResultControl"
    CodeBehind="CustomerResult.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="NumericTextBox" Src="NumericTextBox.ascx" %>
<div class="section-header">
    <div class="title">
        <img src="Common/ico-content.png" alt="Game Answer" />
        Customer Result
    </div>
</div>
<p>
</p>
View by date &nbsp;&nbsp;
<asp:DropDownList ID="drpYear" runat="server">
    <asp:ListItem Text="Year" Value="0">           
    </asp:ListItem>
    <asp:ListItem Text="2010" Value="2010">           
    </asp:ListItem>
    <asp:ListItem Text="2011" Value="2011">           
    </asp:ListItem>
    <asp:ListItem Text="2012" Value="2012">           
    </asp:ListItem>
    <asp:ListItem Text="2013" Value="2013">           
    </asp:ListItem>
    <asp:ListItem Text="2014" Value="2014">           
    </asp:ListItem>
    <asp:ListItem Text="2015" Value="2015">           
    </asp:ListItem>
    <asp:ListItem Text="2016" Value="2016">           
    </asp:ListItem>
    <asp:ListItem Text="2017" Value="2017">           
    </asp:ListItem>
    <asp:ListItem Text="2018" Value="2018">           
    </asp:ListItem>
    <asp:ListItem Text="2019" Value="2019">           
    </asp:ListItem>
    <asp:ListItem Text="2020" Value="2020">           
    </asp:ListItem>
    <asp:ListItem Text="2021" Value="2021">           
    </asp:ListItem>
    <asp:ListItem Text="2022" Value="2022">           
    </asp:ListItem>
</asp:DropDownList>
&nbsp;&nbsp;
<asp:DropDownList ID="drpMonth" runat="server">
    <asp:ListItem Text="Month" Value="0">           
    </asp:ListItem>
    <asp:ListItem Text="January" Value="1">           
    </asp:ListItem>
    <asp:ListItem Text="February" Value="2">           
    </asp:ListItem>
    <asp:ListItem Text="March" Value="3">           
    </asp:ListItem>
    <asp:ListItem Text="April" Value="4">           
    </asp:ListItem>
    <asp:ListItem Text="May" Value="5">           
    </asp:ListItem>
    <asp:ListItem Text="June" Value="6">           
    </asp:ListItem>
    <asp:ListItem Text="July" Value="7">           
    </asp:ListItem>
    <asp:ListItem Text="August" Value="8">           
    </asp:ListItem>
    <asp:ListItem Text="September" Value="9">           
    </asp:ListItem>
    <asp:ListItem Text="October" Value="10">           
    </asp:ListItem>
    <asp:ListItem Text="November" Value="11">           
    </asp:ListItem>
    <asp:ListItem Text="December" Value="12">           
    </asp:ListItem>
</asp:DropDownList>
&nbsp;&nbsp
<asp:Button ID="btnView" runat="server" Text="View" class="adminButtonBlue" OnClick="btnView_Click" />
<asp:Button ID="btnViewTop3" runat="server" Text="View Top 3" class="adminButtonBlue" OnClick="btnViewTop3_Click" />
&nbsp;&nbsp Total :
<asp:Label ID="lblTotal" runat="server"></asp:Label>
<p>
</p>
<asp:GridView ID="gvResult" runat="server" AutoGenerateColumns="False" Width="100%"
    OnPageIndexChanging="gvResult_PageIndexChanging" AllowPaging="true" PageSize="15">
    <Columns>
        <asp:BoundField DataField="CustomerResultID" HeaderText="Customer Result ID" Visible="false">
        </asp:BoundField>
        <asp:TemplateField HeaderText="Name" ItemStyle-Width="25%">
            <ItemTemplate>
                <%#CustomerManager.GetCustomerByID(int.Parse(Eval("CustomerID").ToString())).FullName%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Email" ItemStyle-Width="25%">
            <ItemTemplate>
                <%#CustomerManager.GetCustomerByID(int.Parse(Eval("CustomerID").ToString())).Email%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Complete Date" ItemStyle-Width="20%">
            <ItemTemplate>
                <%#Server.HtmlEncode(Eval("CompleteDate").ToString())%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Is Correct All" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <nopCommerce:ImageCheckBox runat="server" ID="cbIsCorrectAll" Checked='<%# Eval("IsCorrectAll") %>'>
                </nopCommerce:ImageCheckBox>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Is Winner" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="10%"
            ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <nopCommerce:ImageCheckBox runat="server" ID="cbIsWinner" Checked='<%# Eval("IsWinner") %>'>
                </nopCommerce:ImageCheckBox>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="View Answer" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <a href="CustomerResultDetail.aspx?ID=<%#Eval("CustomerResultID")%>" title="View Answer">
                    View</a>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
