<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Administration.Modules.SalesHomeControl"
    CodeBehind="SalesHome.ascx.cs" %>
<div class="section-title">
    <img src="Common/ico-sales.png" alt="<%=GetLocaleResourceString("Admin.SalesHome.SalesHome")%>" />
    <%=GetLocaleResourceString("Admin.SalesHome.SalesHome")%>
</div>
<div class="homepage">
    <div class="intro">
        <p>
            <%=GetLocaleResourceString("Admin.SalesHome.intro")%>
        </p>
    </div>
    <div class="options">
        <ul>
            <li>
                <div class="title">
                    <a href="Orders.aspx" title="<%=GetLocaleResourceString("Admin.SalesHome.Orders.TitleDescription")%>">
                        <%=GetLocaleResourceString("Admin.SalesHome.Orders.Title")%>
                    </a>
                </div>
                <div class="description">
                    <p>
                        <%=GetLocaleResourceString("Admin.SalesHome.Orders.Description")%>
                    </p>
                </div>
            </li>
            <li>
                <div class="title">
                    <a href="SalesReport.aspx" title="<%=GetLocaleResourceString("Admin.SalesHome.SalesReport.TitleDescription")%>">
                        <%=GetLocaleResourceString("Admin.SalesHome.SalesReport.Title")%></a>
                </div>
                <div class="description">
                    <p>
                        <%=GetLocaleResourceString("Admin.SalesHome.SalesReport.Description")%>
                    </p>
                </div>
            </li>
        </ul>
    </div>
</div>
