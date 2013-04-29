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
using NopSolutions.NopCommerce.DataAccess.Content.Blog;
using NopSolutions.NopCommerce.DataAccess.Game;

namespace NopSolutions.NopCommerce.BusinessLogic.Game
{
    /// <summary>
    /// Blog post manager
    /// </summary>
    public partial class GameManager
    {

        #region Utilities
        private static AnswerCollection DBMapping(DBAnswerCollection dbCollection)
        {
            if (dbCollection == null)
                return null;

            AnswerCollection collection = new AnswerCollection();
            foreach (DBAnswer dbItem in dbCollection)
            {
                Answer item = DBMapping(dbItem);
                collection.Add(item);
            }

            return collection;
        }

        private static Answer DBMapping(DBAnswer dbItem)
        {
            if (dbItem == null)
                return null;

            Answer item = new Answer();
            item.AnswerID = dbItem.AnswerID;
            item.AnswerContent = dbItem.AnswerContent;
            item.IsCorrect = dbItem.IsCorrect;
            item.QuestionID = dbItem.QuestionID;

            return item;
        }

        private static CustomerResultCollection DBMapping(DBCustomerResultCollection dbCollection)
        {
            if (dbCollection == null)
                return null;

            CustomerResultCollection collection = new CustomerResultCollection();
            foreach (DBCustomerResult dbItem in dbCollection)
            {
                CustomerResult item = DBMapping(dbItem);
                collection.Add(item);
            }

            return collection;
        }

        private static CustomerResult DBMapping(DBCustomerResult dbItem)
        {
            if (dbItem == null)
                return null;

            CustomerResult item = new CustomerResult();
            item.CompleteDate = dbItem.CompleteDate;
            item.CustomerID = dbItem.CustomerID;
            //item.CustomerResultDetails = dbItem.
            item.CustomerResultID = dbItem.CustomerResultID;
            item.IsCorrectAll = dbItem.IsCorrectAll;
            item.IsWinner = dbItem.IsWinner;

            return item;
        }

        private static CustomerResultDetailCollection DBMapping(DBCustomerResultDetailCollection dbCollection)
        {
            if (dbCollection == null)
                return null;

            CustomerResultDetailCollection collection = new CustomerResultDetailCollection();
            foreach (DBCustomerResultDetail dbItem in dbCollection)
            {
                CustomerResultDetail item = DBMapping(dbItem);
                collection.Add(item);
            }

            return collection;
        }

        private static CustomerResultDetail DBMapping(DBCustomerResultDetail dbItem)
        {
            if (dbItem == null)
                return null;

            CustomerResultDetail item = new CustomerResultDetail();
            item.AnswerID = dbItem.AnswerID;
            item.CustomerResultID = dbItem.CustomerResultID;
            item.ID = dbItem.ID;
            item.IsCorrect = dbItem.IsCorrect;
            item.QuestionID = dbItem.QuestionID;

            return item;
        }

        private static QuestionCollection DBMapping(DBQuestionCollection dbCollection)
        {
            if (dbCollection == null)
                return null;

            QuestionCollection collection = new QuestionCollection();
            foreach (DBQuestion dbItem in dbCollection)
            {
                Question item = DBMapping(dbItem);
                collection.Add(item);
            }

            return collection;
        }

        private static Question DBMapping(DBQuestion dbItem)
        {
            if (dbItem == null)
                return null;

            Question item = new Question();
            item.QuestionID = dbItem.QuestionID;
            item.QuestionContent = dbItem.QuestionContent;
            item.OnOff = dbItem.OnOff;
            //item.Answers = dbItem.

            return item;
        }

        private static QuestionInMonthCollection DBMapping(DBQuestionInMonthCollection dbCollection)
        {
            if (dbCollection == null)
                return null;

            QuestionInMonthCollection collection = new QuestionInMonthCollection();
            foreach (DBQuestionInMonth dbItem in dbCollection)
            {
                QuestionInMonth item = DBMapping(dbItem);
                collection.Add(item);
            }

            return collection;
        }

        private static QuestionInMonth DBMapping(DBQuestionInMonth dbItem)
        {
            if (dbItem == null)
                return null;

            QuestionInMonth item = new QuestionInMonth();
            item.Month = dbItem.Month;
            item.QuestionID = dbItem.QuestionID;
            item.QuestionInMonthID = dbItem.QuestionInMonthID;
            item.Year = dbItem.Year;

            return item;
        }

        private static WinnerInMonthCollection DBMapping(DBWinnerInMonthCollection dbCollection)
        {
            if (dbCollection == null)
                return null;

            WinnerInMonthCollection collection = new WinnerInMonthCollection();
            foreach (DBWinnerInMonth dbItem in dbCollection)
            {
                WinnerInMonth item = DBMapping(dbItem);
                collection.Add(item);
            }

            return collection;
        }

        private static WinnerInMonth DBMapping(DBWinnerInMonth dbItem)
        {
            if (dbItem == null)
                return null;

            WinnerInMonth item = new WinnerInMonth();
            item.CustomerResultID = dbItem.CustomerResultID;
            item.ID = dbItem.ID;
            item.Month = dbItem.Month;
            item.Year = dbItem.Year;

            return item;
        }
        #endregion

        #region Methods

        #region Question

        public static Question InsertQuestion(string QuestionContent, bool OnOff)
        {
            DBQuestion dbItem = DBProviderManager<DBGameProvider>.Provider.InsertQuestion(QuestionContent, OnOff);
            Question question = DBMapping(dbItem);

            return question;
        }

        public static QuestionCollection GetAllQuestions()
        {
            DBQuestionCollection dbCollection = DBProviderManager<DBGameProvider>.Provider.GetAllQuestions();
            QuestionCollection collection = DBMapping(dbCollection);
            return collection;
        }

        public static void DeleteQuestion(int QuestionID)
        {
            DBProviderManager<DBGameProvider>.Provider.DeleteQuestion(QuestionID);
        }

        public static Question UpdateQuestion(int QuestionID, string QuestionContent, bool OnOff)
        {
            DBQuestion dbItem = DBProviderManager<DBGameProvider>.Provider.UpdateQuestion(QuestionID, QuestionContent,
                                                                                          OnOff);
            Question question = DBMapping(dbItem);

            return question;
        }

        public static Question GetQuestionByID(int QuestionID)
        {
            if (QuestionID == 0)
                return null;

            DBQuestion dbItem = DBProviderManager<DBGameProvider>.Provider.GetQuestionByID(QuestionID);
            Question question = DBMapping(dbItem);

            return question;
        }
        #endregion

        #region Answer
        public static Answer InsertAnswer(int QuestionID, string AnswerContent, bool IsCorrect)
        {
            DBAnswer dbItem = DBProviderManager<DBGameProvider>.Provider.InsertAnswer(QuestionID, AnswerContent, IsCorrect);
            Answer answer = DBMapping(dbItem);

            return answer;
        }

        public static AnswerCollection GetAllAnswer()
        {
            DBAnswerCollection dbCollection = DBProviderManager<DBGameProvider>.Provider.GetAllAnswer();
            AnswerCollection collection = DBMapping(dbCollection);
            return collection;
        }

        public static void DeleteAnswer(int AnswerID)
        {
            DBProviderManager<DBGameProvider>.Provider.DeleteAnswer(AnswerID);
        }

        public static Answer UpdateAnswer(int AnswerID, int QuestionID, string AnswerContent, bool IsCorrect)
        {
            DBAnswer dbItem = DBProviderManager<DBGameProvider>.Provider.UpdateAnswer(AnswerID, QuestionID,
                                                                                      AnswerContent, IsCorrect);
            Answer answer = DBMapping(dbItem);

            return answer;
        }

        public static Answer GetAnswerByID(int AnswerID)
        {
            if (AnswerID == 0)
                return null;

            DBAnswer dbItem = DBProviderManager<DBGameProvider>.Provider.GetAnswerByID(AnswerID);
            Answer answer = DBMapping(dbItem);

            return answer;
        }
        #endregion

        #region CustomerResultDetail

        public static CustomerResultDetail InsertCustomerResultDetail(int CustomerResultID, int QuestionID, int AnswerID,
                                                                      bool IsCorrect)
        {
            DBCustomerResultDetail dbItem =
                DBProviderManager<DBGameProvider>.Provider.InsertCustomerResultDetail(CustomerResultID, QuestionID,
                                                                                      AnswerID, IsCorrect);
            CustomerResultDetail customerResultDetail = DBMapping(dbItem);

            return customerResultDetail;
        }

        public static CustomerResultDetailCollection GetAllCustomerResultDetail()
        {
            DBCustomerResultDetailCollection dbCollection = DBProviderManager<DBGameProvider>.Provider.GetAllCustomerResultDetail();
            CustomerResultDetailCollection collection = DBMapping(dbCollection);
            return collection;
        }

        public static void DeleteCustomerResultDetail(int ID)
        {
            DBProviderManager<DBGameProvider>.Provider.DeleteCustomerResultDetail(ID);
        }

        public static CustomerResultDetail UpdateCustomerResultDetail(int ID, int CustomerResultID, int QuestionID, int AnswerID, bool IsCorrect)
        {
            DBCustomerResultDetail dbItem = DBProviderManager<DBGameProvider>.Provider.UpdateCustomerResultDetail(ID,
                                                                                                                  CustomerResultID,
                                                                                                                  QuestionID,
                                                                                                                  AnswerID,
                                                                                                                  IsCorrect);
            CustomerResultDetail customerResultDetail = DBMapping(dbItem);

            return customerResultDetail;
        }

        public static CustomerResultDetail GetCustomerResultDetailByID(int ID)
        {
            if (ID == 0)
                return null;

            DBCustomerResultDetail dbItem = DBProviderManager<DBGameProvider>.Provider.GetCustomerResultDetailByID(ID);
            CustomerResultDetail customerResultDetail = DBMapping(dbItem);

            return customerResultDetail;
        }
        #endregion

        #region DBCustomerResult
        public static CustomerResult InsertCustomerResult(int CustomerID, DateTime CompleteDate, bool IsCorrectAll, bool IsWinner)
        {
            DBCustomerResult dbItem =
                DBProviderManager<DBGameProvider>.Provider.InsertCustomerResult(CustomerID, CompleteDate, IsCorrectAll, IsWinner);
            CustomerResult customerResult = DBMapping(dbItem);

            return customerResult;
        }

        public static CustomerResultCollection GetAllCustomerResult()
        {
            DBCustomerResultCollection dbCollection = DBProviderManager<DBGameProvider>.Provider.GetAllCustomerResult();
            CustomerResultCollection collection = DBMapping(dbCollection);
            return collection;
        }

        public static void DeleteCustomerResult(int CustomerResultID)
        {
            DBProviderManager<DBGameProvider>.Provider.DeleteCustomerResult(CustomerResultID);
        }

        public static CustomerResult UpdateCustomerResult(int CustomerResultID, int CustomerID, DateTime CompleteDate, bool IsCorrectAll, bool IsWinner)
        {
            DBCustomerResult dbItem = DBProviderManager<DBGameProvider>.Provider.UpdateCustomerResult(CustomerResultID,
                                                                                                      CustomerID,
                                                                                                      CompleteDate,
                                                                                                      IsCorrectAll,
                                                                                                      IsWinner);
            CustomerResult customerResult = DBMapping(dbItem);

            return customerResult;
        }

        public static CustomerResult GetCustomerResultByID(int CustomerResultID)
        {
            if (CustomerResultID == 0)
                return null;

            DBCustomerResult dbItem = DBProviderManager<DBGameProvider>.Provider.GetCustomerResultByID(CustomerResultID);
            CustomerResult customerResult = DBMapping(dbItem);

            return customerResult;
        }
        #endregion

        #region DBWinnerInMonth
        public static WinnerInMonth InsertWinnerInMonth(int CustomerResultID, int Month, int Year)
        {
            DBWinnerInMonth dbItem =
                DBProviderManager<DBGameProvider>.Provider.InsertWinnerInMonth(CustomerResultID, Month, Year);
            WinnerInMonth winnerInMonthn = DBMapping(dbItem);

            return winnerInMonthn;
        }

        public static WinnerInMonthCollection GetAllWinnerInMonth()
        {
            DBWinnerInMonthCollection dbCollection = DBProviderManager<DBGameProvider>.Provider.GetAllWinnerInMonth();
            WinnerInMonthCollection collection = DBMapping(dbCollection);
            return collection;
        }

        public static void DeleteWinnerInMonth(int ID)
        {
            DBProviderManager<DBGameProvider>.Provider.DeleteWinnerInMonth(ID);
        }

        public static WinnerInMonth UpdateWinnerInMonth(int ID, int CustomerResultID, int Month, int Year)
        {
            DBWinnerInMonth dbItem = DBProviderManager<DBGameProvider>.Provider.UpdateWinnerInMonth(ID, CustomerResultID,
                                                                                                    Month, Year);
            WinnerInMonth winnerInMonthn = DBMapping(dbItem);

            return winnerInMonthn;
        }

        public static WinnerInMonth GetWinnerInMonthByID(int ID)
        {
            if (ID == 0)
                return null;

            DBWinnerInMonth dbItem = DBProviderManager<DBGameProvider>.Provider.GetWinnerInMonthByID(ID);
            WinnerInMonth winnerInMonthn = DBMapping(dbItem);

            return winnerInMonthn;
        }
        #endregion

        #region DBQuestionInMonth
        public static QuestionInMonth InsertQuestionInMonth(int QuestionID, int Month, int Year)
        {
            DBQuestionInMonth dbItem =
                DBProviderManager<DBGameProvider>.Provider.InsertQuestionInMonth(QuestionID, Month, Year);
            QuestionInMonth questionInMonth = DBMapping(dbItem);

            return questionInMonth;
        }

        public static QuestionInMonthCollection GetAllQuestionInMonth()
        {
            DBQuestionInMonthCollection dbCollection = DBProviderManager<DBGameProvider>.Provider.GetAllQuestionInMonth();
            QuestionInMonthCollection collection = DBMapping(dbCollection);
            return collection;
        }

        public static void DeleteQuestionInMonth(int QuestionInMonthID)
        {
            DBProviderManager<DBGameProvider>.Provider.DeleteQuestionInMonth(QuestionInMonthID);
        }

        public static QuestionInMonth UpdateQuestionInMonth(int QuestionInMonthID, int QuestionID, int Month, int Year)
        {
            DBQuestionInMonth dbItem =
                DBProviderManager<DBGameProvider>.Provider.UpdateQuestionInMonth(QuestionInMonthID, QuestionID, Month,
                                                                                 Year);
            QuestionInMonth questionInMonth = DBMapping(dbItem);

            return questionInMonth;
        }

        public static QuestionInMonth GetQuestionInMonthByID(int QuestionInMonthID)
        {
            if (QuestionInMonthID == 0)
                return null;

            DBQuestionInMonth dbItem = DBProviderManager<DBGameProvider>.Provider.GetQuestionInMonthByID(QuestionInMonthID);
            QuestionInMonth questionInMonth = DBMapping(dbItem);

            return questionInMonth;
        }
        #endregion

        #endregion

        #region Custom Methods
        public static CustomerResultDetailCollection GetAllCustomerResultDetailByCustomerResultID(int CustomerResultID)
        {
            DBCustomerResultDetailCollection dbCollection = DBProviderManager<DBGameProvider>.Provider.GetAllCustomerResultDetailByCustomerResultID(CustomerResultID);
            CustomerResultDetailCollection collection = DBMapping(dbCollection);
            return collection;
        }

        public static AnswerCollection GetAllAnswerByQuestionID(int QuestionID)
        {
            DBAnswerCollection dbCollection = DBProviderManager<DBGameProvider>.Provider.GetAllAnswerByQuestionID(QuestionID);
            AnswerCollection collection = DBMapping(dbCollection);
            return collection;
        }

        public static QuestionCollection GetAllQuestionByMonth(int Month, int Year)
        {
            DBQuestionCollection dbCollection = DBProviderManager<DBGameProvider>.Provider.GetAllQuestionByMonth(Month, Year);
            QuestionCollection collection = DBMapping(dbCollection);
            return collection;
        }

        public static WinnerInMonthCollection GetWinnerByMonth(int Month)
        {
            DBWinnerInMonthCollection dbCollection = DBProviderManager<DBGameProvider>.Provider.GetWinnerByMonth(Month);
            WinnerInMonthCollection collection = DBMapping(dbCollection);
            return collection;
        }

        public static void DeleteQuestionInMonthByMonthYear(int Month, int Year)
        {
            DBProviderManager<DBGameProvider>.Provider.DeleteQuestionInMonthByMonthYear(Month, Year);
        }

        public static CustomerResultCollection GetCustomerResultByDate(int Month, int Year)
        {
            DBCustomerResultCollection dbCollection =
                DBProviderManager<DBGameProvider>.Provider.GetCustomerResultByDate(Month, Year);
            CustomerResultCollection collection = DBMapping(dbCollection);
            return collection;
        }

        public static DataTable GetDistinctCustomerResultByMonthYear()
        {
            return DBProviderManager<DBGameProvider>.Provider.GetDistinctCustomerResultByMonthYear();
        }
        #endregion


    }
}
