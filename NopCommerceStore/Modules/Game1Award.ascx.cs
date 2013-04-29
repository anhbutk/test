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
            rptDatetime.DataSource = GameManager.GetDistinctCustomerResultByMonthYear();
            rptDatetime.DataBind();
        }

        static bool IsWinner(CustomerResult x)
        {
            return x.IsWinner;
        }

        protected void rptDatetime_ItemCreated(object sender, RepeaterItemEventArgs e)
        {
            var item = e.Item.DataItem as DataRowView;
            if (item != null)
            {
                var lblDatetime = e.Item.FindControl("lblDatetime") as Label;
                if (lblDatetime != null)
                    lblDatetime.Text = GetLocaleResourceString("Common.Month") + " " + item[0] + " " +
                                       GetLocaleResourceString("Common.Year") + " " + item[1];
                var rptFullname = e.Item.FindControl("rptFullname") as Repeater;
                if (rptFullname != null)
                {
                    rptFullname.DataSource = GameManager.GetCustomerResultByDate(int.Parse(item[0].ToString()),
                                                                                 int.Parse(item[1].ToString())).Where(IsWinner);
                    rptFullname.DataBind();
                }
            }
        }

        protected void rptFullname_ItemCreated(object sender, RepeaterItemEventArgs e)
        {
            var customerResult = e.Item.DataItem as CustomerResult;
            if (customerResult != null)
            {
                var lblAutoNumber = e.Item.FindControl("lblAutoNumber") as Label;
                if (lblAutoNumber != null)
                    lblAutoNumber.Text = customerResult.CustomerResultID.ToString();
                var lblFullname = e.Item.FindControl("lblFullname") as Label;
                if (lblFullname != null)
                    lblFullname.Text = customerResult.Customer.FullName;
                var lblAddress = e.Item.FindControl("lblAddress") as Label;
                if (lblAddress != null)
                    lblAddress.Text = customerResult.Customer.StreetAddress + " " +
                                       customerResult.Customer.City;
                var lblCompleteDate = e.Item.FindControl("lblCompleteDate") as Label;
                if (lblCompleteDate != null)
                    lblCompleteDate.Text = customerResult.CompleteDate.ToShortDateString();
            }
        }
    }
}
