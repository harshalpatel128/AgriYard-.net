using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgriYard.Data;

namespace AgriYard
{
    /// <summary>
    /// Code-behind for Crop Price Details (Page 11 of Figma PDF).
    /// Displays commodity summary, high/low/avg cards, and 7-day historical prices.
    /// </summary>
    public partial class CropDetails : Page
    {
        // Controls declared in CropDetails.aspx
        protected Literal litCropTitle;
        protected Literal litLastUpdated;
        protected Literal litArrival;
        protected Literal litTotalQty;
        protected Literal litMinPrice;
        protected Literal litAvgPrice;
        protected Literal litMaxPrice;
        protected HyperLink lnkViewChart;
        protected Repeater rptSevenDayHistory;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string cropId = Request.QueryString["crop"] ?? "wheat";
                LoadCropDetails(cropId);
            }
        }

        private void LoadCropDetails(string cropId)
        {
            var rate = SampleData.GetRateByCrop(cropId);
            if (rate != null)
            {
                litCropTitle.Text = rate.CropDisplayName;
                litLastUpdated.Text = rate.LastUpdatedText;
                litArrival.Text = rate.ArrivalDisplay;
                litTotalQty.Text = string.Format("{0:N0} Kg", rate.TotalQuantityKg);
                litMinPrice.Text = rate.MinPriceFormatted;
                litAvgPrice.Text = rate.AvgPriceFormatted;
                litMaxPrice.Text = rate.MaxPriceFormatted;

                lnkViewChart.NavigateUrl = "~/PriceHistory.aspx?crop=" + Server.UrlEncode(cropId);
            }

            // Bind 7-day history table
            rptSevenDayHistory.DataSource = SampleData.Get7DayHistory(cropId);
            rptSevenDayHistory.DataBind();
        }
    }
}

