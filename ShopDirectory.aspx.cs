using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgriYard.Data;

namespace AgriYard
{
    /// <summary>
    /// Code-behind for Trusted Shop Directory (Page 14 of Figma PDF).
    /// Binds certified APMC yard merchants and provides search filtering.
    /// </summary>
    public partial class ShopDirectory : Page
    {
        // Controls declared in ShopDirectory.aspx
        protected TextBox txtShopSearch;
        protected Repeater rptShops;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindShops();
            }
        }

        private void BindShops()
        {
            string query = txtShopSearch.Text.Trim();
            rptShops.DataSource = SampleData.GetAllShops(query);
            rptShops.DataBind();
        }

        protected void txtShopSearch_TextChanged(object sender, EventArgs e)
        {
            BindShops();
        }
    }
}

