<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Administration.Modules.QuestionInMonthControl"
    CodeBehind="QuestionInMonth.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="SimpleTextBox" Src="SimpleTextBox.ascx" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<table class="adminContent">
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblDate" Text="View By Month" ToolTip="View By Month"
                ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
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
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="ToolTipLabel1" Text="Questions" ToolTip="Questions"
                ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:CheckBoxList ID="cbQuestion" runat="server" Width="450px" Height="300px" RepeatLayout="Table"
                BorderStyle="solid" BorderColor="Black" BorderWidth="1px" BackColor="#DFDFDF">
            </asp:CheckBoxList>
        </td>
    </tr>
</table>
