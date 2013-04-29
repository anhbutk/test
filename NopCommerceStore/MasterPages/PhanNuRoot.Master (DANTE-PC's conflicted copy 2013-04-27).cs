using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NopSolutions.NopCommerce.BusinessLogic.SEO;

namespace NopSolutions.NopCommerce.Web.MasterPages
{
    public partial class PhanNuRoot : BaseNopMasterPage
    {
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            //lnkNewsList.NavigateUrl = Page.ResolveUrl("~/NewsList.aspx");
            lnkNewsList.NavigateUrl = Page.ResolveUrl("~/NewsDetail.aspx?TopicID=19");
            lnkHomepage.NavigateUrl = Page.ResolveUrl("~/Default.aspx");
            lnkNewsListSkin.NavigateUrl = Page.ResolveUrl("~/NewsListSkin.aspx");
            lnkRecentlyAddedProducts.NavigateUrl = Page.ResolveUrl("~/RecentlyAddedProducts.aspx");
            lnkFAQ.NavigateUrl = Page.ResolveUrl("~/FAQ.aspx");
            lnkGame.NavigateUrl = Page.ResolveUrl("~/Game1Introduction.aspx");
        }
    }
}
