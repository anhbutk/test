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
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using NopSolutions.NopCommerce.BusinessLogic;
using NopSolutions.NopCommerce.BusinessLogic.Configuration.Settings;
using NopSolutions.NopCommerce.BusinessLogic.Content.Blog;
using NopSolutions.NopCommerce.BusinessLogic.Content.Topics;
using NopSolutions.NopCommerce.BusinessLogic.Game;
using NopSolutions.NopCommerce.Common.Utils;
using NopSolutions.NopCommerce.BusinessLogic.SEO;

namespace NopSolutions.NopCommerce.Web.Modules
{
    public partial class Game1IntroductionControl : BaseNopUserControl
    {
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            if (!Page.IsPostBack)
            {
                BindData();
                chkAccept.Text = GetLocaleResourceString("Game1Introduction.Accept");
                btnAccept.Text = GetLocaleResourceString("Game1Introduction.AcceptButton");
                lblAlert.Text = GetLocaleResourceString("Game1Introduction.Alert");
                Validate();
            }
        }

        private void BindData()
        {
            LocalizedTopic localizedTopic = TopicManager.GetLocalizedTopic(this.TopicName, NopContext.Current.WorkingLanguage.LanguageID);
            if (localizedTopic != null)
            {
                if (!string.IsNullOrEmpty(localizedTopic.Title))
                {
                    lTitle.Text = Server.HtmlEncode(localizedTopic.Title);
                }
                else
                {
                    lTitle.Visible = false;
                }
                if (!string.IsNullOrEmpty(localizedTopic.Body))
                {
                    lBody.Text = localizedTopic.Body;
                }
                else
                {
                    lBody.Visible = false;
                }
            }
            else
                this.Visible = false;
        }

        private bool Validate()
        {
            //play time must in 12am of first day in month and 12am of last day in month
            int lastday = DateTime.DaysInMonth(DateTime.Now.Year, DateTime.Now.Month);
            int currentday = DateTime.Today.Day;
            TimeSpan currenttime = DateTime.Now.TimeOfDay;
            var flagTime = new TimeSpan(0, 12, 0, 0);

            if (currentday != 1 || currentday != lastday)
            {
                if(NopContext.Current.User != null)
                    return MustNotPlayBefore();
                return true;
            }
            else
            {
                if (currentday == 1)
                    if (currenttime < flagTime)
                        return NotInTime();
                    else
                        return MustNotPlayBefore();

                if (currentday == lastday)
                    if (currenttime > flagTime)
                        return NotInTime();
                    else
                        return MustNotPlayBefore();
            }
            return true;
        }

        bool NotInTime()
        {
            lblAlert.Text = GetLocaleResourceString("Game1Introduction.Alert2");
            lblAlert.Visible = true;
            chkAccept.Enabled = false;
            btnAccept.Enabled = false;
            return false;
        }

        bool MustNotPlayBefore()
        {
            //user must not play this round before
            CustomerResultCollection customerResultCollection = GameManager.GetCustomerResultByDate(DateTime.Now.Month,
                                                                                                    DateTime.Now.Year);

            if (customerResultCollection.FindAll(IsExist).Count > 0)
            {
                lblAlert.Text = GetLocaleResourceString("Game1Introduction.Alert1");
                lblAlert.Visible = true;
                chkAccept.Enabled = false;
                btnAccept.Enabled = false;
                return false;
            }
            return true;
        }

        static bool IsExist(CustomerResult x)
        {
            return (x.CustomerID == NopContext.Current.User.CustomerID);
        }

        public string TopicName
        {
            get
            {
                object obj2 = this.ViewState["TopicName"];
                if (obj2 != null)
                    return (string)obj2;
                else
                    return string.Empty;
            }
            set
            {
                this.ViewState["TopicName"] = value;
            }
        }

        protected void btnAccept_Click(object sender, EventArgs e)
        {
            if (chkAccept.Checked)
                Response.Redirect(SEOHelper.GetGamePlayURL());
            else
            {
                lblAlert.Visible = true;
            }
        }
    }
}
