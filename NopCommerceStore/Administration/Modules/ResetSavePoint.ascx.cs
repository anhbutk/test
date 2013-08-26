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
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using NopSolutions.NopCommerce.BusinessLogic.Configuration.Settings;
using NopSolutions.NopCommerce.BusinessLogic.Content.Forums;
using NopSolutions.NopCommerce.Common.Utils;
using NopSolutions.NopCommerce.BusinessLogic;

namespace NopSolutions.NopCommerce.Web.Administration.Modules
{
    public partial class ResetSavePointControl : BaseNopAdministrationUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {                
                FillDropDownsTopic();
            }
        }

        private void FillDropDownsTopic()
        {
            int currYear = DateTime.Now.Year;
            int minYear = currYear - 5;            
            for (int i = currYear; i >= minYear; i--)
            {
                this.ddlYear.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }
            this.ddlYear.SelectedValue = SettingManager.GetSettingByName("Customer.SavePointYear").Value;
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            SettingManager.SetParam("Customer.SavePointYear", ddlYear.SelectedValue);
        }
    }
}