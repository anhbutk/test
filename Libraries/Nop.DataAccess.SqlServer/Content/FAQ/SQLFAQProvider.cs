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
using System.Configuration.Provider;
using System.Data;
using System.Data.Common;
using System.Globalization;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace NopSolutions.NopCommerce.DataAccess.Content.FAQ
{
    /// <summary>
    /// Forum provider for SQL Server
    /// </summary>
    public partial class SQLFAQProvider : DBFAQProvider
    {
        #region Fields
        private string _sqlConnectionString;
        #endregion

        #region Utilities
        private DBFAQ GetFAQFromReader(IDataReader dataReader)
        {
            DBFAQ faq = new DBFAQ();
            faq.FAQID = NopSqlDataHelper.GetInt(dataReader, "FAQID");
            faq.Question = NopSqlDataHelper.GetString(dataReader, "Question");
            faq.Answer = NopSqlDataHelper.GetString(dataReader, "Answer");
            faq.DisplayOrder = NopSqlDataHelper.GetInt(dataReader, "DisplayOrder");
            faq.OnOff = NopSqlDataHelper.GetBoolean(dataReader, "OnOff");
            return faq;
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

        public override void DeleteFAQ(int FAQID)
        {
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_FAQDelete");
            db.AddInParameter(dbCommand, "FAQID", DbType.Int32, FAQID);
            int retValue = db.ExecuteNonQuery(dbCommand);
        }

        public override DBFAQ GetFAQByID(int FAQID)
        {
            DBFAQ faq = null;
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_FAQLoadByPrimaryKey");
            db.AddInParameter(dbCommand, "FAQID", DbType.Int32, FAQID);
            using (IDataReader dataReader = db.ExecuteReader(dbCommand))
            {
                if (dataReader.Read())
                {
                    faq = GetFAQFromReader(dataReader);
                }
            }
            return faq;
        }

        public override DBFAQCollection GetAllFAQ()
        {
            DBFAQCollection faqCollection = new DBFAQCollection();
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_FAQLoadAll");
            using (IDataReader dataReader = db.ExecuteReader(dbCommand))
            {
                while (dataReader.Read())
                {
                    DBFAQ faq = GetFAQFromReader(dataReader);
                    faqCollection.Add(faq);
                }
            }

            return faqCollection;
        }

        public override DBFAQCollection GetPublishFAQ()
        {
            DBFAQCollection faqCollection = new DBFAQCollection();
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_FAQLoadPublish");
            using (IDataReader dataReader = db.ExecuteReader(dbCommand))
            {
                while (dataReader.Read())
                {
                    DBFAQ faq = GetFAQFromReader(dataReader);
                    faqCollection.Add(faq);
                }
            }

            return faqCollection;
        }

        public override DBFAQ InsertFAQ(string Question, string Answer, int DisplayOrder, bool OnOff)
        {
            DBFAQ faq = null;
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_FAQInsert");
            db.AddOutParameter(dbCommand, "FAQID", DbType.Int32, 0);
            db.AddInParameter(dbCommand, "Question", DbType.String, Question);
            db.AddInParameter(dbCommand, "Answer", DbType.String, Answer);
            db.AddInParameter(dbCommand, "DisplayOrder", DbType.Int32, DisplayOrder);
            db.AddInParameter(dbCommand, "OnOff", DbType.Boolean, OnOff);
            if (db.ExecuteNonQuery(dbCommand) > 0)
            {
                int FaqID = Convert.ToInt32(db.GetParameterValue(dbCommand, "@FAQID"));
                faq = GetFAQByID(FaqID);
            }
            return faq;
        }

        public override DBFAQ UpdateFAQ(int FAQID, string Question, string Answer, int DisplayOrder, bool OnOff)
        {
            DBFAQ faq = null;
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_FAQUpdate");
            db.AddInParameter(dbCommand, "FAQID", DbType.Int32, FAQID);
            db.AddInParameter(dbCommand, "Question", DbType.String, Question);
            db.AddInParameter(dbCommand, "Answer", DbType.String, Answer);
            db.AddInParameter(dbCommand, "DisplayOrder", DbType.Int32, DisplayOrder);
            db.AddInParameter(dbCommand, "OnOff", DbType.Boolean, OnOff);
            if (db.ExecuteNonQuery(dbCommand) > 0)
                faq = GetFAQByID(FAQID);

            return faq;
        }
        #endregion

       
    }
}
