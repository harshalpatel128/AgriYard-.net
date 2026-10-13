using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgriYard.Data;

namespace AgriYard.Admin
{
    /// <summary>
    /// Code-behind for Admin Dashboard (Page 17 of Figma PDF).
    /// Implements CustomValidator logic enforcing Min Price <= Avg Price <= Max Price.
    /// </summary>
    public partial class Dashboard : Page
    {
        // Controls declared in Dashboard.aspx
        protected Panel pnlUpdateFeedback;
        protected Literal litUpdateFeedback;
        protected DropDownList ddlSelectYard;
        protected TextBox txtDateDisplay;
        protected Literal litCropSubhead;
        protected TextBox txtArrival;
        protected TextBox txtMinPrice;
        protected TextBox txtAvgPrice;
        protected TextBox txtMaxPrice;
        protected LinkButton btnSubmitPriceUpdate;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Preloaded with Wheat (Ghau) as shown in Figma screenshot
            }
        }

        /// <summary>
        /// CustomValidator server validation event:
        /// Ensures that Minimum Price is less than or equal to Average Price,
        /// and Average Price is less than or equal to Maximum Price.
        /// </summary>
        protected void cvPriceHierarchy_ServerValidate(object source, ServerValidateEventArgs args)
        {
            decimal minVal, avgVal, maxVal;

            bool isMinParsed = decimal.TryParse(txtMinPrice.Text.Trim(), out minVal);
            bool isAvgParsed = decimal.TryParse(txtAvgPrice.Text.Trim(), out avgVal);
            bool isMaxParsed = decimal.TryParse(txtMaxPrice.Text.Trim(), out maxVal);

            if (isMinParsed && isAvgParsed && isMaxParsed)
            {
                // Enforce price hierarchy
                args.IsValid = (minVal <= avgVal) && (avgVal <= maxVal);
            }
            else
            {
                // Let individual data type/range validators handle format errors
                args.IsValid = true;
            }
        }

        protected void btnSubmitPriceUpdate_Click(object sender, EventArgs e)
        {
            // Always verify Page.IsValid before updating state
            if (Page.IsValid)
            {
                int arrival = int.Parse(txtArrival.Text.Trim());
                decimal min = decimal.Parse(txtMinPrice.Text.Trim());
                decimal avg = decimal.Parse(txtAvgPrice.Text.Trim());
                decimal max = decimal.Parse(txtMaxPrice.Text.Trim());
                string yardId = ddlSelectYard.SelectedValue;

                // Update in-memory sample collection
                SampleData.UpdateMarketRate("wheat", yardId, arrival, min, avg, max);

                pnlUpdateFeedback.Visible = true;
                litUpdateFeedback.Text = string.Format("✓ Demo: Rates for Wheat (Ghau) at {0} updated successfully! (Arrival: {1} Bags, Min: ₹{2}, Avg: ₹{3}, Max: ₹{4}). No database write performed.",
                    ddlSelectYard.SelectedItem.Text, arrival, min, avg, max);
            }
        }
    }
}
