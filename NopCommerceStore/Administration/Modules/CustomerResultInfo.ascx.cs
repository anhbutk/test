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
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using NopSolutions.NopCommerce.BusinessLogic.Content.Blog;
using NopSolutions.NopCommerce.BusinessLogic.Content.NewsManagement;
using NopSolutions.NopCommerce.BusinessLogic.CustomerManagement;
using NopSolutions.NopCommerce.BusinessLogic.Directory;
using NopSolutions.NopCommerce.BusinessLogic.Game;
using NopSolutions.NopCommerce.BusinessLogic.Localization;
using NopSolutions.NopCommerce.BusinessLogic.Messages;
using NopSolutions.NopCommerce.BusinessLogic.Profile;
using NopSolutions.NopCommerce.Common.Utils;
using NopSolutions.NopCommerce.BusinessLogic.Content.FAQ;

namespace NopSolutions.NopCommerce.Web.Administration.Modules
{
    public partial class CustomerResultInfoControl : BaseNopAdministrationUserControl
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.BindData();
                BindDetail();
            }
        }


        private void BindData()
        {
            CustomerResult customerResult = GameManager.GetCustomerResultByID(this.CustomerResultID);
            if (customerResult != null)
            {
                Customer customer = CustomerManager.GetCustomerByID(customerResult.CustomerID);
                this.lblName1.Text = customer.FullName;
                this.lblEmail1.Text = customer.Email;
                this.lblCompleteDate1.Text = customerResult.CompleteDate.ToString();
                this.cbIsCorrectAll.Checked = customerResult.IsCorrectAll;
                this.cbIsWinner.Checked = customerResult.IsWinner;
            }
        }

        private void BindDetail()
        {
            CustomerResultDetailCollection customerResultDetailCollection =
                GameManager.GetAllCustomerResultDetailByCustomerResultID(CustomerResultID);
            gvResultDetail.DataSource = customerResultDetailCollection;
            gvResultDetail.DataBind();
        }

        public CustomerResult SaveInfo()
        {
            CustomerResult customerResult = GameManager.GetCustomerResultByID(CustomerResultID);
            if (customerResult != null)
            {
                customerResult = GameManager.UpdateCustomerResult(CustomerResultID, customerResult.CustomerID,
                                                                  customerResult.CompleteDate, cbIsCorrectAll.Checked,
                                                                  cbIsWinner.Checked);
                Customer customer = CustomerManager.GetCustomerByID(customerResult.CustomerID);
                if(cbSendEmail.Checked)
                {
                    MessageManager.SendCustomerWinnerMessage(LocalizationManager.DefaultAdminLanguage.LanguageID,
                                                             customer.FullName, customerResult.CompleteDate, customer);
                }
            }
            return customerResult;
        }

        public int CustomerResultID
        {
            get
            {
                return CommonHelper.QueryStringInt("ID");
            }
        }

        protected void gvResultDetail_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvResultDetail.PageIndex = e.NewPageIndex;
            BindDetail();
        }
    }
}