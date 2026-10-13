using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgriYard.Data;

namespace AgriYard.Market
{
    /// <summary>
    /// Code-behind for Today's Market Rates table (Page 9 of Figma PDF).
    /// Binds daily rates and responds to sorting and yard filter parameters.
    /// </summary>
    public partial class Rates : Page
    {
        // Controls declared in Rates.aspx
        protected Panel pnlFilterNotice;
        protected Literal litFilterNotice;
        protected Repeater rptMarketRates;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindMarketRates();
            }
        }

        private void BindMarketRates()
        {
            string sortParam = Request.QueryString["sort"];
            string yardsParam = Request.QueryString["yards"];

            var rates = SampleData.GetDailyMarketRates();

            if (!string.IsNullOrEmpty(yardsParam) || !string.IsNullOrEmpty(sortParam))
            {
                pnlFilterNotice.Visible = true;
                List<string> selectedYards = new List<string>();
                if (!string.IsNullOrEmpty(yardsParam))
                {
                    selectedYards = yardsParam.Split(new[] { ',' }, StringSplitOptions.RemoveEmptyEntries).ToList();
                }

                rates = SampleData.FilterAndSort(sortParam, selectedYards);
                litFilterNotice.Text = string.Format("Showing filtered market data (Sorted: {0}, Yards: {1}).",
                    sortParam ?? "Default", string.IsNullOrEmpty(yardsParam) ? "All" : yardsParam);
            }

            rptMarketRates.DataSource = rates;
            rptMarketRates.DataBind();
        }
    }
}
