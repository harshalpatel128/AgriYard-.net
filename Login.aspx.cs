using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AgriYard
{
    /// <summary>
    /// Handles demo user authentication for the AgriYard market intelligence platform.
    /// Performs server-side validation using Page.IsValid without any external database queries.
    /// </summary>
    public partial class Login : Page
    {
        // Controls declared in Login.aspx
        protected Panel pnlDemoMessage;
        protected Literal litDemoMessage;
        protected TextBox txtEmail;
        protected TextBox txtPassword;
        protected Button btnLogin;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtEmail.Focus();
            }
        }

        /// <summary>
        /// Handles the Login button submission event.
        /// Validates input controls server-side and performs mock in-memory session setup.
        /// </summary>
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // CRITICAL: Always check Page.IsValid before executing server logic
            if (Page.IsValid)
            {
                string email = txtEmail.Text.Trim();

                // Check for admin credential demo shortcut
                if (email.ToLowerInvariant().Contains("admin"))
                {
                    Response.Redirect("~/AdminDashboard.aspx");
                    return;
                }

                // Normal user mock login demo
                pnlDemoMessage.Visible = true;
                litDemoMessage.Text = string.Format("&#10003; Demo Login Successful for <strong>{0}</strong>! Redirecting to Dashboard...", email);

                // Redirect to Home Dashboard
                Response.Redirect("~/Default.aspx");
            }
        }
    }
}

