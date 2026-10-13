using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgriYard.Data;

namespace AgriYard
{
    /// <summary>
    /// Code-behind for Price Rise / Top Gainers Today (Page 12 of Figma PDF).
    /// Binds top commodities experiencing upward daily price momentum.
    /// </summary>
    public partial class PriceRise : Page
    {
        // Controls declared in PriceRise.aspx
        protected Repeater rptPriceRise;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                rptPriceRise.DataSource = SampleData.GetTopGainers();
                rptPriceRise.DataBind();
            }
        }
    }
}

