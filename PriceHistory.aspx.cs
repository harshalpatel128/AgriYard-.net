using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgriYard.Data;

namespace AgriYard
{
    /// <summary>
    /// Code-behind for Seven-Day Price Trend Chart (Page 10 of Figma PDF).
    /// Binds daily records to the table and initializes chart data.
    /// </summary>
    public partial class PriceHistory : Page
    {
        // Controls declared in PriceHistory.aspx
        protected Literal litTrendHeading;
        protected Repeater rptPriceHistoryTable;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string cropId = Request.QueryString["crop"] ?? "wheat";
                var rate = SampleData.GetRateByCrop(cropId);
                if (rate != null)
                {
                    litTrendHeading.Text = string.Format("{0} - Last 7 Days", rate.CropDisplayName);
                }

                rptPriceHistoryTable.DataSource = SampleData.Get7DayHistory(cropId);
                rptPriceHistoryTable.DataBind();
            }
        }
    }
}

