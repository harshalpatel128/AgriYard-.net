using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgriYard.Data;
using AgriYard.Models;

namespace AgriYard.Admin
{
    /// <summary>
    /// Code-behind for Admin Manage Data (Page 18 of Figma PDF).
    /// Supports tab switching and in-memory Add, Edit, Delete operations.
    /// </summary>
    public partial class ManageData : Page
    {
        // Controls declared in ManageData.aspx
        protected Literal litActiveYardsCount;
        protected Panel pnlManageNotice;
        protected Literal litManageNotice;
        protected LinkButton tabYards;
        protected LinkButton tabCrops;
        protected LinkButton tabShops;
        protected Panel pnlYardsTab;
        protected Panel pnlCropsTab;
        protected Panel pnlShopsTab;
        protected Button btnToggleAddYard;
        protected Panel pnlAddYardForm;
        protected TextBox txtYardName;
        protected TextBox txtLocation;
        protected TextBox txtTotalShopsInput;
        protected TextBox txtEstYear;
        protected Button btnSaveNewYard;
        protected Button btnCancelNewYard;
        protected Repeater rptYardsList;
        protected Repeater rptCropsList;
        protected Repeater rptAdminShopsList;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindYards();
            }
        }

        private void BindYards()
        {
            var yards = SampleData.GetAllYards();
            litActiveYardsCount.Text = (20 + yards.Count).ToString();
            rptYardsList.DataSource = yards;
            rptYardsList.DataBind();
        }

        private void BindCrops()
        {
            rptCropsList.DataSource = SampleData.GetAllCrops();
            rptCropsList.DataBind();
        }

        private void BindShops()
        {
            rptAdminShopsList.DataSource = SampleData.GetAllShops();
            rptAdminShopsList.DataBind();
        }

        // Tab Switching Handlers
        protected void tabYards_Click(object sender, EventArgs e)
        {
            pnlYardsTab.Visible = true;
            pnlCropsTab.Visible = false;
            pnlShopsTab.Visible = false;
            tabYards.CssClass = "admin-tab-link active";
            tabCrops.CssClass = "admin-tab-link";
            tabShops.CssClass = "admin-tab-link";
            BindYards();
        }

        protected void tabCrops_Click(object sender, EventArgs e)
        {
            pnlYardsTab.Visible = false;
            pnlCropsTab.Visible = true;
            pnlShopsTab.Visible = false;
            tabYards.CssClass = "admin-tab-link";
            tabCrops.CssClass = "admin-tab-link active";
            tabShops.CssClass = "admin-tab-link";
            BindCrops();
        }

        protected void tabShops_Click(object sender, EventArgs e)
        {
            pnlYardsTab.Visible = false;
            pnlCropsTab.Visible = false;
            pnlShopsTab.Visible = true;
            tabYards.CssClass = "admin-tab-link";
            tabCrops.CssClass = "admin-tab-link";
            tabShops.CssClass = "admin-tab-link active";
            BindShops();
        }

        protected void btnToggleAddYard_Click(object sender, EventArgs e)
        {
            pnlAddYardForm.Visible = !pnlAddYardForm.Visible;
        }

        protected void btnCancelNewYard_Click(object sender, EventArgs e)
        {
            pnlAddYardForm.Visible = false;
        }

        protected void btnSaveNewYard_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string name = txtYardName.Text.Trim();
                string loc = txtLocation.Text.Trim();
                int shops = int.Parse(txtTotalShopsInput.Text.Trim());
                int year = int.Parse(txtEstYear.Text.Trim());
                string id = name.ToLowerInvariant().Replace(" ", "_");

                YardModel newYard = new YardModel(
                    id, name, name.Split(' ')[0], loc, loc, "0281 000000",
                    shops + "+ Shops", shops, year, "/Images/yard_rajkot.svg"
                );

                SampleData.AddYard(newYard);

                pnlAddYardForm.Visible = false;
                pnlManageNotice.Visible = true;
                litManageNotice.Text = string.Format("✓ Demo: Marketing Yard '{0}' was successfully added in-memory! (No database persistence)", Server.HtmlEncode(name));

                // Clear fields
                txtYardName.Text = string.Empty;
                txtLocation.Text = string.Empty;
                txtTotalShopsInput.Text = string.Empty;
                txtEstYear.Text = string.Empty;

                BindYards();
            }
        }

        protected void rptYardsList_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string yardId = e.CommandArgument.ToString();

            if (e.CommandName == "DeleteYard")
            {
                SampleData.DeleteYard(yardId);
                pnlManageNotice.Visible = true;
                litManageNotice.Text = string.Format("✓ Demo: Marketing yard '{0}' deleted from in-memory sample list.", yardId);
                BindYards();
            }
            else if (e.CommandName == "EditYard")
            {
                pnlManageNotice.Visible = true;
                litManageNotice.Text = string.Format("ℹ Demo: Edit modal for '{0}' opened (In-memory demonstration mode).", yardId);
            }
        }
    }
}
