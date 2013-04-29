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
    public partial class NewsMenuSkinControl : BaseNopUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindData();
        }

        protected string GetNewsUrl(int ForumID)
        {
            return SEOHelper.GetNewsListURL(ForumID);
        }

        //static bool IsThongtinchung(ForumTopic x)
        //{
        //    return (x.ForumID == 1);
        //}

        //static bool IsQuytrinh(ForumTopic x)
        //{
        //    return (x.ForumID == 2);
        //}

        //static bool IsPhongsu(ForumTopic x)
        //{
        //    return (x.ForumID == 3);
        //}

        //static bool IsHuongdan(ForumTopic x)
        //{
        //    return (x.ForumID == 4);
        //}

        //static bool IsGiayphep(ForumTopic x)
        //{
        //    return (x.ForumID == 5);
        //}

        //static bool IsTintuc(ForumTopic x)
        //{
        //    return (x.ForumID == 7);
        //}

        //static bool RemoveThongtinchung(Forum f)
        //{
        //    return (f.ForumID == 1);
        //}

        //static bool RemoveQuytrinh(Forum f)
        //{
        //    return (f.ForumID == 2);
        //}

        //static bool RemovePhongsu(Forum f)
        //{
        //    return (f.ForumID == 3);
        //}

        //static bool RemoveHuongdan(Forum f)
        //{
        //    return (f.ForumID == 4);
        //}

        //static bool RemoveGiayphep(Forum f)
        //{
        //    return (f.ForumID == 5);
        //}

        //static bool RemoveTintuc(Forum f)
        //{
        //    return (f.ForumID == 7);
        //}

        void BindData()
        {
            //ForumTopicCollection topicCollection = ForumManager.GetAllTopicsExtreme();

            ForumCollection forum = ForumManager.GetAllForumsByGroupID(2);

            /*Filter*/
            //if (topicCollection.FindAll(IsThongtinchung).Count <= 0)
            //{
            //    forum.RemoveAll(RemoveThongtinchung);
            //}
            //if (topicCollection.FindAll(IsQuytrinh).Count <= 0)
            //{
            //    forum.RemoveAll(RemoveQuytrinh);
            //}
            //if (topicCollection.FindAll(IsPhongsu).Count <= 0)
            //{
            //    forum.RemoveAll(RemovePhongsu);
            //}
            //if (topicCollection.FindAll(IsHuongdan).Count <= 0)
            //{
            //    forum.RemoveAll(RemoveHuongdan);
            //}
            //if (topicCollection.FindAll(IsGiayphep).Count <= 0)
            //{
            //    forum.RemoveAll(RemoveGiayphep);
            //}
            //if (topicCollection.FindAll(IsTintuc).Count <= 0)
            //{
            //    forum.RemoveAll(RemoveTintuc);
            //}

            rptForumGroup.DataSource = forum;
            rptForumGroup.DataBind();
        }

        //public static int forumGroupID;
        //public int ForumGroupID
        //{
        //    set
        //    {
        //        forumGroupID = value;
        //    }
        //    get
        //    {
        //        if (CommonHelper.QueryStringInt("TopicID") != 0)
        //        {
        //            var forumID = ForumManager.GetTopicByID(CommonHelper.QueryStringInt("TopicID")).ForumID;
        //            return ForumManager.GetForumByID(forumID).ForumGroupID;
        //        }
        //        else
        //        {
        //            return forumGroupID;
        //        }
        //    }
        //}

    }
}