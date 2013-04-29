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
using NopSolutions.NopCommerce.BusinessLogic.Media;
using NopSolutions.NopCommerce.BusinessLogic.Profile;
using NopSolutions.NopCommerce.Common.Utils;
using NopSolutions.NopCommerce.BusinessLogic;

namespace NopSolutions.NopCommerce.Web.Administration.Modules
{
    public partial class ForumTopicInfoControl : BaseNopAdministrationUserControl
    {
        private void BindData()
        {
            ForumTopic topic = ForumManager.GetTopicByID(TopicID);
            if (topic != null)
            {
                CommonHelper.SelectListItem(ddlForum, topic.ForumID);

                txtName.Text = topic.Subject;
                txtDescription.Value = topic.TopicContent;
                txtShort.Text = topic.ShortContent;
                txtViewNums.Value = topic.Views;
                chkHomepage.Checked = topic.HomePage;
                chkOnOff.Checked = topic.OnOff;
                if (topic.VideoClip != "")
                {
                    lnkVideoClip.Visible = true;
                    lnkVideoClip.Text = topic.VideoClip;
                    lnkVideoClip.NavigateUrl = "~/Uploaded/VideoClip/" + topic.VideoClip;
                }
                pnlCreatedOn.Visible = true;
                lblCreatedOn.Text = DateTimeHelper.ConvertToUserTime(topic.CreatedOn).ToString();
                pnlUpdatedOn.Visible = true;
                lblUpdatedOn.Text = DateTimeHelper.ConvertToUserTime(topic.UpdatedOn).ToString();
                defaultImage.ImageUrl = PictureManager.GetPictureUrl(topic.PictureID, SettingManager.GetSettingValueInteger("Media.Product.ThumbnailImageSize", 115));
            }
            else
            {
                pnlCreatedOn.Visible = false;
                pnlUpdatedOn.Visible = false;
            }
        }

        private void FillDropDownsTopic()
        {
            ddlForum.Items.Clear();
            ForumCollection forum = ForumManager.GetAllForums();
            foreach (Forum forumItem in forum)
            {
                ListItem item2 = new ListItem(forumItem.Name, forumItem.ForumID.ToString());
                ddlForum.Items.Add(item2);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                FillDropDownsTopic();
                BindData();
            }
        }

        public ForumTopic SaveInfo()
        {
            ForumTopic topic = ForumManager.GetTopicByID(TopicID);
            DateTime nowDT = DateTime.Now;
            ForumTopicTypeEnum topicType = (ForumTopicTypeEnum)Enum.ToObject(typeof(ForumTopicTypeEnum), 10);
            string title = txtName.Text.Trim();
            string content = txtDescription.Value;
            string viewnums = txtViewNums.Value.ToString();
            int forumID = int.Parse(ddlForum.SelectedItem.Value);
            bool homepage = chkHomepage.Checked;
            bool onoff = chkOnOff.Checked;
            string uploadname = "videoclip" + DateTime.Now.ToString("dd-MM-yyyy-hh-mm-ss") + ".flv";
            string videofile = fuVideoClip.PostedFile.FileName != "" ? uploadname : lnkVideoClip.Text;
            string shortcontent = txtShort.Text.Trim();

            Picture image = topic != null ? PictureManager.GetPictureByID(topic.PictureID) : new Picture();
            HttpPostedFile imagePostedFile = fuImage.PostedFile;
            if ((imagePostedFile != null) && (!String.IsNullOrEmpty(imagePostedFile.FileName)))
            {
                byte[] PictureBinary = PictureManager.GetPictureBits(imagePostedFile.InputStream, imagePostedFile.ContentLength);
                if (topic != null)
                {
                    if (topic.PictureID != 0)
                        image = PictureManager.UpdatePicture(topic.PictureID, PictureBinary, imagePostedFile.ContentType,
                                                         true);
                    else
                        image = PictureManager.InsertPicture(PictureBinary, imagePostedFile.ContentType, true);
                    
                }
                else
                {
                    image = PictureManager.InsertPicture(PictureBinary, imagePostedFile.ContentType, true);
                }
            }

            int imageID = image != null ? image.PictureID : 0;

            if (topic != null)
            {
                topic = ForumManager.UpdateTopic(topic.ForumTopicID, forumID,
                      topic.UserID, topicType, title, 0,
                      int.Parse(viewnums), 0, NopContext.Current.User.CustomerID,
                      topic.LastPostTime, topic.CreatedOn, nowDT, content, videofile, homepage, onoff, imageID, shortcontent);
            }
            else
            {
                topic = ForumManager.InsertTopic(int.Parse(ddlForum.SelectedItem.Value), NopContext.Current.User.CustomerID,
                       topicType, txtName.Text.Trim(), 0, 0, 0, 0, null, nowDT, nowDT, true, content, videofile, homepage, onoff, imageID, shortcontent);
            }

            if (fuVideoClip.PostedFile.FileName != "")
            {
                UploadFile(uploadname);
            }
            return topic;
        }

        private void UploadFile(string name)
        {
            HttpPostedFile postFile = fuVideoClip.PostedFile;
            postFile.SaveAs(Server.MapPath("~/Uploaded/VideoClip/" + name));
        }

        public int TopicID
        {
            get
            {
                return CommonHelper.QueryStringInt("TopicID");
            }
        }
    }
}