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
using NopSolutions.NopCommerce.BusinessLogic.Configuration.Settings;
using NopSolutions.NopCommerce.BusinessLogic.Content.Forums;
using NopSolutions.NopCommerce.BusinessLogic.Content.NewsManagement;
using NopSolutions.NopCommerce.BusinessLogic.Media;
using NopSolutions.NopCommerce.Common.Utils;
using NopSolutions.NopCommerce.BusinessLogic.SEO;

namespace NopSolutions.NopCommerce.Web.Modules
{
    public partial class NewsListControl : BaseNopUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindData(ForumID);
            }
        }

        protected string GetNewsRSSUrl()
        {
            return SEOHelper.GetNewsRssURL();
        }

        static bool IsPublished(ForumTopic x)
        {
            return x.OnOff;
        }

        static bool NotBeautySkin(ForumTopic x)
        {
            return (x.ForumID != 6);
        }

        protected void BindData(int forumID)
        {
            if (forumID != 0)
            {
                Forum forum = ForumManager.GetForumByID(forumID);
                lblTitle.Text = forum.Name;
            }
            else
            {
                lblTitle.Text = GetLocaleResourceString("News.AboutPhanNu");
            }
            ForumTopicCollection topicCollection = forumID == 0
                                                       ? ForumManager.GetAllTopicsExtreme()
                                                       : ForumManager.GetTopicsByForumID(forumID);

            if (topicCollection.Count > 1 || topicCollection.Count > 1)
            {
                gridtest.DataSource = topicCollection.FindAll(IsPublished).FindAll(NotBeautySkin);
                gridtest.DataBind();
            }
            else if(topicCollection.Count == 1 )
            {
                Response.Redirect("~/NewsDetail.aspx?TopicID=" + topicCollection[0].ForumTopicID);
            }
            //else
            //this.Visible = false;
        }



        [DefaultValue(0)]
        public int NewsCount
        {
            get
            {
                if (ViewState["NewsCount"] == null)
                    return 0;
                else
                    return (int)ViewState["NewsCount"];
            }
            set { ViewState["NewsCount"] = value; }
        }

        public int ForumID
        {
            get
            {
                return CommonHelper.QueryStringInt("ForumID");
            }
        }

        public string GetPictureURL(int PictureID)
        {
            return PictureManager.GetPictureUrl(PictureID,
                                                SettingManager.GetSettingValueInteger(
                                                    "Media.News.NewsListThumbnailImageSize", 115));
        }

        protected void gridtest_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            gridtest.CurrentPageIndex = e.NewPageIndex;
            BindData(ForumID);
        }
    }
}