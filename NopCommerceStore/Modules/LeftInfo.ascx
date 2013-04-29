<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeftInfo.ascx.cs" Inherits="NopSolutions.NopCommerce.Web.Modules.LeftInfo" %>
<%@ Register TagPrefix="nopCommerce" TagName="EmailTextBox" Src="~/Modules/EmailTextBox.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="BannerList" Src="~/Modules/BannerList.ascx" %>
<div id="thanhchi">
    <asp:LoginView ID="topLoginView" runat="server">
        <AnonymousTemplate>
            <ul>
                <li><a class="tctext" href="<%=Page.ResolveUrl("~/Register.aspx")%>">
                    <%=GetLocaleResourceString("Account.Register")%></a> &nbsp;|&nbsp </li>
                <li><a class="tctext" href="<%=Page.ResolveUrl( CommonHelper.GetLoginPageURL(true, true))%>">
                    <%=GetLocaleResourceString("Account.Login")%></a></li>
            </ul>
            <ul>
                <li>
                    <img src="images/icon_cart.jpg" width="15" height="11" alt="cart" /><a class="number"
                        href="<%=SEOHelper.GetShoppingCartURL()%>">
                        <%=ShoppingCartManager.GetCurrentShoppingCart(ShoppingCartTypeEnum.ShoppingCart).Count%>
                        <%=GetLocaleResourceString("ShoppingCart.Product")%></a></li>
            </ul>
            <ul>
                <li><a class="support">
                    <%=GetLocaleResourceString("Info.OnlineSupport")%></a></li>
            </ul>
            <ul>
                <li><a href="ymsgr:sendIM?phannuhoangcung">
                    <img border="0" src="http://opi.yahoo.com/online?u=phannuhoangcung&amp;t=2" />
                </a></li>
            </ul>
            <ul>
                <li>
                    <img src="images/icon_print.jpg" width="11" height="11" alt="print" /></li>
                <li><a href="#" class="tctext" onclick="window.print();">
                    <%=GetLocaleResourceString("Info.PrintThisPage")%></a></li>
                <li>
                    <img src="images/icon_email.jpg" width="11" height="11" alt="send" /></li>
                <li>
                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="tctext" Text="<% $NopResources:Info.SendToFriend %>" /></li>
            </ul>
            <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender" runat="server" TargetControlID="LinkButton1"
                PopupControlID="Panel1" BackgroundCssClass="modalBackground" 
                OnOkScript="onOk()" CancelControlID="CancelButton" DropShadow="true" />
        </AnonymousTemplate>
        <LoggedInTemplate>
            <ul>
                <li><a class="other_name" href="<%=SEOHelper.GetAccountURL()%>">
                    <%=Page.User.Identity.Name %></a> &nbsp;|&nbsp </li>
                <li><a class="other_name" href="<%=Page.ResolveUrl("~/Logout.aspx")%>" class="ico-logout">
                    <%=GetLocaleResourceString("Account.Logout")%></a> </li>
            </ul>
            <ul>
                <li>
                    <img src="images/icon_cart.jpg" width="15" height="11" alt="cart" /><a class="number"
                        href="<%=SEOHelper.GetShoppingCartURL()%>">
                        <%=ShoppingCartManager.GetCurrentShoppingCart(ShoppingCartTypeEnum.ShoppingCart).Count%>
                        <%=GetLocaleResourceString("ShoppingCart.Product")%></a></li>
            </ul>
            <ul>
                <li><a class="support">
                    <%=GetLocaleResourceString("Info.OnlineSupport")%></a></li>
            </ul>
            <ul>
                <li><a href="ymsgr:sendIM?phannuhoangcung">
                    <img border="0" src="http://opi.yahoo.com/online?u=phannuhoangcung&amp;t=2" />
                </a></li>
            </ul>
            <ul>
                <li>
                    <img src="images/icon_print.jpg" width="11" height="11" alt="print" /></li>
                <li><span class="tctext" onclick="window.print();">
                    <%=GetLocaleResourceString("Info.PrintThisPage")%></span></li>
                <li>
                    <img src="images/icon_email.jpg" width="11" height="11" /></li>
                <li>
                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="tctext" Text="<% $NopResources:Info.SendToFriend %>" />
                </li>
            </ul>
            <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender" runat="server" TargetControlID="LinkButton1"
                PopupControlID="Panel1" BackgroundCssClass="modalBackground"
                CancelControlID="CancelButton" DropShadow="true" />
        </LoggedInTemplate>
    </asp:LoginView>
</div>
<nopCommerce:BannerList ID="ctrlBannerList" runat="server" />
<asp:Panel ID="Panel1" runat="server" Style="display: none">
    <div id="contain_popup">
        <div align="center" id="form_guibanbe">
            <div id="formbgTop">
            </div>
            <div id="formbgMiddle">
                <div id="box_name2">
                    <a class="name"><%=GetLocaleResourceString("Products.FriendName")%>:</a></div>
                <div id="box2">
                    <asp:TextBox ID="txtFriendName" runat="server" Width="250px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="validationFriendName" runat="server" ControlToValidate="txtFriendName" ForeColor="Red" Display="Dynamic"
                    SetFocusOnError="true" Text="*" ValidationGroup="SendToFriend"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div id="formbgMiddle">
                <div id="box_name2">
                    <a class="name">
                        <%=GetLocaleResourceString("Products.FriendEmail")%>:</a></div>
                <div id="box2">
                    <nopCommerce:EmailTextBox runat="server" ID="txtFriendsEmail" ValidationGroup="SendToFriend"
                        Width="250px"></nopCommerce:EmailTextBox>
                </div>
            </div>
            <div id="formbgMiddle">
                <div id="box_name2">
                    <a class="name"><%=GetLocaleResourceString("Products.YourName")%>:</a></div>
                <div id="box2">
                    <asp:TextBox ID="txtYourName" runat="server" Width="250px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="validationYourName" runat="server" ControlToValidate="txtYourName" ForeColor="Red" Display="Dynamic"
                    SetFocusOnError="true" Text="*" ValidationGroup="SendToFriend"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div id="formbgMiddle">
                <div id="box_name2">
                    <a class="name">
                        <%=GetLocaleResourceString("Products.EmailAFriend.YourEmailAddress")%>:</a></div>
                <div id="box2">
                    <nopCommerce:EmailTextBox runat="server" ID="txtYourEmail" ValidationGroup="SendToFriend"
                        Width="250px"></nopCommerce:EmailTextBox>
                </div>
            </div>
            <div id="formbgMiddle">
                <div id="box_name2">
                    <a class="name">
                        <%=GetLocaleResourceString("Products.EmailAFriend.PersonalMessage")%>:</a></div>
                <div id="box2">
                    <asp:TextBox runat="server" ID="txtPersonalMessage" TextMode="MultiLine" Height="150px"
                        Width="250px"></asp:TextBox></div>
            </div>
            <div id="formbgMiddle">
                <div id="box_name2">
                </div>
                <div id="form_btn">
                    <asp:Button runat="server" ID="OkButton" Text="<% $NopResources:Products.EmailAFriendButton %>"
                        CssClass="textbutton1" onclick="OkButton_Click"  ValidationGroup="SendToFriend" />
                    <asp:Button runat="server" ID="CancelButton" Text="<% $NopResources:Products.EmailAFriendCancelButton %>" CssClass="textbutton1" />
                </div>
            </div>
            <div id="formbgBottom">
            </div>
        </div>
    </div>
</asp:Panel>
