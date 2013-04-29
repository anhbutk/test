using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NopSolutions.NopCommerce.BusinessLogic;
using NopSolutions.NopCommerce.BusinessLogic.Configuration.Settings;
using NopSolutions.NopCommerce.BusinessLogic.Messages;
using NopSolutions.NopCommerce.BusinessLogic.Products;
using NopSolutions.NopCommerce.BusinessLogic.SEO;

namespace NopSolutions.NopCommerce.Web.Modules
{
    public partial class LeftInfo : BaseNopUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void OkButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string friendsEmail = txtFriendsEmail.Text.Trim();
                string yourName = txtYourName.Text.Trim();
                string friendName = txtFriendName.Text.Trim();
                string yourEmail = txtYourEmail.Text.Trim();
                string personalMessage = txtPersonalMessage.Text.Trim();
                personalMessage = ProductManager.FormatEmailAFriendText(personalMessage);

                MessageManager.SendEmailAFriendMessageAll(NopContext.Current.User,
                    NopContext.Current.WorkingLanguage.LanguageID,
                    friendsEmail, friendName, yourEmail, yourName, personalMessage, Page.Request.Url.OriginalString);

                txtFriendsEmail.Text = string.Empty;
                txtYourName.Text = string.Empty;
                txtFriendName.Text = string.Empty;
                txtYourEmail.Text = string.Empty;
                txtPersonalMessage.Text = string.Empty;
            }
        }
    }
}