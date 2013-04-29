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
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using NopSolutions.NopCommerce.BusinessLogic.Configuration.Settings;
using NopSolutions.NopCommerce.BusinessLogic.Content.Forums;
using NopSolutions.NopCommerce.Common.Utils;
using NopSolutions.NopCommerce.BusinessLogic;

namespace NopSolutions.NopCommerce.Web.Administration.Modules
{
    public partial class ForumTopicListReorderControl : BaseNopAdministrationUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //BindData(0);
                FillDropDownsTopic();
            }
        }

        void BindData(int forumID)
        {
            if (forumID != 0)
            {
                ForumTopicCollection topicCollection = ForumManager.GetTopicsByForumID(forumID);
                ReorderList.DataSource = topicCollection;
                ReorderList.DataBind();
                ReorderList.Visible = true;
            }
            else
            {
                ReorderList.Visible = false;
            }
        }

        private void FillDropDownsTopic()
        {
            this.ddlForum.Items.Clear();
            this.ddlForum.Items.Add(new ListItem(GetLocaleResourceString("Admin.News.ChooseOne"), "0"));
            ForumCollection forum = ForumManager.GetAllForums();
            foreach (Forum forumItem in forum)
            {
                ListItem item2 = new ListItem(forumItem.Name, forumItem.ForumID.ToString());
                this.ddlForum.Items.Add(item2);
            }
        }

        protected void ddlForum_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindData(int.Parse(ddlForum.SelectedValue));
        }

        protected void ReorderList1_ItemReorder(object sender, AjaxControlToolkit.ReorderListItemReorderEventArgs e)
        {
            var NewOrder = e.NewIndex + 1;
            var OldOrder = e.OldIndex + 1;
            DateTime nowDT = DateTime.Now;

            var ForumTopicID = Convert.ToInt32(((Label)(
               e.Item.FindControl("ID"))).Text);            

            var ListItemCount = 1;

            ForumTopicCollection topicCollection = ForumManager.GetTopicsByForumID(int.Parse(ddlForum.SelectedValue));

            foreach (var ForumTopic in topicCollection)
            {
                // Move forward items in this range
                if (OldOrder > NewOrder
                    && ListItemCount >= NewOrder
                    && ListItemCount <= OldOrder
                    )
                    ForumTopic.Position = ListItemCount + 1;
                // Move backward items in this range
                else if
                    (OldOrder < NewOrder
                    && ListItemCount <= NewOrder
                    && ListItemCount >= OldOrder
                    )
                    ForumTopic.Position = ListItemCount - 1;

                ListItemCount++;

                // Set the changed item into the newly numerical gap
                if (ForumTopic.ForumTopicID == ForumTopicID)
                {
                    ForumTopic.Position = NewOrder;                    
                }
                ForumManager.UpdateTopic(ForumTopic.ForumTopicID, ForumTopic.ForumID,
                     ForumTopic.UserID, ForumTopic.TopicType, ForumTopic.Subject, 0,
                     ForumTopic.Views, 0, NopContext.Current.User.CustomerID,
                     ForumTopic.LastPostTime, ForumTopic.CreatedOn, nowDT, ForumTopic.TopicContent, ForumTopic.VideoClip, ForumTopic.HomePage, ForumTopic.OnOff, ForumTopic.PictureID, ForumTopic.ShortContent, ForumTopic.Position);
            }           
        }
    }
}