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
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Configuration.Provider;
using System.Data;
using System.Data.Common;
using System.Globalization;
using System.Text;
using System.Web.Configuration;
using System.Web.Hosting;


namespace NopSolutions.NopCommerce.DataAccess.Banner
{

    [DBProviderSectionName("nopDataProviders/BannerProvider")]
    public abstract partial class DBBannerProvider : BaseDBProvider
    {
        #region Methods

        #region Page

        public abstract DBPage InsertPage(string PageName, bool IsPublish);

        public abstract DBPageCollection GetAllPage();

        public abstract void DeletePage(int PageID);

        public abstract DBPage UpdatePage(int PageID, string PageName, bool IsPublish);

        public abstract DBPage GetPageByID(int PageID);
        #endregion

        #region Banner

        public abstract DBBanner InsertBanner(int PageID, string BannerName, bool IsPublish, int PictureID, string URL, int Views, int Position);

        public abstract DBBannerCollection GetAllBanner();

        public abstract void DeleteBanner(int BannerID);

        public abstract DBBanner UpdateBanner(int BannerID, int PageID, string BannerName, bool IsPublish, int PictureID, string URL, int Views, int Position);

        public abstract DBBanner GetBannerByID(int BannerID);

        #endregion

        #endregion

        #region Custom Methods

        public abstract DBBannerCollection GetBannerByPageID(int PageID);
        
        #endregion
    }
}

