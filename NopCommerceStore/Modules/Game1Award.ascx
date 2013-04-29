<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.Game1AwardControl"
    CodeBehind="Game1Award.ascx.cs" %>
<div id="shoppingcart">
    <h2 class="productname">
        <%=GetLocaleResourceString("Game1Play.Title")%></h2>
    <div class="clear">
    </div>
    <div style="text-align: left; padding-top: 15px">
        <%=GetLocaleResourceString("Game1Award.Body")%>
    </div>
    <div class="clear">
    </div>
    <div style="text-align: left; padding-top: 15px">
        <asp:Repeater ID="rptDatetime" runat="server" OnItemCreated="rptDatetime_ItemCreated">
            <ItemTemplate>
                <div id="cauhoi">
                    <div id="noidungcauhoi">
                        <a class="text_bold">
                            <asp:Label ID="lblDatetime" runat="server"></asp:Label>
                        </a>
                    </div>
                    <div id="cautraloi">
                        <table class="table" border="1" style="border: 1px solid grey; padding: 5px; border-collapse: collapse;
                            width: 100%">
                            <thead>
                                <tr>
                                    <th class="header" style="text-align: center; width:10%">
                                        <%=GetLocaleResourceString("ContactUs.AutoNumber")%>
                                    </th>
                                    <th class="header" style="text-align: center; width:30%">
                                        <%=GetLocaleResourceString("ContactUs.FullName")%>
                                    </th>
                                    <th class="header" style="text-align: center; width:40%">
                                        <%=GetLocaleResourceString("ContactUs.Address")%>
                                    </th>
                                    <th class="header" style="text-align: center; width:30%">
                                        <%=GetLocaleResourceString("Game1Award.CompleteDate")%>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rptFullname" runat="server" OnItemCreated="rptFullname_ItemCreated">
                                    <ItemTemplate>
                                        <tr>
                                            <td class="row" style="text-align:center">
                                                <asp:Label ID="lblAutonumber" runat="server"></asp:Label>
                                            </td>
                                            <td class="row" style="text-align:left">
                                                <asp:Label ID="lblFullname" runat="server"></asp:Label>
                                            </td>
                                            <td class="row" style="text-align:left">
                                                <asp:Label ID="lblAddress" runat="server"></asp:Label>
                                            </td>
                                            <td class="row" style="text-align:left">
                                                <asp:Label ID="lblCompleteDate" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>
