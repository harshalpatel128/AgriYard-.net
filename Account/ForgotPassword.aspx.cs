using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AgriYard.Account
{
    /// <summary>
    /// Handles the demonstration password reset process.
    /// In this mock implementation, no actual SMS or email is dispatched.
    /// </summary>
    public partial class ForgotPassword : Page
    {
        // Controls declared in ForgotPassword.aspx
        protected Panel pnlForgotNotice;
        protected Literal litForgotNotice;
        protected TextBox txtIdentifier;
        protected Button btnSendReset;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtIdentifier.Focus();
            }
        }

        protected void btnSendReset_Click(object sender, EventArgs e)
        {
            // Verify server-side validation status
            if (Page.IsValid)
            {
                string target = txtIdentifier.Text.Trim();
                pnlForgotNotice.Visible = true;
                litForgotNotice.Text = string.Format("✓ Demo: A secure reset link has been dispatched to <strong>{0}</strong>. (Static Demo Mode)", Server.HtmlEncode(target));
                txtIdentifier.Text = string.Empty;
            }
        }
    }
}
