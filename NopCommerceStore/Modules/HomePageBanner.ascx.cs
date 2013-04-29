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
using NopSolutions.NopCommerce.BusinessLogic.Categories;
using NopSolutions.NopCommerce.BusinessLogic.Media;
using NopSolutions.NopCommerce.BusinessLogic.Products;
using NopSolutions.NopCommerce.BusinessLogic.SEO;
using NopSolutions.NopCommerce.Common.Utils;
using NopSolutions.NopCommerce.BusinessLogic.Configuration.Settings;
using NopSolutions.NopCommerce.BusinessLogic.Banner;

namespace NopSolutions.NopCommerce.Web.Modules
{
    public partial class HomePageBannerControl : BaseNopUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindData();
            }
        }

        static bool IsPublished(Banner x)
        {
            return x.IsPublish;
        }

        static bool IsHomepage(Banner x)
        {
            return x.Position == 2;
        }

        protected void BindData()
        {
            BannerCollection collection = BannerManager.GetAllBanner();
            gridtest.DataSource = collection.FindAll(IsPublished).FindAll(IsHomepage);
            gridtest.DataBind();
        }

        public string GetPictureURL(int PictureID)
        {
            return PictureManager.GetPictureUrl(PictureID, SettingManager.GetSettingValueInteger("Media.Banner.BannerHomepageSize", 204));
        }

        public string GetRedirectURL(int PictureID)
        {
            return Page.ResolveUrl("~/BannerDetail.aspx?BannerID=" + PictureID.ToString());
        }



    }
}