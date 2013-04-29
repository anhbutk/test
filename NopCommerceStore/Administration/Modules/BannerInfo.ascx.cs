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
using NopSolutions.NopCommerce.BusinessLogic.Banner;
using NopSolutions.NopCommerce.BusinessLogic.Configuration.Settings;
using NopSolutions.NopCommerce.BusinessLogic.Content.Forums;
using NopSolutions.NopCommerce.BusinessLogic.Media;
using NopSolutions.NopCommerce.BusinessLogic.Profile;
using NopSolutions.NopCommerce.Common.Utils;
using NopSolutions.NopCommerce.BusinessLogic;

namespace NopSolutions.NopCommerce.Web.Administration.Modules
{
    public partial class BannerInfoControl : BaseNopAdministrationUserControl
    {
        private void BindData()
        {
            Banner item = BannerManager.GetBannerByID(BannerID);
            if (item != null)
            {
                txtName.Text = item.BannerName;
                txtURL.Text = item.URL;
                chkOnOff.Checked = item.IsPublish;
                defaultImage.ImageUrl = PictureManager.GetPictureUrl(item.PictureID, SettingManager.GetSettingValueInteger("Media.Banner.BannerSize", 115));
                txtViews.Text = item.Views.ToString();
                drpPosition.Items.FindByValue(item.Position.ToString()).Selected = true;
            }
        }
       

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindData();
            }
        }

        public Banner SaveInfo()
        {
            Banner item = BannerManager.GetBannerByID(BannerID);
            string bannername = txtName.Text.Trim();
            bool onoff = chkOnOff.Checked;
            string URL = txtURL.Text.Trim();
            int views = txtViews.Text != "" ? int.Parse(txtViews.Text.Trim()) : 0;
            int Position = int.Parse(drpPosition.SelectedValue);

            Picture image = item != null ? PictureManager.GetPictureByID(item.PictureID) : new Picture();
            HttpPostedFile imagePostedFile = fuImage.PostedFile;
            if ((imagePostedFile != null) && (!String.IsNullOrEmpty(imagePostedFile.FileName)))
            {
                byte[] PictureBinary = PictureManager.GetPictureBits(imagePostedFile.InputStream, imagePostedFile.ContentLength);
                if (item != null)
                {
                    image = PictureManager.UpdatePicture(item.PictureID, PictureBinary, imagePostedFile.ContentType,
                                                         true);
                }
                else
                {
                    image = PictureManager.InsertPicture(PictureBinary, imagePostedFile.ContentType, true);
                }
            }

            int imageID = image != null ? image.PictureID : 0;

            if (item != null)
            {
                item = BannerManager.UpdateBanner(BannerID, bannername, 0, imageID, URL, onoff, views, Position);
            }
            else
            {
                item = BannerManager.InsertBanner(bannername, 0, imageID, URL, onoff, 0, Position);
            }

            return item;
        }

        public int BannerID
        {
            get
            {
                return CommonHelper.QueryStringInt("BannerID");
            }
        }
    }
}