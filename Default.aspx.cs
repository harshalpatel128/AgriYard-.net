using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgriYard.Data;

namespace AgriYard
{
    /// <summary>
    /// Code-behind for the AgriYard Home Dashboard (Page 4 of Figma PDF).
    /// Binds marketing yards, top gainers, and top losers from in-memory sample data.
    /// </summary>
    public partial class Default : Page
    {
        // Controls declared in Default.aspx
        protected TextBox txtDashboardSearch;
        protected Repeater rptMarketingYards;
        protected Repeater rptTopGainers;
        protected Repeater rptTopLosers;
        protected Panel pnlBroadcastBanner;
        protected Literal litBannerTitle;
        protected Literal litBannerBody;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDashboardData();
            }
        }

        /// <summary>
        /// Binds in-memory marketing yards and top price gainers/losers to repeaters.
        /// </summary>
        private void BindDashboardData()
        {
            // 0. Active Broadcast Banner
            var latestAlert = SampleData.GetLatestAlert();
            if (latestAlert != null)
            {
                pnlBroadcastBanner.Visible = true;
                litBannerTitle.Text = Server.HtmlEncode(latestAlert.Title) + " &bull; " + Server.HtmlEncode(latestAlert.DatePosted);
                litBannerBody.Text = Server.HtmlEncode(latestAlert.Message);
            }
            else
            {
                pnlBroadcastBanner.Visible = false;
            }

            // 1. Marketing Yards (Rajkot, Junagadh, Gondal, Mendarda)
            rptMarketingYards.DataSource = SampleData.GetAllYards();
            rptMarketingYards.DataBind();

            // 2. Price Rise (Top 2 shown on Dashboard: Cotton, Soyabean)
            rptTopGainers.DataSource = SampleData.GetTopGainers().Take(2).ToList();
            rptTopGainers.DataBind();

            // 3. Price Fall (Top 2 shown on Dashboard: Chana, Tuver)
            rptTopLosers.DataSource = SampleData.GetTopLosers().Take(2).ToList();
            rptTopLosers.DataBind();
        }

        /// <summary>
        /// Redirects user to the Crop Search Results page upon typing or submitting search query.
        /// </summary>
        protected void txtDashboardSearch_TextChanged(object sender, EventArgs e)
        {
            string query = txtDashboardSearch.Text.Trim();
            if (!string.IsNullOrEmpty(query))
            {
                Response.Redirect("~/CropSearch.aspx?q=" + Server.UrlEncode(query));
            }
        }
    }
}

