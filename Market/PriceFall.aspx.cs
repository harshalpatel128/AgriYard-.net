using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgriYard.Data;

namespace AgriYard.Market
{
    /// <summary>
    /// Code-behind for Price Fall / Top Losers Today (Page 13 of Figma PDF).
    /// Binds commodities experiencing daily negative price movement.
    /// </summary>
    public partial class PriceFall : Page
    {
        // Controls declared in PriceFall.aspx
        protected Repeater rptPriceFall;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                rptPriceFall.DataSource = SampleData.GetTopLosers();
                rptPriceFall.DataBind();
            }
        }
    }
}
