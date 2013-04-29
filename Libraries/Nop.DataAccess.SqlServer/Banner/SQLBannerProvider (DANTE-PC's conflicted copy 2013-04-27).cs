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
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Configuration.Provider;
using System.Collections.Specialized;

namespace NopSolutions.NopCommerce.DataAccess.Banner
{
    /// <summary>
    /// Blog provider for SQL Server
    /// </summary>
    public partial class SQLBannerProvider : DBBannerProvider
    {
        #region Fields
        private string _sqlConnectionString;
        #endregion

        #region Utilities
        private DBPage GetPageFromReader(IDataReader dataReader)
        {
            DBPage item = new DBPage();
            item.PageID = NopSqlDataHelper.GetInt(dataReader, "PageID");
            item.PageName = NopSqlDataHelper.GetString(dataReader, "PageName");
            item.IsPublish = NopSqlDataHelper.GetBoolean(dataReader, "Publish");
            return item;
        }

        private DBBanner GetBannerFromReader(IDataReader dataReader)
        {
            DBBanner item = new DBBanner();
            item.BannerID = NopSqlDataHelper.GetInt(dataReader, "BannerID");
            item.BannerName = NopSqlDataHelper.GetString(dataReader, "BannerName");
            item.IsPublish = NopSqlDataHelper.GetBoolean(dataReader, "Publish");
            item.PageID = NopSqlDataHelper.GetInt(dataReader, "PageID");
            item.PictureID = NopSqlDataHelper.GetInt(dataReader, "PictureID");
            item.URL = NopSqlDataHelper.GetString(dataReader, "URL");
            item.Views = NopSqlDataHelper.GetInt(dataReader, "Views");
            return item;
        }

        #endregion

        #region Methods
        /// <summary>
        /// Initializes the provider with the property values specified in the application's configuration file. This method is not intended to be used directly from your code
        /// </summary>
        /// <param name="name">The name of the provider instance to initialize</param>
        /// <param name="config">A NameValueCollection that contains the names and values of configuration options for the provider.</param>
        public override void Initialize(string name, NameValueCollection config)
        {
            if (config == null)
            {
                throw new ArgumentNullException("config");
            }

            base.Initialize(name, config);

            string connectionStringName = config["connectionStringName"];
            if (String.IsNullOrEmpty(connectionStringName))
                throw new ProviderException("Connection name not specified");
            this._sqlConnectionString = NopSqlDataHelper.GetConnectionString(connectionStringName);
            if ((this._sqlConnectionString == null) || (this._sqlConnectionString.Length < 1))
            {
                throw new ProviderException(string.Format("Connection string not found. {0}", connectionStringName));
            }
            config.Remove("connectionStringName");

            if (config.Count > 0)
            {
                string key = config.GetKey(0);
                if (!string.IsNullOrEmpty(key))
                {
                    throw new ProviderException(string.Format("Provider unrecognized attribute. {0}", new object[] { key }));
                }
            }
        }

        #region Page
        public override DBPage InsertPage(string PageName, bool IsPublish)
        {
            DBPage item = null;
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_PageInsert");
            db.AddOutParameter(dbCommand, "PageID", DbType.Int32, 0);
            db.AddInParameter(dbCommand, "PageName", DbType.String, PageName);
            db.AddInParameter(dbCommand, "IsPublish", DbType.Boolean, IsPublish);
            if (db.ExecuteNonQuery(dbCommand) > 0)
            {
                int PageID = Convert.ToInt32(db.GetParameterValue(dbCommand, "@PageID"));
                item = GetPageByID(PageID);
            }
            return item;
        }

        public override DBPageCollection GetAllPage()
        {
            DBPageCollection itemcollection = new DBPageCollection();
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_PageLoadAll");
            using (IDataReader dataReader = db.ExecuteReader(dbCommand))
            {
                while (dataReader.Read())
                {
                    DBPage question = GetPageFromReader(dataReader);
                    itemcollection.Add(question);
                }
            }
            return itemcollection;
        }

        public override void DeletePage(int PageID)
        {
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_PageDelete");
            db.AddInParameter(dbCommand, "PageID", DbType.Int32, PageID);
            int retValue = db.ExecuteNonQuery(dbCommand);
        }

        public override DBPage UpdatePage(int PageID, string PageName, bool IsPublish)
        {
            DBPage item = null;
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_PageUpdate");
            db.AddInParameter(dbCommand, "PageID", DbType.Int32, PageID);
            db.AddInParameter(dbCommand, "PageName", DbType.String, PageName);
            db.AddInParameter(dbCommand, "IsPublish", DbType.Boolean, IsPublish);
            if (db.ExecuteNonQuery(dbCommand) > 0)
                item = GetPageByID(PageID);

            return item;
        }

        public override DBPage GetPageByID(int PageID)
        {
            DBPage item = null;
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_PageLoadByPrimaryKey");
            db.AddInParameter(dbCommand, "PageID", DbType.Int32, PageID);
            using (IDataReader dataReader = db.ExecuteReader(dbCommand))
            {
                while (dataReader.Read())
                {
                    item = GetPageFromReader(dataReader);
                }
            }
            return item;
        }
        #endregion

        #region Banner
        public override DBBanner InsertBanner(int PageID, string BannerName, bool IsPublish, int PictureID, string URL, int Views)
        {
            DBBanner item = null;
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_BannerInsert");
            db.AddOutParameter(dbCommand, "BannerID", DbType.Int32, 0);
            db.AddInParameter(dbCommand, "PageID", DbType.Int32, PageID);
            db.AddInParameter(dbCommand, "BannerName", DbType.String, BannerName);
            db.AddInParameter(dbCommand, "IsPublish", DbType.Boolean, IsPublish);
            db.AddInParameter(dbCommand, "PictureID", DbType.Int32, PictureID);
            db.AddInParameter(dbCommand, "URL", DbType.String, URL);
            db.AddInParameter(dbCommand, "Views", DbType.Int32, Views);
            if (db.ExecuteNonQuery(dbCommand) > 0)
            {
                int BannerID = Convert.ToInt32(db.GetParameterValue(dbCommand, "@BannerID"));
                item = GetBannerByID(BannerID);
            }
            return item;
        }

        public override DBBannerCollection GetAllBanner()
        {
            DBBannerCollection itemcollection = new DBBannerCollection();
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_BannerLoadAll");
            using (IDataReader dataReader = db.ExecuteReader(dbCommand))
            {
                while (dataReader.Read())
                {
                    DBBanner item = GetBannerFromReader(dataReader);
                    itemcollection.Add(item);
                }
            }
            return itemcollection;
        }

        public override void DeleteBanner(int BannerID)
        {
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_BannerDelete");
            db.AddInParameter(dbCommand, "BannerID", DbType.Int32, BannerID);
            int retValue = db.ExecuteNonQuery(dbCommand);
        }

        public override DBBanner UpdateBanner(int BannerID, int PageID, string BannerName, bool IsPublish, int PictureID, string URL, int Views)
        {
            DBBanner item = null;
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_BannerUpdate");
            db.AddInParameter(dbCommand, "BannerID", DbType.Int32, BannerID);
            db.AddInParameter(dbCommand, "PageID", DbType.Int32, PageID);
            db.AddInParameter(dbCommand, "BannerName", DbType.String, BannerName);
            db.AddInParameter(dbCommand, "IsPublish", DbType.Boolean, IsPublish);
            db.AddInParameter(dbCommand, "PictureID", DbType.Int32, PictureID);
            db.AddInParameter(dbCommand, "URL", DbType.String, URL);
            db.AddInParameter(dbCommand, "Views", DbType.Int32, Views);
            if (db.ExecuteNonQuery(dbCommand) > 0)
                item = GetBannerByID(BannerID);

            return item;
        }

        public override DBBanner GetBannerByID(int BannerID)
        {
            DBBanner item = null;
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_BannerLoadByPrimaryKey");
            db.AddInParameter(dbCommand, "BannerID", DbType.Int32, BannerID);
            using (IDataReader dataReader = db.ExecuteReader(dbCommand))
            {
                while (dataReader.Read())
                {
                    item = GetBannerFromReader(dataReader);
                }
            }
            return item;
        }
        #endregion

        #region Custom Methods
        public override DBBannerCollection GetBannerByPageID(int PageID)
        {
            DBBannerCollection itemcollection = new DBBannerCollection();
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_BannerLoadByPageID");
            db.AddInParameter(dbCommand, "PageID", DbType.Int32, PageID);
            using (IDataReader dataReader = db.ExecuteReader(dbCommand))
            {
                while (dataReader.Read())
                {
                    DBBanner item = GetBannerFromReader(dataReader);
                    itemcollection.Add(item);
                }
            }
            return itemcollection;
        }
        #endregion

        #endregion






    }
}
