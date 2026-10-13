using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AgriYard.Profile
{
    /// <summary>
    /// Code-behind for user profile personal information editing.
    /// Demonstrates model validation without database persistence.
    /// </summary>
    public partial class PersonalInfo : Page
    {
        // Controls declared in PersonalInfo.aspx
        protected Panel pnlProfileUpdated;
        protected Literal litProfileUpdated;
        protected TextBox txtProfileName;
        protected TextBox txtProfilePhone;
        protected TextBox txtProfileEmail;
        protected DropDownList ddlDefaultYard;
        protected Button btnSaveProfile;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSaveProfile_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                pnlProfileUpdated.Visible = true;
                litProfileUpdated.Text = "✓ Demo: Personal information updated successfully (Static Demo Mode).";
            }
        }
    }
}
