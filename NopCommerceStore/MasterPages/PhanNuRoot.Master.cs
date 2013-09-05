using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NopSolutions.NopCommerce.BusinessLogic.SEO;

using System.Text;
using System.Text.RegularExpressions;
using NopSolutions.NopCommerce.BusinessLogic;
using NopSolutions.NopCommerce.Common.Utils;

namespace NopSolutions.NopCommerce.Web.MasterPages
{
    public partial class PhanNuRoot : BaseNopMasterPage
    {
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (NopContext.Current.User == null)
            {
                lnkLogin.Text = GetLocaleResourceString("Account.LoginSignup");
                lnkLogin.NavigateUrl = Page.ResolveUrl(CommonHelper.GetLoginPageURL(false, false));
            }
            else
            {
                lnkLogin.Text = GetLocaleResourceString("Account.MyAccount");
                lnkLogin.NavigateUrl = SEOHelper.GetAccountURL();
            }
        }



    }
}
