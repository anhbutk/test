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
using NopSolutions.NopCommerce.BusinessLogic.Content.NewsManagement;
using NopSolutions.NopCommerce.BusinessLogic.Directory;
using NopSolutions.NopCommerce.BusinessLogic.Profile;
using NopSolutions.NopCommerce.Common.Utils;
using NopSolutions.NopCommerce.BusinessLogic.Content.FAQ;

namespace NopSolutions.NopCommerce.Web.Administration.Modules
{
    public partial class FAQInfoControl : BaseNopAdministrationUserControl
    {

        private void BindData()
        {
            FAQ faq = FAQManager.GetFAQByID(this.FAQID);
            if (faq != null)
            {
                this.txtQuestion.Text = faq.Question;
                this.txtAnswer.Text = faq.Answer;
                this.cbPublished.Checked = faq.OnOff;
                this.txtDisplayOrder.Text = faq.DisplayOrder.ToString();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.BindData();
            }
        }

        public FAQ SaveInfo()
        {
            FAQ faq = FAQManager.GetFAQByID(FAQID);
            if (faq != null)
            {
                faq = FAQManager.UpdateFAQ(FAQID, txtQuestion.Text, txtAnswer.Text, int.Parse(txtDisplayOrder.Text),
                                           cbPublished.Checked);
            }
            else
            {
                faq = FAQManager.InsertFAQ(txtQuestion.Text, txtAnswer.Text, int.Parse(txtDisplayOrder.Text),
                                           cbPublished.Checked);
            }
            return faq;
        }

        public int FAQID
        {
            get
            {
                return CommonHelper.QueryStringInt("FAQID");
            }
        }
    }
}