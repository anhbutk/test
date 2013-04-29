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
    public partial class AnswerInfoControl : BaseNopAdministrationUserControl
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.BindData();
                BindQuestion();
            }
        }

        private void BindQuestion()
        {
            QuestionCollection questionCollection = GameManager.GetAllQuestions();
            drpQuestion.DataSource = questionCollection;
            drpQuestion.DataTextField = "QuestionContent";
            drpQuestion.DataValueField = "QuestionID";
            drpQuestion.DataBind();
        }

        private void BindData()
        {
            Answer answer = GameManager.GetAnswerByID(this.AnswerID);
            if (answer != null)
            {
                this.txtAnswerContent.Text = answer.AnswerContent;
                this.cbIsCorrect.Checked = answer.IsCorrect;
                this.drpQuestion.SelectedValue = answer.QuestionID.ToString();
            }
        }



        public Answer SaveInfo()
        {
            Answer answer = GameManager.GetAnswerByID(AnswerID);
            if (answer != null)
            {
                answer = GameManager.UpdateAnswer(AnswerID, int.Parse(drpQuestion.SelectedValue), txtAnswerContent.Text.Trim(),
                                                  cbIsCorrect.Checked);
            }
            else
            {
                answer = GameManager.InsertAnswer(int.Parse(drpQuestion.SelectedValue), txtAnswerContent.Text.Trim(),
                                                  cbIsCorrect.Checked);
            }
            return answer;
        }

        public int AnswerID
        {
            get
            {
                return CommonHelper.QueryStringInt("ID");
            }
        }
    }
}