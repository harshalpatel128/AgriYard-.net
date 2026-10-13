using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgriYard.Data;

namespace AgriYard.Market
{
    /// <summary>
    /// Code-behind for Crop Search Results (Page 5 of Figma PDF).
    /// Displays matching market rates for searched crop across marketing yards.
    /// </summary>
    public partial class CropSearch : Page
    {
        // Controls declared in CropSearch.aspx
        protected TextBox cropSearchInput;
        protected LinkButton btnClearSearch;
        protected Literal litSearchTerm;
        protected Literal litResultCount;
        protected Repeater rptSearchResults;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string query = Request.QueryString["q"];
                if (!string.IsNullOrEmpty(query))
                {
                    cropSearchInput.Text = query;
                }
                PerformSearch();
            }
        }

        private void PerformSearch()
        {
            string term = cropSearchInput.Text.Trim();
            if (string.IsNullOrEmpty(term))
            {
                term = "Garlic";
                cropSearchInput.Text = term;
            }

            litSearchTerm.Text = Server.HtmlEncode(term);

            var results = SampleData.SearchCrops(term);
            litResultCount.Text = string.Format("{0} Results Found", results.Count);

            rptSearchResults.DataSource = results;
            rptSearchResults.DataBind();
        }

        protected void cropSearchInput_TextChanged(object sender, EventArgs e)
        {
            PerformSearch();
        }

        protected void btnClearSearch_Click(object sender, EventArgs e)
        {
            cropSearchInput.Text = string.Empty;
            cropSearchInput.Focus();
            PerformSearch();
        }
    }
}
