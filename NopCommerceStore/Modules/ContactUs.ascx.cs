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
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using NopSolutions.NopCommerce.BusinessLogic;
using NopSolutions.NopCommerce.BusinessLogic.Audit;
using NopSolutions.NopCommerce.BusinessLogic.Configuration.Settings;
using NopSolutions.NopCommerce.BusinessLogic.Messages;
using NopSolutions.NopCommerce.BusinessLogic.Utils.Html;
using NopSolutions.NopCommerce.Common.Utils;


namespace NopSolutions.NopCommerce.Web.Modules
{
    public partial class ContactUsControl : BaseNopUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                BindData();
        }

        protected void BindData()
        {
            //if (NopContext.Current.User != null && !NopContext.Current.User.IsGuest)
            //{
            //    txtFullName.Text = NopContext.Current.User.FullName;
            //    txtEmail.Text = NopContext.Current.User.Email;
            //}
        }

        protected void btnContactUs_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    if (String.IsNullOrEmpty(txtEnquiry.Text))
                        return;
                    string email = txtEmail.Text.Trim();
                    string fullName = txtFullName.Text.Trim();
                    string subject = string.Format("{0}. {1}", SettingManager.StoreName, txtSubject.Text.Trim());
                    string body = MessageManager.FormatContactUsFormText(txtEnquiry.Text);
                    string address = txtAddress.Text.Trim();
                    string tel = txtTel.Text.Trim();

                    MailAddress from = new MailAddress(email, fullName);

                    //required for some SMTP servers
                    if (SettingManager.GetSettingValueBoolean("Email.UseSystemEmailForContactUsForm"))
                    {
                        from = new MailAddress(MessageManager.AdminEmailAddress, MessageManager.AdminEmailDisplayName);
                        body = string.Format("<b>Thông tin liên hệ</b><br/><br/><b>Họ tên</b>: {0} <br /><br />" +
                        "<b>Email</b>: {1} <br /><br />" +
                        "<b>Địa chỉ</b>: {2} <br /><br />" +
                        "<b>Điện thoại</b>: {3} <br /><br />" +
                        "<b>Nội dung</b>: {4}"
                        , Server.HtmlEncode(fullName), Server.HtmlEncode(email), Server.HtmlEncode(address)
                        , Server.HtmlEncode(tel), body);
                    }
                    MailAddress to = new MailAddress(MessageManager.AdminEmailAddress, MessageManager.AdminEmailDisplayName);
                    MessageManager.InsertQueuedEmail(5, from, to, string.Empty, string.Empty, subject, body, DateTime.Now, 0, null);

                    pnlResult.Visible = true;
                    pnlContactUs.Visible = false;
                }
                catch (Exception exc)
                {
                    LogManager.InsertLog(LogTypeEnum.MailError, string.Format("Error sending \"Contact us\" email."), exc);
                }
            }
        }
    }
}