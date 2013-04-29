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
using System.Data;
using System.Data.Common;
using System.Globalization;
using System.Text;
using System.Web;
using NopSolutions.NopCommerce.BusinessLogic.Caching;
using NopSolutions.NopCommerce.BusinessLogic.Configuration.Settings;
using NopSolutions.NopCommerce.BusinessLogic.CustomerManagement;
using NopSolutions.NopCommerce.BusinessLogic.Game;
using NopSolutions.NopCommerce.BusinessLogic.Localization;
using NopSolutions.NopCommerce.BusinessLogic.Messages;
using NopSolutions.NopCommerce.BusinessLogic.Profile;
using NopSolutions.NopCommerce.BusinessLogic.Utils.Html;
using NopSolutions.NopCommerce.Common.Utils.Html;
using NopSolutions.NopCommerce.DataAccess;
using NopSolutions.NopCommerce.DataAccess.Banner;
using NopSolutions.NopCommerce.DataAccess.Content.Blog;
using NopSolutions.NopCommerce.DataAccess.Game;

namespace NopSolutions.NopCommerce.BusinessLogic.Banner
{
    /// <summary>
    /// Blog post manager
    /// </summary>
    public partial class BannerManager
    {

        #region Utilities
        private static PageCollection DBMapping(DBPageCollection dbCollection)
        {
            if (dbCollection == null)
                return null;

            PageCollection collection = new PageCollection();
            foreach (DBPage dbItem in dbCollection)
            {
                Page item = DBMapping(dbItem);
                collection.Add(item);
            }

            return collection;
        }

        private static Page DBMapping(DBPage dbItem)
        {
            if (dbItem == null)
                return null;

            Page item = new Page();
            item.PageID = dbItem.PageID;
            item.PageName = dbItem.PageName;
            item.IsPublish = dbItem.IsPublish;

            return item;
        }

        private static BannerCollection DBMapping(DBBannerCollection dbCollection)
        {
            if (dbCollection == null)
                return null;

            BannerCollection collection = new BannerCollection();
            foreach (DBBanner dbItem in dbCollection)
            {
                Banner item = DBMapping(dbItem);
                collection.Add(item);
            }

            return collection;
        }

        private static Banner DBMapping(DBBanner dbItem)
        {
            if (dbItem == null)
                return null;

            Banner item = new Banner();
            item.PageID = dbItem.PageID;
            item.BannerID = dbItem.BannerID;
            item.BannerName = dbItem.BannerName;
            item.IsPublish = dbItem.IsPublish;
            item.PictureID = dbItem.PictureID;
            item.URL = dbItem.URL;
            item.Views = dbItem.Views;
            item.Position = dbItem.Position;
            return item;
        }
        #endregion

        #region Methods

        #region Page

        public static Page InsertPage(string PageName, bool IsPublish)
        {
            DBPage dbItem = DBProviderManager<DBBannerProvider>.Provider.InsertPage(PageName, IsPublish);
            Page item = DBMapping(dbItem);

            return item;
        }

        public static PageCollection GetAllPage()
        {
            DBPageCollection dbCollection = DBProviderManager<DBBannerProvider>.Provider.GetAllPage();
            PageCollection collection = DBMapping(dbCollection);
            return collection;
        }

        public static void DeletePage(int PageID)
        {
            DBProviderManager<DBBannerProvider>.Provider.DeletePage(PageID);
        }

        public static Page UpdatePage(int PageID, string PageName, bool IsPublish)
        {
            DBPage dbItem = DBProviderManager<DBBannerProvider>.Provider.UpdatePage(PageID, PageName,
                                                                                          IsPublish);
            Page item = DBMapping(dbItem);

            return item;
        }

        public static Page GetPageByID(int PageID)
        {
            if (PageID == 0)
                return null;

            DBPage dbItem = DBProviderManager<DBBannerProvider>.Provider.GetPageByID(PageID);
            Page item = DBMapping(dbItem);

            return item;
        }
        #endregion

        #region Banner

        public static Banner InsertBanner(string BannerName, int PageID, int PictureID, string URL, bool IsPublish, int Views, int Position)
        {
            DBBanner dbItem = DBProviderManager<DBBannerProvider>.Provider.InsertBanner(PageID, BannerName, IsPublish, PictureID, URL, Views, Position);
            Banner item = DBMapping(dbItem);

            return item;
        }

        public static BannerCollection GetAllBanner()
        {
            DBBannerCollection dbCollection = DBProviderManager<DBBannerProvider>.Provider.GetAllBanner();
            BannerCollection collection = DBMapping(dbCollection);
            return collection;
        }

        public static void DeleteBanner(int BannerID)
        {
            DBProviderManager<DBBannerProvider>.Provider.DeleteBanner(BannerID);
        }

        public static Banner UpdateBanner(int BannerID, string BannerName, int PageID, int PictureID, string URL, bool IsPublish, int Views, int Position)
        {
            DBBanner dbItem = DBProviderManager<DBBannerProvider>.Provider.UpdateBanner(BannerID, PageID, BannerName,
                                                                                        IsPublish, PictureID, URL, Views, Position);
            Banner item = DBMapping(dbItem);

            return item;
        }

        public static Banner GetBannerByID(int BannerID)
        {
            if (BannerID == 0)
                return null;

            DBBanner dbItem = DBProviderManager<DBBannerProvider>.Provider.GetBannerByID(BannerID);
            Banner item = DBMapping(dbItem);

            return item;
        }
        #endregion

        #endregion

        #region Custom Methods
        public static BannerCollection GetBannerByPageID(int PageID)
        {
            DBBannerCollection dbCollection = DBProviderManager<DBBannerProvider>.Provider.GetBannerByPageID(PageID);
            BannerCollection collection = DBMapping(dbCollection);
            return collection;
        }
        #endregion


    }
}
