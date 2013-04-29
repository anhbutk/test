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
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using NopSolutions.NopCommerce.BusinessLogic;
using NopSolutions.NopCommerce.BusinessLogic.Categories;
using NopSolutions.NopCommerce.BusinessLogic.Content.Forums;
using NopSolutions.NopCommerce.BusinessLogic.Media;
using NopSolutions.NopCommerce.BusinessLogic.Products;
using NopSolutions.NopCommerce.BusinessLogic.SEO;
using NopSolutions.NopCommerce.Common.Utils;
using NopSolutions.NopCommerce.BusinessLogic.Configuration.Settings;

namespace NopSolutions.NopCommerce.Web.Modules
{
    public partial class HomePageNewsRightControl : BaseNopUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindData();
            }
        }

        static bool ShowHomePage(ForumTopic x)
        {
            return x.HomePage;
        }

        static bool NotReportage(ForumTopic x)
        {
            return (x.ForumID != 3);
        }

        static bool IsPublished(ForumTopic x)
        {
            return x.OnOff;
        }

        private void BindData()
        {
            ForumTopicCollection topicCollection = ForumManager.GetAllTopicsExtreme();

            List<ForumTopic> list = topicCollection.FindAll(ShowHomePage).FindAll(NotReportage).FindAll(IsPublished);

            if (list.Count > 0)
            {
                lbltitle.Text = list[0].Subject;
                lbltitle.NavigateUrl = SEOHelper.GetNewsURL(list[0].ForumTopicID);
                lbltitle.ToolTip = list[0].Subject;
                lblViewall.NavigateUrl = SEOHelper.GetNewsURL(list[0].ForumTopicID);
                lblViewall.ToolTip = GetLocaleResourceString("News.MoreInfo");
                lblShortContent.Text = list[0].ShortContent;
                imgNews.ImageUrl = PictureManager.GetPictureUrl(list[0].PictureID,
                                                SettingManager.GetSettingValueInteger(
                                                    "Media.Product.ThumbnailImageSize", 72));
                imgNews.ToolTip = list[0].Subject;
                rptOther.DataSource = list.Count >= 5 ? list.GetRange(1, 4) : list.GetRange(1, list.Count - 1);
                rptOther.DataBind();
            }
        }
    }
}