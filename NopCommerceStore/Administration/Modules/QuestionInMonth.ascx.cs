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
using NopSolutions.NopCommerce.BusinessLogic.Directory;
using NopSolutions.NopCommerce.BusinessLogic.Game;
using NopSolutions.NopCommerce.BusinessLogic.Profile;
using NopSolutions.NopCommerce.Common.Utils;
using NopSolutions.NopCommerce.BusinessLogic.Content.FAQ;

namespace NopSolutions.NopCommerce.Web.Administration.Modules
{
    public partial class QuestionInMonthControl : BaseNopAdministrationUserControl
    {

        private void BindData()
        {
            QuestionCollection questionCollection = GameManager.GetAllQuestions();
            cbQuestion.DataSource = questionCollection;
            cbQuestion.DataTextField = "QuestionContent";
            cbQuestion.DataValueField = "QuestionID";
            cbQuestion.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.BindData();
            }
        }

        public bool SaveInfo()
        {
            try
            {
                int month = int.Parse(drpMonth.SelectedValue);
                int year = int.Parse(drpYear.SelectedValue);

                GameManager.DeleteQuestionInMonthByMonthYear(month, year);
                foreach (ListItem item in cbQuestion.Items)
                {
                    if (item.Selected)
                    {
                        GameManager.InsertQuestionInMonth(int.Parse(item.Value), month,
                                                          year);
                    }
                }
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            foreach (ListItem item in cbQuestion.Items)
            {
                item.Selected = false;
            }
            int month = int.Parse(drpMonth.SelectedValue);
            int year = int.Parse(drpYear.SelectedValue);
            QuestionCollection questionCollection = GameManager.GetAllQuestionByMonth(month, year);
            foreach (Question item in questionCollection)
            {
                cbQuestion.Items.FindByValue(item.QuestionID.ToString()).Selected = true;
            }
        }

    }
}