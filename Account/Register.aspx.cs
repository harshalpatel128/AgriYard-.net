using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AgriYard.Account
{
    /// <summary>
    /// Handles user registration demonstration.
    /// Uses ASP.NET model validation controls and Page.IsValid without database persistence.
    /// </summary>
    public partial class Register : Page
    {
        // Controls declared in Register.aspx
        protected Panel pnlRegisterSuccess;
        protected Literal litRegisterSuccess;
        protected TextBox txtFullName;
        protected TextBox txtMobileNumber;
        protected TextBox txtEmail;
        protected TextBox txtPassword;
        protected TextBox txtConfirmPassword;
        protected Button btnCreateAccount;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtFullName.Focus();
            }
        }

        protected void btnCreateAccount_Click(object sender, EventArgs e)
        {
            // Verify all validators passed
            if (Page.IsValid)
            {
                string name = txtFullName.Text.Trim();
                string mobile = txtMobileNumber.Text.Trim();

                pnlRegisterSuccess.Visible = true;
                litRegisterSuccess.Text = string.Format("✓ Demo: Account created successfully for <strong>{0}</strong> (Mobile: {1})! No database save performed in demo mode.",
                    Server.HtmlEncode(name), Server.HtmlEncode(mobile));

                // Clear password fields for security
                txtPassword.Text = string.Empty;
                txtConfirmPassword.Text = string.Empty;
            }
        }
    }
}
