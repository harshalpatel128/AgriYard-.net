using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AgriYard.Admin
{
    /// <summary>
    /// Code-behind for Admin Settings (Page 20 of Figma PDF).
    /// Handles helpline updating, password changes, and administrator logout.
    /// </summary>
    public partial class Settings : Page
    {
        // Controls declared in Settings.aspx
        protected Panel pnlSettingsNotice;
        protected Literal litSettingsNotice;
        protected LinkButton btnOpenPasswordModal;
        protected Panel pnlAdminPasswordForm;
        protected TextBox txtAdminNewPass;
        protected TextBox txtAdminConfirmPass;
        protected Button btnSaveAdminPass;
        protected Button btnCancelAdminPass;
        protected LinkButton btnOpenHelplineModal;
        protected Panel pnlHelplineForm;
        protected TextBox txtHelplinePhone;
        protected Button btnSaveHelpline;
        protected Button btnCancelHelpline;
        protected LinkButton btnLogoutAdmin;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnOpenPasswordModal_Click(object sender, EventArgs e)
        {
            pnlAdminPasswordForm.Visible = !pnlAdminPasswordForm.Visible;
            pnlHelplineForm.Visible = false;
        }

        protected void btnCancelAdminPass_Click(object sender, EventArgs e)
        {
            pnlAdminPasswordForm.Visible = false;
        }

        protected void btnSaveAdminPass_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                pnlAdminPasswordForm.Visible = false;
                pnlSettingsNotice.Visible = true;
                litSettingsNotice.Text = "✓ Demo: Administrator password updated successfully! (Demo Mode).";
                txtAdminNewPass.Text = string.Empty;
                txtAdminConfirmPass.Text = string.Empty;
            }
        }

        protected void btnOpenHelplineModal_Click(object sender, EventArgs e)
        {
            pnlHelplineForm.Visible = !pnlHelplineForm.Visible;
            pnlAdminPasswordForm.Visible = false;
        }

        protected void btnCancelHelpline_Click(object sender, EventArgs e)
        {
            pnlHelplineForm.Visible = false;
        }

        protected void btnSaveHelpline_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                pnlHelplineForm.Visible = false;
                pnlSettingsNotice.Visible = true;
                litSettingsNotice.Text = string.Format("✓ Demo: Helpline updated to {0} successfully! (Demo Mode).", Server.HtmlEncode(txtHelplinePhone.Text.Trim()));
            }
        }

        protected void btnLogoutAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Account/Login.aspx");
        }
    }
}
