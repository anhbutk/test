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
using System.Web.UI.MobileControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using NopSolutions.NopCommerce.BusinessLogic.Content.Blog;
using NopSolutions.NopCommerce.BusinessLogic.Content.FAQ;
using NopSolutions.NopCommerce.BusinessLogic.Content.NewsManagement;
using NopSolutions.NopCommerce.BusinessLogic.Directory;
using NopSolutions.NopCommerce.BusinessLogic.Game;
using NopSolutions.NopCommerce.Common.Utils;
 
namespace NopSolutions.NopCommerce.Web.Administration.Modules
{
    public partial class AnswerDetailControl : BaseNopAdministrationUserControl
    {
        protected void SaveButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    Answer answer = ctrlAnswerInfo.SaveInfo();
                    Response.Redirect("AnswerDetail.aspx?ID=" + answer.AnswerID.ToString());
                }
                catch (Exception exc)
                {
                    ProcessException(exc);
                }
            }
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            try
            {
                GameManager.DeleteAnswer(AnswerID);
                Response.Redirect("Answer.aspx");
            }
            catch (Exception exc)
            {
                ProcessException(exc);
            }
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