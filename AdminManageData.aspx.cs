using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgriYard.Data;
using AgriYard.Models;

namespace AgriYard
{
    /// <summary>
    /// Code-behind for Admin Manage Data (Page 18 of Figma PDF).
    /// Supports tab switching and in-memory Add, Edit, Delete operations for Yards, Crops, and Shops.
    /// </summary>
    public partial class AdminManageData : Page
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

        // Yards controls
        protected Button btnToggleAddYard;
        protected Panel pnlAddYardForm;
        protected TextBox txtYardName;
        protected TextBox txtLocation;
        protected TextBox txtTotalShopsInput;
        protected TextBox txtEstYear;
        protected HiddenField hfEditYardId;
        protected Button btnSaveNewYard;
        protected Button btnCancelNewYard;
        protected Repeater rptYardsList;

        // Crops controls
        protected Button btnToggleAddCrop;
        protected Panel pnlAddCropForm;
        protected TextBox txtNewCropName;
        protected TextBox txtNewCropGuj;
        protected DropDownList ddlNewCropCategory;
        protected Button btnSaveNewCrop;
        protected Button btnCancelNewCrop;
        protected Repeater rptCropsList;

        // Shops controls
        protected Button btnToggleAddShop;
        protected Panel pnlAddShopForm;
        protected TextBox txtNewShopName;
        protected TextBox txtNewShopPhone;
        protected DropDownList ddlNewShopYard;
        protected Button btnSaveNewShop;
        protected Button btnCancelNewShop;
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

        // --- YARDS ACTIONS ---
        protected void btnToggleAddYard_Click(object sender, EventArgs e)
        {
            hfEditYardId.Value = string.Empty;
            btnSaveNewYard.Text = "Save Yard";
            txtYardName.Text = string.Empty;
            txtLocation.Text = string.Empty;
            txtTotalShopsInput.Text = string.Empty;
            txtEstYear.Text = string.Empty;
            pnlAddYardForm.Visible = !pnlAddYardForm.Visible;
        }

        protected void btnCancelNewYard_Click(object sender, EventArgs e)
        {
            hfEditYardId.Value = string.Empty;
            btnSaveNewYard.Text = "Save Yard";
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

                if (!string.IsNullOrEmpty(hfEditYardId.Value))
                {
                    // Edit Existing Yard
                    string id = hfEditYardId.Value;
                    YardModel yard = new YardModel(
                        id, name, name.Split(' ')[0], loc, loc, "0281 2456789",
                        shops + "+ Shops", shops, year, "/Images/yard_rajkot.svg"
                    );

                    SampleData.UpdateYard(yard);
                    pnlManageNotice.Visible = true;
                    litManageNotice.Text = string.Format("&#10003; Demo: Marketing Yard '{0}' was successfully updated in-memory!", Server.HtmlEncode(name));
                    hfEditYardId.Value = string.Empty;
                    btnSaveNewYard.Text = "Save Yard";
                }
                else
                {
                    // Add New Yard
                    string id = name.ToLowerInvariant().Replace(" ", "_");
                    YardModel newYard = new YardModel(
                        id, name, name.Split(' ')[0], loc, loc, "0281 000000",
                        shops + "+ Shops", shops, year, "/Images/yard_rajkot.svg"
                    );

                    SampleData.AddYard(newYard);
                    pnlManageNotice.Visible = true;
                    litManageNotice.Text = string.Format("&#10003; Demo: Marketing Yard '{0}' was successfully added in-memory!", Server.HtmlEncode(name));
                }

                pnlAddYardForm.Visible = false;

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
                litManageNotice.Text = string.Format("&#10003; Demo: Marketing yard '{0}' deleted from in-memory sample list.", yardId);
                BindYards();
            }
            else if (e.CommandName == "EditYard")
            {
                var yard = SampleData.GetAllYards().FirstOrDefault(y => y.YardId.Equals(yardId, StringComparison.OrdinalIgnoreCase));
                if (yard != null)
                {
                    hfEditYardId.Value = yard.YardId;
                    txtYardName.Text = yard.YardName;
                    txtLocation.Text = yard.Location;
                    txtTotalShopsInput.Text = yard.TotalShopsNumeric.ToString();
                    txtEstYear.Text = yard.EstablishedYear.ToString();
                    btnSaveNewYard.Text = "Update Yard";
                    pnlAddYardForm.Visible = true;
                    pnlManageNotice.Visible = true;
                    litManageNotice.Text = string.Format("&#8505; Editing Yard '{0}'. Adjust details below and click Update Yard.", Server.HtmlEncode(yard.YardName));
                }
            }
        }

        // --- CROPS ACTIONS ---
        protected void btnToggleAddCrop_Click(object sender, EventArgs e)
        {
            pnlAddCropForm.Visible = !pnlAddCropForm.Visible;
        }

        protected void btnCancelNewCrop_Click(object sender, EventArgs e)
        {
            pnlAddCropForm.Visible = false;
        }

        protected void btnSaveNewCrop_Click(object sender, EventArgs e)
        {
            string name = txtNewCropName.Text.Trim();
            if (!string.IsNullOrEmpty(name))
            {
                string guj = txtNewCropGuj.Text.Trim();
                string cat = ddlNewCropCategory.SelectedValue;
                string id = name.ToLowerInvariant().Replace(" ", "_");

                CropModel newCrop = new CropModel(id, name, guj, cat, id);
                SampleData.AddCrop(newCrop);

                pnlAddCropForm.Visible = false;
                txtNewCropName.Text = string.Empty;
                txtNewCropGuj.Text = string.Empty;
                pnlManageNotice.Visible = true;
                litManageNotice.Text = string.Format("&#10003; Demo: Agricultural crop '{0}' was added in-memory and is now available across the site!", Server.HtmlEncode(name));

                BindCrops();
            }
        }

        protected void rptCropsList_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "ToggleCrop")
            {
                string cropId = e.CommandArgument.ToString();
                SampleData.ToggleCropStatus(cropId);
                pnlManageNotice.Visible = true;
                litManageNotice.Text = string.Format("&#10003; Demo: Status of crop '{0}' has been toggled.", cropId);
                BindCrops();
            }
        }

        // --- SHOPS ACTIONS ---
        protected void btnToggleAddShop_Click(object sender, EventArgs e)
        {
            pnlAddShopForm.Visible = !pnlAddShopForm.Visible;
        }

        protected void btnCancelNewShop_Click(object sender, EventArgs e)
        {
            pnlAddShopForm.Visible = false;
        }

        protected void btnSaveNewShop_Click(object sender, EventArgs e)
        {
            string shopName = txtNewShopName.Text.Trim();
            if (!string.IsNullOrEmpty(shopName))
            {
                string phone = txtNewShopPhone.Text.Trim();
                string yard = ddlNewShopYard.SelectedValue;

                ShopModel newShop = new ShopModel(0, shopName, phone, yard, "Active");
                SampleData.AddShop(newShop);

                pnlAddShopForm.Visible = false;
                txtNewShopName.Text = string.Empty;
                txtNewShopPhone.Text = string.Empty;
                pnlManageNotice.Visible = true;
                litManageNotice.Text = string.Format("&#10003; Demo: Commission shop '{0}' added to Trusted Shop Directory in-memory!", Server.HtmlEncode(shopName));

                BindShops();
            }
        }

        protected void rptAdminShopsList_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int shopId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "DeleteShop")
            {
                SampleData.DeleteShop(shopId);
                pnlManageNotice.Visible = true;
                litManageNotice.Text = string.Format("&#10003; Demo: Shop #{0} deleted from directory.", shopId);
                BindShops();
            }
            else if (e.CommandName == "ToggleShop")
            {
                SampleData.ToggleShopStatus(shopId);
                pnlManageNotice.Visible = true;
                litManageNotice.Text = string.Format("&#10003; Demo: Shop #{0} status toggled.", shopId);
                BindShops();
            }
        }
    }
}

