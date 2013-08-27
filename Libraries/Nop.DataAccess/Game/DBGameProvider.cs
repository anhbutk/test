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


namespace NopSolutions.NopCommerce.DataAccess.Game
{

    [DBProviderSectionName("nopDataProviders/GameProvider")]
    public abstract partial class DBGameProvider : BaseDBProvider
    {
        #region Methods

        #region Question

        public abstract DBQuestion InsertQuestion(string QuestionContent, bool OnOff);

        public abstract DBQuestionCollection GetAllQuestions();

        public abstract void DeleteQuestion(int QuestionID);

        public abstract DBQuestion UpdateQuestion(int QuestionID, string QuestionContent, bool OnOff);

        public abstract DBQuestion GetQuestionByID(int QuestionID);
        #endregion

        #region Answer
        public abstract DBAnswer InsertAnswer(int QuestionID, string AnswerContent, bool IsCorrect);

        public abstract DBAnswerCollection GetAllAnswer();

        public abstract void DeleteAnswer(int AnswerID);

        public abstract DBAnswer UpdateAnswer(int AnswerID, int QuestionID, string AnswerContent, bool IsCorrect);

        public abstract DBAnswer GetAnswerByID(int AnswerID);
        #endregion

        #region CustomerResultDetail
        public abstract DBCustomerResultDetail InsertCustomerResultDetail(int CustomerResultID, int QuestionID, int AnswerID, bool IsCorrect);

        public abstract DBCustomerResultDetailCollection GetAllCustomerResultDetail();

        public abstract void DeleteCustomerResultDetail(int ID);

        public abstract DBCustomerResultDetail UpdateCustomerResultDetail(int ID, int CustomerResultID, int QuestionID, int AnswerID, bool IsCorrect);

        public abstract DBCustomerResultDetail GetCustomerResultDetailByID(int ID);
        #endregion

        #region DBCustomerResult
        public abstract DBCustomerResult InsertCustomerResult(int CustomerID, DateTime CompleteDate, bool IsCorrectAll, bool IsWinner);

        public abstract DBCustomerResultCollection GetAllCustomerResult();

        public abstract void DeleteCustomerResult(int CustomerResultID);

        public abstract DBCustomerResult UpdateCustomerResult(int CustomerResultID, int CustomerID, DateTime CompleteDate, bool IsCorrectAll, bool IsWinner);

        public abstract DBCustomerResult GetCustomerResultByID(int CustomerResultID);
        #endregion

        #region DBWinnerInMonth
        public abstract DBWinnerInMonth InsertWinnerInMonth(int CustomerResultID, int Month, int Year);

        public abstract DBWinnerInMonthCollection GetAllWinnerInMonth();

        public abstract void DeleteWinnerInMonth(int ID);

        public abstract DBWinnerInMonth UpdateWinnerInMonth(int ID, int CustomerResultID, int Month, int Year);

        public abstract DBWinnerInMonth GetWinnerInMonthByID(int ID);
        #endregion

        #region DBQuestionInMonth
        public abstract DBQuestionInMonth InsertQuestionInMonth(int QuestionID, int Month, int Year);

        public abstract DBQuestionInMonthCollection GetAllQuestionInMonth();

        public abstract void DeleteQuestionInMonth(int QuestionInMonthID);

        public abstract DBQuestionInMonth UpdateQuestionInMonth(int QuestionInMonthID, int QuestionID, int Month, int Year);

        public abstract DBQuestionInMonth GetQuestionInMonthByID(int QuestionInMonthID);
        #endregion

        #endregion

        #region Custom Methods
        public abstract DBCustomerResultDetailCollection GetAllCustomerResultDetailByCustomerResultID(int CustomerResultID);

        public abstract DBAnswerCollection GetAllAnswerByQuestionID(int QuestionID);

        public abstract DBQuestionCollection GetAllQuestionByMonth(int Month, int Year);

        public abstract DBWinnerInMonthCollection GetWinnerByMonth(int Month);

        public abstract DBCustomerResultCollection GetCustomerResultByDate(int Month, int Year);

        public abstract void DeleteQuestionInMonthByMonthYear(int Month, int Year);

        public abstract DataTable GetDistinctCustomerResultByMonthYear();

        public abstract DataTable GetDistinctCustomerResultByYear();
        #endregion
    }
}

