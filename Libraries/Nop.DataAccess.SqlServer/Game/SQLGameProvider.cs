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

namespace NopSolutions.NopCommerce.DataAccess.Game
{
    /// <summary>
    /// Blog provider for SQL Server
    /// </summary>
    public partial class SQLGameProvider : DBGameProvider
    {
        #region Fields
        private string _sqlConnectionString;
        #endregion

        #region Utilities
        private DBQuestion GetQuestionFromReader(IDataReader dataReader)
        {
            DBQuestion question = new DBQuestion();
            question.QuestionID = NopSqlDataHelper.GetInt(dataReader, "QuestionID");
            question.QuestionContent = NopSqlDataHelper.GetString(dataReader, "QuestionContent");
            question.OnOff = NopSqlDataHelper.GetBoolean(dataReader, "OnOff");
            return question;
        }

        private DBQuestionInMonth GetQuestionInMonthFromReader(IDataReader dataReader)
        {
            DBQuestionInMonth questioninmonth = new DBQuestionInMonth();
            questioninmonth.QuestionInMonthID = NopSqlDataHelper.GetInt(dataReader, "QuestionInMonthID");
            questioninmonth.QuestionID = NopSqlDataHelper.GetInt(dataReader, "QuestionID");
            questioninmonth.Month = NopSqlDataHelper.GetInt(dataReader, "Month");
            questioninmonth.Year = NopSqlDataHelper.GetInt(dataReader, "Year");
            return questioninmonth;
        }

        private DBAnswer GetAnswerFromReader(IDataReader dataReader)
        {
            DBAnswer answer = new DBAnswer();
            answer.AnswerID = NopSqlDataHelper.GetInt(dataReader, "AnswerID");
            answer.AnswerContent = NopSqlDataHelper.GetString(dataReader, "AnswerContent");
            answer.IsCorrect = NopSqlDataHelper.GetBoolean(dataReader, "IsCorrect");
            answer.QuestionID = NopSqlDataHelper.GetInt(dataReader, "QuestionID");
            return answer;
        }

        private DBCustomerResultDetail GetCustomerResultDetailFromReader(IDataReader dataReader)
        {
            DBCustomerResultDetail customerresultdetail = new DBCustomerResultDetail();
            customerresultdetail.ID = NopSqlDataHelper.GetInt(dataReader, "ID");
            customerresultdetail.AnswerID = NopSqlDataHelper.GetInt(dataReader, "AnswerID");
            customerresultdetail.CustomerResultID = NopSqlDataHelper.GetInt(dataReader, "CustomerResultID");
            customerresultdetail.IsCorrect = NopSqlDataHelper.GetBoolean(dataReader, "IsCorrect");
            customerresultdetail.QuestionID = NopSqlDataHelper.GetInt(dataReader, "QuestionID");
            return customerresultdetail;
        }

        private DBCustomerResult GetCustomerResultFromReader(IDataReader dataReader)
        {
            DBCustomerResult customerresult = new DBCustomerResult();
            customerresult.CustomerResultID = NopSqlDataHelper.GetInt(dataReader, "CustomerResultID");
            customerresult.CustomerID = NopSqlDataHelper.GetInt(dataReader, "CustomerID");
            customerresult.CompleteDate = NopSqlDataHelper.GetDateTime(dataReader, "CompleteDate");
            customerresult.IsCorrectAll = NopSqlDataHelper.GetBoolean(dataReader, "IsCorrectAll");
            customerresult.IsWinner = NopSqlDataHelper.GetBoolean(dataReader, "IsWinner");
            return customerresult;
        }

        private DBWinnerInMonth GetWinnerInMonthFromReader(IDataReader dataReader)
        {
            DBWinnerInMonth winnerinmonth = new DBWinnerInMonth();
            winnerinmonth.ID = NopSqlDataHelper.GetInt(dataReader, "ID");
            winnerinmonth.CustomerResultID = NopSqlDataHelper.GetInt(dataReader, "CustomerResultID");
            winnerinmonth.Month = NopSqlDataHelper.GetInt(dataReader, "Month");
            winnerinmonth.Year = NopSqlDataHelper.GetInt(dataReader, "Year");
            return winnerinmonth;
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

        #region Question
        public override void DeleteQuestion(int QuestionID)
        {
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_QuestionDelete");
            db.AddInParameter(dbCommand, "QuestionID", DbType.Int32, QuestionID);
            int retValue = db.ExecuteNonQuery(dbCommand);
        }

        public override DBQuestionCollection GetAllQuestions()
        {
            DBQuestionCollection questioncollection = new DBQuestionCollection();
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_QuestionLoadAll");
            using (IDataReader dataReader = db.ExecuteReader(dbCommand))
            {
                while (dataReader.Read())
                {
                    DBQuestion question = GetQuestionFromReader(dataReader);
                    questioncollection.Add(question);
                }
            }
            return questioncollection;
        }

        public override DBQuestion GetQuestionByID(int QuestionID)
        {
            DBQuestion question = null;
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_QuestionLoadByPrimaryKey");
            db.AddInParameter(dbCommand, "QuestionID", DbType.Int32, QuestionID);
            using (IDataReader dataReader = db.ExecuteReader(dbCommand))
            {
                while (dataReader.Read())
                {
                    question = GetQuestionFromReader(dataReader);
                }
            }
            return question;
        }

        public override DBQuestion InsertQuestion(string QuestionContent, bool OnOff)
        {
            DBQuestion question = null;
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_QuestionInsert");
            db.AddOutParameter(dbCommand, "QuestionID", DbType.Int32, 0);
            db.AddInParameter(dbCommand, "QuestionContent", DbType.String, QuestionContent);
            db.AddInParameter(dbCommand, "OnOff", DbType.Boolean, OnOff);
            if (db.ExecuteNonQuery(dbCommand) > 0)
            {
                int QuestionID = Convert.ToInt32(db.GetParameterValue(dbCommand, "@QuestionID"));
                question = GetQuestionByID(QuestionID);
            }
            return question;
        }

        public override DBQuestion UpdateQuestion(int QuestionID, string QuestionContent, bool OnOff)
        {
            DBQuestion question = null;
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_QuestionUpdate");
            db.AddInParameter(dbCommand, "QuestionID", DbType.Int32, QuestionID);
            db.AddInParameter(dbCommand, "QuestionContent", DbType.String, QuestionContent);
            db.AddInParameter(dbCommand, "OnOff", DbType.Boolean, OnOff);
            if (db.ExecuteNonQuery(dbCommand) > 0)
                question = GetQuestionByID(QuestionID);

            return question;
        }
        #endregion

        #region Answer
        public override void DeleteAnswer(int AnswerID)
        {
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_AnswerDelete");
            db.AddInParameter(dbCommand, "AnswerID", DbType.Int32, AnswerID);
            int retValue = db.ExecuteNonQuery(dbCommand);
        }

        public override DBAnswerCollection GetAllAnswer()
        {
            DBAnswerCollection answercollection = new DBAnswerCollection();
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_AnswerLoadAll");
            using (IDataReader dataReader = db.ExecuteReader(dbCommand))
            {
                while (dataReader.Read())
                {
                    DBAnswer answer = GetAnswerFromReader(dataReader);
                    answercollection.Add(answer);
                }
            }
            return answercollection;
        }

        public override DBAnswer GetAnswerByID(int AnswerID)
        {
            DBAnswer answer = null;
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_AnswerLoadByPrimaryKey");
            db.AddInParameter(dbCommand, "AnswerID", DbType.Int32, AnswerID);
            using (IDataReader dataReader = db.ExecuteReader(dbCommand))
            {
                if (dataReader.Read())
                {
                    answer = GetAnswerFromReader(dataReader);
                }
            }
            return answer;
        }

        public override DBAnswer InsertAnswer(int QuestionID, string AnswerContent, bool IsCorrect)
        {
            DBAnswer answer = null;
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_AnswerInsert");
            db.AddOutParameter(dbCommand, "AnswerID", DbType.Int32, 0);
            db.AddInParameter(dbCommand, "QuestionID", DbType.Int32, QuestionID);
            db.AddInParameter(dbCommand, "AnswerContent", DbType.String, AnswerContent);
            db.AddInParameter(dbCommand, "IsCorrect", DbType.Boolean, IsCorrect);
            if (db.ExecuteNonQuery(dbCommand) > 0)
            {
                int AnswerID = Convert.ToInt32(db.GetParameterValue(dbCommand, "@AnswerID"));
                answer = GetAnswerByID(AnswerID);
            }
            return answer;
        }

        public override DBAnswer UpdateAnswer(int AnswerID, int QuestionID, string AnswerContent, bool IsCorrect)
        {
            DBAnswer answer = null;
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_AnswerUpdate");
            db.AddInParameter(dbCommand, "AnswerID", DbType.Int32, AnswerID);
            db.AddInParameter(dbCommand, "QuestionID", DbType.Int32, QuestionID);
            db.AddInParameter(dbCommand, "AnswerContent", DbType.String, AnswerContent);
            db.AddInParameter(dbCommand, "IsCorrect", DbType.Boolean, IsCorrect);
            if (db.ExecuteNonQuery(dbCommand) > 0)
                answer = GetAnswerByID(AnswerID);

            return answer;
        }
        #endregion

        #region CustomerResultDetail
        public override void DeleteCustomerResultDetail(int ID)
        {
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_CustomerResultDetailDelete");
            db.AddInParameter(dbCommand, "ID", DbType.Int32, ID);
            int retValue = db.ExecuteNonQuery(dbCommand);
        }

        public override DBCustomerResultDetailCollection GetAllCustomerResultDetail()
        {
            DBCustomerResultDetailCollection customerResultDetailCollection = new DBCustomerResultDetailCollection();
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_CustomerResultDetailLoadAll");
            using (IDataReader dataReader = db.ExecuteReader(dbCommand))
            {
                while (dataReader.Read())
                {
                    DBCustomerResultDetail customerResultDetail = GetCustomerResultDetailFromReader(dataReader);
                    customerResultDetailCollection.Add(customerResultDetail);
                }
            }
            return customerResultDetailCollection;
        }

        public override DBCustomerResultDetail GetCustomerResultDetailByID(int ID)
        {
            DBCustomerResultDetail customerResultDetail = null;
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_CustomerResultDetailLoadByPrimaryKey");
            db.AddInParameter(dbCommand, "ID", DbType.Int32, ID);
            using (IDataReader dataReader = db.ExecuteReader(dbCommand))
            {
                if (dataReader.Read())
                {
                    customerResultDetail = GetCustomerResultDetailFromReader(dataReader);
                }
            }
            return customerResultDetail;
        }

        public override DBCustomerResultDetail InsertCustomerResultDetail(int CustomerResultID, int QuestionID, int AnswerID, bool IsCorrect)
        {
            DBCustomerResultDetail customerResultDetail = null;
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_CustomerResultDetailInsert");
            db.AddOutParameter(dbCommand, "CustomerResultDetailID", DbType.Int32, 0);
            db.AddInParameter(dbCommand, "CustomerResultID", DbType.Int32, CustomerResultID);
            db.AddInParameter(dbCommand, "QuestionID", DbType.Int32, QuestionID);
            db.AddInParameter(dbCommand, "AnswerID", DbType.Int32, AnswerID);
            db.AddInParameter(dbCommand, "IsCorrect", DbType.Boolean, IsCorrect);
            if (db.ExecuteNonQuery(dbCommand) > 0)
            {
                int CustomerResultDetailID = Convert.ToInt32(db.GetParameterValue(dbCommand, "@CustomerResultDetailID"));
                customerResultDetail = GetCustomerResultDetailByID(CustomerResultDetailID);
            }
            return customerResultDetail;
        }

        public override DBCustomerResultDetail UpdateCustomerResultDetail(int ID, int CustomerResultID, int QuestionID, int AnswerID, bool IsCorrect)
        {
            DBCustomerResultDetail customerResultDetail = null;
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_CustomerResultDetailUpdate");
            db.AddInParameter(dbCommand, "ID", DbType.Int32, ID);
            db.AddInParameter(dbCommand, "CustomerResultID", DbType.Int32, CustomerResultID);
            db.AddInParameter(dbCommand, "QuestionID", DbType.Int32, QuestionID);
            db.AddInParameter(dbCommand, "AnswerID", DbType.Int32, AnswerID);
            db.AddInParameter(dbCommand, "IsCorrect", DbType.Boolean, IsCorrect);
            if (db.ExecuteNonQuery(dbCommand) > 0)
                customerResultDetail = GetCustomerResultDetailByID(ID);

            return customerResultDetail;
        }
        #endregion

        #region DBCustomerResult
        public override void DeleteCustomerResult(int CustomerResultID)
        {
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_CustomerResultDelete");
            db.AddInParameter(dbCommand, "CustomerResultID", DbType.Int32, CustomerResultID);
            int retValue = db.ExecuteNonQuery(dbCommand);
        }

        public override DBCustomerResultCollection GetAllCustomerResult()
        {
            DBCustomerResultCollection customerResultCollection = new DBCustomerResultCollection();
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_CustomerResultLoadAll");
            using (IDataReader dataReader = db.ExecuteReader(dbCommand))
            {
                while (dataReader.Read())
                {
                    DBCustomerResult customerResult = GetCustomerResultFromReader(dataReader);
                    customerResultCollection.Add(customerResult);
                }
            }
            return customerResultCollection;
        }

        public override DBCustomerResult GetCustomerResultByID(int CustomerResultID)
        {
            DBCustomerResult customerResult = null;
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_CustomerResultLoadByPrimaryKey");
            db.AddInParameter(dbCommand, "CustomerResultID", DbType.Int32, CustomerResultID);
            using (IDataReader dataReader = db.ExecuteReader(dbCommand))
            {
                if (dataReader.Read())
                {
                    customerResult = GetCustomerResultFromReader(dataReader);
                }
            }
            return customerResult;
        }

        public override DBCustomerResult InsertCustomerResult(int CustomerID, DateTime CompleteDate, bool IsCorrectAll, bool IsWinner)
        {
            DBCustomerResult customerResult = null;
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_CustomerResultInsert");
            db.AddOutParameter(dbCommand, "CustomerResultID", DbType.Int32, 0);
            db.AddInParameter(dbCommand, "CustomerID", DbType.Int32, CustomerID);
            db.AddInParameter(dbCommand, "CompleteDate", DbType.DateTime, CompleteDate);
            db.AddInParameter(dbCommand, "IsCorrectAll", DbType.Boolean, IsCorrectAll);
            db.AddInParameter(dbCommand, "IsWinner", DbType.Boolean, IsWinner);
            if (db.ExecuteNonQuery(dbCommand) > 0)
            {
                int CustomerResultID = Convert.ToInt32(db.GetParameterValue(dbCommand, "@CustomerResultID"));
                customerResult = GetCustomerResultByID(CustomerResultID);
            }
            return customerResult;
        }

        public override DBCustomerResult UpdateCustomerResult(int CustomerResultID, int CustomerID, DateTime CompleteDate, bool IsCorrectAll, bool IsWinner)
        {
            DBCustomerResult customerResult = null;
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_CustomerResultUpdate");
            db.AddInParameter(dbCommand, "CustomerResultID", DbType.Int32, CustomerResultID);
            db.AddInParameter(dbCommand, "CustomerID", DbType.Int32, CustomerID);
            db.AddInParameter(dbCommand, "CompleteDate", DbType.DateTime, CompleteDate);
            db.AddInParameter(dbCommand, "IsCorrectAll", DbType.Boolean, IsCorrectAll);
            db.AddInParameter(dbCommand, "IsWinner", DbType.Boolean, IsWinner);
            if (db.ExecuteNonQuery(dbCommand) > 0)
                customerResult = GetCustomerResultByID(CustomerResultID);

            return customerResult;
        }
        #endregion

        #region DBQuestionInMonth
        public override void DeleteQuestionInMonth(int QuestionInMonthID)
        {
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_QuestionInMonthDelete");
            db.AddInParameter(dbCommand, "QuestionInMonthID", DbType.Int32, QuestionInMonthID);
            int retValue = db.ExecuteNonQuery(dbCommand);
        }

        public override DBQuestionInMonthCollection GetAllQuestionInMonth()
        {
            DBQuestionInMonthCollection questionInMonthCollection = new DBQuestionInMonthCollection();
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_QuestionInMonthLoadAll");
            using (IDataReader dataReader = db.ExecuteReader(dbCommand))
            {
                while (dataReader.Read())
                {
                    DBQuestionInMonth questionInMonth = GetQuestionInMonthFromReader(dataReader);
                    questionInMonthCollection.Add(questionInMonth);
                }
            }
            return questionInMonthCollection;
        }

        public override DBQuestionInMonth GetQuestionInMonthByID(int QuestionInMonthID)
        {
            DBQuestionInMonth questionInMonth = null;
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_QuestionInMonthLoadByPrimaryKey");
            db.AddInParameter(dbCommand, "QuestionInMonthID", DbType.Int32, QuestionInMonthID);
            using (IDataReader dataReader = db.ExecuteReader(dbCommand))
            {
                if (dataReader.Read())
                {
                    questionInMonth = GetQuestionInMonthFromReader(dataReader);
                }
            }
            return questionInMonth;
        }

        public override DBQuestionInMonth InsertQuestionInMonth(int QuestionID, int Month, int Year)
        {
            DBQuestionInMonth questionInMonth = null;
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_QuestionInMonthInsert");
            db.AddOutParameter(dbCommand, "QuestionInMonthID", DbType.Int32, 0);
            db.AddInParameter(dbCommand, "QuestionID", DbType.Int32, QuestionID);
            db.AddInParameter(dbCommand, "Month", DbType.Int32, Month);
            db.AddInParameter(dbCommand, "Year", DbType.Int32, Year);
            if (db.ExecuteNonQuery(dbCommand) > 0)
            {
                int QuestionInMonthID = Convert.ToInt32(db.GetParameterValue(dbCommand, "@QuestionInMonthID"));
                questionInMonth = GetQuestionInMonthByID(QuestionInMonthID);
            }
            return questionInMonth;
        }

        public override DBQuestionInMonth UpdateQuestionInMonth(int QuestionInMonthID, int QuestionID, int Month, int Year)
        {
            DBQuestionInMonth questionInMonth = null;
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_QuestionInMonthUpdate");
            db.AddInParameter(dbCommand, "QuestionInMonthID", DbType.Int32, QuestionInMonthID);
            db.AddInParameter(dbCommand, "QuestionID", DbType.Int32, QuestionID);
            db.AddInParameter(dbCommand, "Month", DbType.Int32, Month);
            db.AddInParameter(dbCommand, "Year", DbType.Int32, Year);
            if (db.ExecuteNonQuery(dbCommand) > 0)
                questionInMonth = GetQuestionInMonthByID(QuestionInMonthID);

            return questionInMonth;
        }
        #endregion

        #region DBQuestionInMonth
        public override void DeleteWinnerInMonth(int ID)
        {
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_DeleteWinnerInMonthDelete");
            db.AddInParameter(dbCommand, "ID", DbType.Int32, ID);
            int retValue = db.ExecuteNonQuery(dbCommand);
        }

        public override DBWinnerInMonthCollection GetAllWinnerInMonth()
        {
            DBWinnerInMonthCollection winnerInMonthCollection = new DBWinnerInMonthCollection();
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_WinnerInMonthLoadAll");
            using (IDataReader dataReader = db.ExecuteReader(dbCommand))
            {
                while (dataReader.Read())
                {
                    DBWinnerInMonth winnerInMonth = GetWinnerInMonthFromReader(dataReader);
                    winnerInMonthCollection.Add(winnerInMonth);
                }
            }
            return winnerInMonthCollection;
        }

        public override DBWinnerInMonth GetWinnerInMonthByID(int ID)
        {
            DBWinnerInMonth winnerInMonth = null;
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_WinnerInMonthLoadByPrimaryKey");
            db.AddInParameter(dbCommand, "ID", DbType.Int32, ID);
            using (IDataReader dataReader = db.ExecuteReader(dbCommand))
            {
                if (dataReader.Read())
                {
                    winnerInMonth = GetWinnerInMonthFromReader(dataReader);
                }
            }
            return winnerInMonth;
        }

        public override DBWinnerInMonth InsertWinnerInMonth(int CustomerResultID, int Month, int Year)
        {
            DBWinnerInMonth winnerInMonth = null;
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_WinnerInMonthInsert");
            db.AddOutParameter(dbCommand, "ID", DbType.Int32, 0);
            db.AddInParameter(dbCommand, "CustomerResultID", DbType.Int32, CustomerResultID);
            db.AddInParameter(dbCommand, "Month", DbType.Int32, Month);
            db.AddInParameter(dbCommand, "Year", DbType.Int32, Year);
            if (db.ExecuteNonQuery(dbCommand) > 0)
            {
                int WinnerInMonthID = Convert.ToInt32(db.GetParameterValue(dbCommand, "@ID"));
                winnerInMonth = GetWinnerInMonthByID(WinnerInMonthID);
            }
            return winnerInMonth;
        }

        public override DBWinnerInMonth UpdateWinnerInMonth(int ID, int CustomerResultID, int Month, int Year)
        {
            DBWinnerInMonth winnerInMonth = null;
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_WinnerInMonthUpdate");
            db.AddInParameter(dbCommand, "ID", DbType.Int32, ID);
            db.AddInParameter(dbCommand, "CustomerResultID", DbType.Int32, CustomerResultID);
            db.AddInParameter(dbCommand, "Month", DbType.Int32, Month);
            db.AddInParameter(dbCommand, "Year", DbType.Int32, Year);
            if (db.ExecuteNonQuery(dbCommand) > 0)
                winnerInMonth = GetWinnerInMonthByID(ID);

            return winnerInMonth;
        }
        #endregion

        #region Custom Methods
        public override DBAnswerCollection GetAllAnswerByQuestionID(int QuestionID)
        {
            DBAnswerCollection answerCollection = new DBAnswerCollection();
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_AnswerByQuestionID");
            db.AddInParameter(dbCommand, "QuestionID", DbType.Int32, QuestionID);
            using (IDataReader dataReader = db.ExecuteReader(dbCommand))
            {
                while (dataReader.Read())
                {
                    DBAnswer answer = GetAnswerFromReader(dataReader);
                    answerCollection.Add(answer);
                }
            }
            return answerCollection;
        }

        public override DBCustomerResultDetailCollection GetAllCustomerResultDetailByCustomerResultID(int CustomerResultID)
        {
            DBCustomerResultDetailCollection customerResultDetailCollection = new DBCustomerResultDetailCollection();
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_CustomerResultDetailByCustomerResultID");
            db.AddInParameter(dbCommand, "CustomerResultID", DbType.Int32, CustomerResultID);
            using (IDataReader dataReader = db.ExecuteReader(dbCommand))
            {
                while (dataReader.Read())
                {
                    DBCustomerResultDetail customerResultDetail = GetCustomerResultDetailFromReader(dataReader);
                    customerResultDetailCollection.Add(customerResultDetail);
                }
            }
            return customerResultDetailCollection;
        }

        public override DBQuestionCollection GetAllQuestionByMonth(int Month, int Year)
        {
            DBQuestionCollection questionCollection = new DBQuestionCollection();
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_AllQuestionByMonth");
            db.AddInParameter(dbCommand, "Month", DbType.Int32, Month);
            db.AddInParameter(dbCommand, "Year", DbType.Int32, Year);
            using (IDataReader dataReader = db.ExecuteReader(dbCommand))
            {
                while (dataReader.Read())
                {
                    DBQuestion question = GetQuestionFromReader(dataReader);
                    questionCollection.Add(question);
                }
            }
            return questionCollection;
        }

        public override DBWinnerInMonthCollection GetWinnerByMonth(int Month)
        {
            DBWinnerInMonthCollection winnerInMonthCollection = new DBWinnerInMonthCollection();
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_WinnerByMonth");
            db.AddInParameter(dbCommand, "Month", DbType.Int32, Month);
            using (IDataReader dataReader = db.ExecuteReader(dbCommand))
            {
                if (dataReader.Read())
                {
                    DBWinnerInMonth winnerInMonth = GetWinnerInMonthFromReader(dataReader);
                    winnerInMonthCollection.Add(winnerInMonth);
                }
            }
            return winnerInMonthCollection;
        }

        public override void DeleteQuestionInMonthByMonthYear(int Month, int Year)
        {
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_QuestionInMonthDeleteByMonthYear");
            db.AddInParameter(dbCommand, "Month", DbType.Int32, Month);
            db.AddInParameter(dbCommand, "Year", DbType.Int32, Year);
            int retValue = db.ExecuteNonQuery(dbCommand);
        }

        public override DBCustomerResultCollection GetCustomerResultByDate(int Month, int Year)
        {
            DBCustomerResultCollection customerResultCollection = new DBCustomerResultCollection();
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_CustomerResultLoadByDate");
            db.AddInParameter(dbCommand, "Month", DbType.Int32, Month);
            db.AddInParameter(dbCommand, "Year", DbType.Int32, Year);
            using (IDataReader dataReader = db.ExecuteReader(dbCommand))
            {
                while (dataReader.Read())
                {
                    DBCustomerResult customerResult = GetCustomerResultFromReader(dataReader);
                    customerResultCollection.Add(customerResult);
                }
            }
            return customerResultCollection;
        }

        public override DataTable GetDistinctCustomerResultByMonthYear()
        {
            Database db = NopSqlDataHelper.CreateConnection(_sqlConnectionString);
            DbCommand dbCommand = db.GetStoredProcCommand("Nop_GetDistinctCustomerResultByMonthYear");
            DataSet ds = db.ExecuteDataSet(dbCommand);
            if (ds.Tables.Count > 0)
                return ds.Tables[0];
            return null;
        }
        #endregion

        #endregion
    }
}
