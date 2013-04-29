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
    public partial class NewsDetailSkinControl : BaseNopUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindData(TopicID);
            }
        }

        static bool IsPublished(ForumTopic x)
        {
            return x.OnOff;
        }

        protected void BindData(int TopicID)
        {
            ForumTopic topic = ForumManager.GetTopicByID(TopicID);

            lblTieude.Text = topic.Subject;
            lblNoidung.Text = topic.TopicContent;
            lblTitle.Text = topic.Forum.Name;

            SEOHelper.RenderTitle(this.Page, topic.Subject, true, true);
            SEOHelper.RenderMetaTag(this.Page, "description", topic.Subject, true);
            SEOHelper.RenderMetaTag(this.Page, "keywords", topic.Subject, true);

            if (topic.VideoClip != "")
            {
                litVideo.Text = " <iframe class='youtube-player' type='text/html' width='656' height='500' src='http://www.youtube.com/embed/" + topic.VideoClip + "?autoplay=1' frameborder='0'></iframe>";
            }            

            ForumTopicCollection topicCollection = ForumManager.GetOlderTopicsByTopicIDForumID(topic.ForumID,
                                                                                               topic.CreatedOn);

            if (topicCollection.Count > 0)
            {
                gridtest.DataSource = topicCollection.FindAll(IsPublished);
                gridtest.DataBind();
            }
            else 
                pnlTinkhac.Visible = false;
        }

        //[DefaultValue(0)]
        //public int NewsCount
        //{
        //    get
        //    {
        //        if (ViewState["NewsCount"] == null)
        //            return 0;
        //        else
        //            return (int)ViewState["NewsCount"];
        //    }
        //    set { ViewState["NewsCount"] = value; }
        //}

        public int TopicID
        {
            get
            {
                return CommonHelper.QueryStringInt("TopicID");
            }
        }

        public string GetPictureURL(int PictureID)
        {
            return PictureManager.GetPictureUrl(PictureID,
                                                SettingManager.GetSettingValueInteger(
                                                    "Media.Product.ThumbnailImageSize", 115));
        }

        protected void gridtest_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            gridtest.CurrentPageIndex = e.NewPageIndex;
            BindData(TopicID);
        }       
    }
}