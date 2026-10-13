using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AgriYard.Profile
{
    /// <summary>
    /// Code-behind for Change Password (Page 16 of Figma PDF).
    /// Implements custom password validation rules in OnServerValidate.
    /// </summary>
    public partial class ChangePassword : Page
    {
        // Controls declared in ChangePassword.aspx
        protected Panel pnlChangeSuccess;
        protected Literal litChangeSuccess;
        protected TextBox txtCurrentPassword;
        protected TextBox txtNewPassword;
        protected TextBox txtConfirmNewPassword;
        protected Button btnSaveChanges;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtCurrentPassword.Focus();
            }
        }

        /// <summary>
        /// CustomValidator event handler:
        /// Ensures the newly chosen password is not the same as the existing current password.
        /// </summary>
        protected void cvDifferentPassword_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string currentPassword = txtCurrentPassword.Text.Trim();
            string newPassword = txtNewPassword.Text.Trim();

            // Fail validation if new password matches old password
            if (!string.IsNullOrEmpty(currentPassword) && !string.IsNullOrEmpty(newPassword))
            {
                args.IsValid = !string.Equals(currentPassword, newPassword, StringComparison.Ordinal);
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void btnSaveChanges_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                pnlChangeSuccess.Visible = true;
                litChangeSuccess.Text = "✓ Demo: Password updated successfully! (In-memory demonstration mode; no permanent credentials changed).";

                // Clear fields
                txtCurrentPassword.Text = string.Empty;
                txtNewPassword.Text = string.Empty;
                txtConfirmNewPassword.Text = string.Empty;
            }
        }
    }
}
