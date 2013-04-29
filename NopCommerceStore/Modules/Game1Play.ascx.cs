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
using NopSolutions.NopCommerce.BusinessLogic.SEO;

namespace NopSolutions.NopCommerce.Web.Modules
{
    public partial class Game1PlayControl : BaseNopUserControl
    {
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            BindData();
        }

        private void BindData()
        {
            int month = DateTime.Now.Month;
            int year = DateTime.Now.Year;
            rptQuestion.DataSource = GameManager.GetAllQuestionByMonth(month, year);
            rptQuestion.DataBind();
        }

        protected void rptQuestion_ItemCreated(object sender, RepeaterItemEventArgs e)
        {
            var rdoAnswer = e.Item.FindControl("rdoAnswer") as RadioButtonList;
            var lblnum = e.Item.FindControl("lblID") as Label;
            lblnum.Text = (e.Item.ItemIndex + 1).ToString();
            var question = e.Item.DataItem as Question;
            var lblquestionID = e.Item.FindControl("lblQuestionID") as Label;
            lblquestionID.Text = question.QuestionID.ToString();
            var lblquestionText = e.Item.FindControl("lblquestionText") as Label;
            lblquestionText.Text = question.QuestionContent.ToString();
            if (rdoAnswer != null && question != null)
            {
                rdoAnswer.DataSource = GameManager.GetAllAnswerByQuestionID(question.QuestionID);
                rdoAnswer.DataTextField = "AnswerContent";
                rdoAnswer.DataValueField = "AnswerID";
                rdoAnswer.DataBind();
            }
        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {
            CustomerResult customerResult = GameManager.InsertCustomerResult(NopContext.Current.User.CustomerID,
                                                                             DateTime.Now, false, false);
            int count = 0;
            var arr = new string[rptQuestion.Items.Count];
            int count1 = 0;
            string youranswer = string.Empty;
            string rightanswer = GetLocaleResourceString("Game1Play.WrongAnswer");
            foreach (RepeaterItem item in rptQuestion.Items)
            {
                var rdoAnswer = item.FindControl("rdoAnswer") as RadioButtonList;
                var lblquestionID = item.FindControl("lblQuestionID") as Label;
                var lblquestionText = item.FindControl("lblquestionText") as Label;
                if (rdoAnswer != null && lblquestionID != null && lblquestionText != null)
                {
                    Answer answer = GameManager.GetAnswerByID(int.Parse(rdoAnswer.SelectedValue));
                    if (answer.IsCorrect)
                    {
                        rightanswer = GetLocaleResourceString("Game1Play.RightAnswer");
                        count++;
                    }
                    else
                    {
                        rightanswer = GetLocaleResourceString("Game1Play.WrongAnswer");
                    }
                    youranswer = answer.AnswerContent;                                       
                        
                    CustomerResultDetail customerResultDetail =
                        GameManager.InsertCustomerResultDetail(customerResult.CustomerResultID,
                                                               int.Parse(lblquestionID.Text),
                                                               answer.AnswerID, answer.IsCorrect);
                    GameManager.UpdateCustomerResult(customerResult.CustomerResultID, customerResult.CustomerID,
                                                     customerResult.CompleteDate, count == 5 ? true : false, false);
                    arr[count1] = lblquestionText.Text + ";" + youranswer + ";" + rightanswer;
                }
                count1++;
            }
            MessageManager.SendCustomerCompletePlayer(LocalizationManager.DefaultAdminLanguage.LanguageID,
                                                      NopContext.Current.User.FullName, customerResult.CompleteDate, arr, NopContext.Current.User);
            Page.Response.Redirect(SEOHelper.GetGameOverURL());
        }

    }
}
