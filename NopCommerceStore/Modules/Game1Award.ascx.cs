//------------------------------------------------------------------------------
// The contents of this file are subject to the nopCommerce Public License Version 1.0 ("License"); you may not use this file except in compliance with the License.
// You may obtain a copy of the License at  http://www.nopCommerce.com/License.aspx. 
// 
// Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. 
// See the License for the specific language governing rights and limitations under the License.
// 
// The Original Code is nopCommerce.
// The Initial Developer of the Original Code is NopSolutions.
// All Rights Reserved.
// 
// Contributor(s): _______. 
//------------------------------------------------------------------------------

using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using NopSolutions.NopCommerce.BusinessLogic;
using NopSolutions.NopCommerce.BusinessLogic.Configuration.Settings;
using NopSolutions.NopCommerce.BusinessLogic.Content.Blog;
using NopSolutions.NopCommerce.BusinessLogic.Content.Topics;
using NopSolutions.NopCommerce.BusinessLogic.Game;
using NopSolutions.NopCommerce.BusinessLogic.Localization;
using NopSolutions.NopCommerce.BusinessLogic.Messages;
using AjaxControlToolkit;


namespace NopSolutions.NopCommerce.Web.Modules
{
    public partial class Game1AwardControl : BaseNopUserControl
    {
        protected override void OnInit(EventArgs e)
        {
            BindData();
            base.OnInit(e);

        }

        private void BindData()
        {
            var tableYear = GameManager.GetDistinctCustomerResultByYear();
            for (int i = 0; i < tableYear.Rows.Count; i++)
            {
                var row = tableYear.Rows[i];

                var pane = new AccordionPane();
                pane.ID = row["Year"].ToString();
                pane.HeaderContainer.Controls.Add(new LiteralControl(row["Year"].ToString()));

                var tableMonthYear = GameManager.GetDistinctCustomerResultByMonthYear();
                DataRow[] result = tableMonthYear.Select("Year = " + row["Year"]);
                foreach (DataRow rowInner in result)
                {
                    string content = "<div id=\"cauhoi\">";
                    content += "<div id=\"noidungcauhoi\">";
                    content += "<a class=\"text_bold\">";
                    content += "Tháng " + rowInner["Month"] + " năm " + rowInner["Year"];
                    content += "</a>";
                    content += "</div>";
                    content += "<div id=\"cautraloi\">";
                    content += "<table class=\"table\" border=\"1\" style=\"border: 1px solid grey; padding: 5px; border-collapse: collapse ;width: 100%\">";
                    content += "<thead>";
                    content += "<tr>";
                    content += "<th class=\"header\" style=\"text-align: center; width:10%\">";
                    content += GetLocaleResourceString("ContactUs.AutoNumber");
                    content += "</th>";
                    content += "<th class=\"header\" style=\"text-align: center; width:30%\">";
                    content += GetLocaleResourceString("ContactUs.FullName");
                    content += "</th>";
                    content += "<th class=\"header\" style=\"text-align: center; width:40%\">";
                    content += GetLocaleResourceString("ContactUs.Address");
                    content += "</th>";
                    content += "<th class=\"header\" style=\"text-align: center; width:30%\">";
                    content += GetLocaleResourceString("Game1Award.CompleteDate");
                    content += "</th>";
                    content += "</tr>";
                    content += "</thead><tbody>";
                    var customercollection = GameManager.GetCustomerResultByDate(int.Parse(rowInner["Month"].ToString()), int.Parse(rowInner["Year"].ToString())).FindAll(IsWinner);
                    foreach (var customerResult in customercollection)
                    {
                        content += "<tr>";
                        content += "<td class=\"row\" style=\"text-align:center\">";
                        content += customerResult.CustomerResultID;
                        content += "</td>";
                        content += "<td class=\"row\" style=\"text-align:left\">";
                        content += customerResult.Customer.FullName;
                        content += "</td>";
                        content += "<td class=\"row\" style=\"text-align:left\">";
                        content += customerResult.Customer.StreetAddress + " " +
                                       customerResult.Customer.City;
                        content += "</td>";
                        content += "<td class=\"row\" style=\"text-align:left\">";
                        content += customerResult.CompleteDate.ToShortDateString();
                        content += "</td>";
                        content += "</tr>";
                    }
                    content += "</tbody>";
                    content += "</table>";
                    content += "</div>";
                    content += "</div>";
                    pane.ContentContainer.Controls.Add(new LiteralControl(content));
                }

                ResultList.Panes.Add(pane);
            }
        }

        static bool IsWinner(CustomerResult x)
        {
            return x.IsWinner;
        }
    }
}
