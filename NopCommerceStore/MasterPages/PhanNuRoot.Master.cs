using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NopSolutions.NopCommerce.BusinessLogic.SEO;

using System.Text;
using System.Text.RegularExpressions;

namespace NopSolutions.NopCommerce.Web.MasterPages
{
    public partial class PhanNuRoot : BaseNopMasterPage
    {
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
                        
            lnkNewsList.NavigateUrl = SEOHelper.GetNewsURL(19);
            lnkHomepage.NavigateUrl = Page.ResolveUrl("~/");
            lnkNewsListSkin.NavigateUrl = SEOHelper.GetNewsListURL(6);            
            lnkRecentlyAddedProducts.NavigateUrl = SEOHelper.GetCategoryURL(55);
            lnkFAQ.NavigateUrl = SEOHelper.GetFAQURL();
            lnkGame.NavigateUrl = SEOHelper.GetGameIntroductionURL();            
        }


        
    }
}
