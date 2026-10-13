using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AgriYard.Market
{
    /// <summary>
    /// Code-behind for Advanced Filter & Sort (Page 6 of Figma PDF).
    /// Gathers selected sorting criteria and yard filters to pass to Today's Market Rates.
    /// </summary>
    public partial class FilterSort : Page
    {
        // Controls declared in FilterSort.aspx
        protected RadioButton rbHighToLow;
        protected RadioButton rbLowToHigh;
        protected RadioButton rbLatestUpdated;
        protected CheckBox chkRajkot;
        protected CheckBox chkJunagadh;
        protected CheckBox chkGondal;
        protected CheckBox chkMendarda;
        protected Button btnClearAll;
        protected Button btnApplyFilters;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Initial load keeps default checked states as in Figma screenshot
        }

        protected void btnClearAll_Click(object sender, EventArgs e)
        {
            rbHighToLow.Checked = true;
            rbLowToHigh.Checked = false;
            rbLatestUpdated.Checked = false;

            chkRajkot.Checked = false;
            chkJunagadh.Checked = false;
            chkGondal.Checked = false;
            chkMendarda.Checked = false;
        }

        protected void btnApplyFilters_Click(object sender, EventArgs e)
        {
            string sort = "HighToLow";
            if (rbLowToHigh.Checked) sort = "LowToHigh";
            if (rbLatestUpdated.Checked) sort = "Latest";

            List<string> yards = new List<string>();
            if (chkRajkot.Checked) yards.Add("Rajkot");
            if (chkJunagadh.Checked) yards.Add("Junagadh");
            if (chkGondal.Checked) yards.Add("Gondal");
            if (chkMendarda.Checked) yards.Add("Mendarda");

            string yardQuery = string.Join(",", yards);
            Response.Redirect(string.Format("~/Market/Rates.aspx?sort={0}&yards={1}", sort, Server.UrlEncode(yardQuery)));
        }
    }
}
