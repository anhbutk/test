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
using System.ComponentModel;
using System.Data;
using System.Data.Common;
using System.Globalization;
using System.Text;
using System.Web;
using NopSolutions.NopCommerce.BusinessLogic.Caching;
using NopSolutions.NopCommerce.BusinessLogic.Configuration.Settings;
using NopSolutions.NopCommerce.BusinessLogic.CustomerManagement;
using NopSolutions.NopCommerce.BusinessLogic.Messages;
using NopSolutions.NopCommerce.BusinessLogic.Profile;
using NopSolutions.NopCommerce.BusinessLogic.Utils.Html;
using NopSolutions.NopCommerce.Common;
using NopSolutions.NopCommerce.Common.Utils.Html;
using NopSolutions.NopCommerce.DataAccess;
using NopSolutions.NopCommerce.DataAccess.Content.FAQ;

namespace NopSolutions.NopCommerce.BusinessLogic.Content.FAQ
{
    /// <summary>
    /// Forum manager
    /// </summary>
    public partial class FAQManager
    {
        #region Constants
        private const string FORUMGROUP_ALL_KEY = "Nop.forumgroup.all";
        private const string FORUMGROUP_BY_ID_KEY = "Nop.forumgroup.id-{0}";
        private const string FORUM_ALLBYFORUMGROUPID_KEY = "Nop.forum.allbyforumgroupid-{0}";
        private const string FORUM_BY_ID_KEY = "Nop.forum.id-{0}";
        private const string FORUMGROUP_PATTERN_KEY = "Nop.forumgroup.";
        private const string FORUM_PATTERN_KEY = "Nop.forum.";
        #endregion

        #region Utilities
        private static FAQCollection DBMapping(DBFAQCollection dbCollection)
        {
            if (dbCollection == null)
                return null;

            FAQCollection collection = new FAQCollection();
            foreach (DBFAQ dbItem in dbCollection)
            {
                FAQ item = DBMapping(dbItem);
                collection.Add(item);
            }

            return collection;
        }

        private static FAQ DBMapping(DBFAQ dbItem)
        {
            if (dbItem == null)
                return null;

            FAQ item = new FAQ();
            item.FAQID = dbItem.FAQID;
            item.Question = dbItem.Question;
            item.Answer = dbItem.Answer;
            item.DisplayOrder = dbItem.DisplayOrder;
            item.OnOff = dbItem.OnOff;

            return item;
        }
        #endregion

        #region Methods

       
        public static void DeleteFAQ(int FAQID)
        {
            DBProviderManager<DBFAQProvider>.Provider.DeleteFAQ(FAQID);
        }
        
        public static FAQ GetFAQByID(int FAQID)
        {
            if (FAQID == 0)
                return null;
           
            DBFAQ dbItem = DBProviderManager<DBFAQProvider>.Provider.GetFAQByID(FAQID);
            FAQ faq = DBMapping(dbItem);
            
            return faq;
        }
        
        public static FAQCollection GetAllFAQ()
        {
            DBFAQCollection dbCollection = DBProviderManager<DBFAQProvider>.Provider.GetAllFAQ();
            FAQCollection faqCollection = DBMapping(dbCollection);

            return faqCollection;
        }

        public static FAQCollection GetPublishFAQ()
        {
            DBFAQCollection dbCollection = DBProviderManager<DBFAQProvider>.Provider.GetPublishFAQ();
            FAQCollection faqCollection = DBMapping(dbCollection);

            return faqCollection;
        }
        
        public static FAQ InsertFAQ(string Question, string Answer,
            int DisplayOrder, bool OnOff)
        {
            DBFAQ dbItem = DBProviderManager<DBFAQProvider>.Provider.InsertFAQ(Question, Answer,
            DisplayOrder, OnOff);

            FAQ faq = DBMapping(dbItem);

            return faq;
        }
        
        public static FAQ UpdateFAQ(int FAQID, string Question, string Answer,
            int DisplayOrder, bool OnOff)
        {
            DBFAQ dbItem = DBProviderManager<DBFAQProvider>.Provider.UpdateFAQ(FAQID,
                Question, Answer, DisplayOrder, OnOff);

            FAQ faq = DBMapping(dbItem);

            return faq;
        }
        
        #endregion

        
    }
}
