using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AgriYard.Support
{
    /// <summary>
    /// Code-behind for Help & Support (Page 21 of Figma PDF).
    /// Handles FAQ navigation and bug report submission.
    /// </summary>
    public partial class HelpSupport : Page
    {
        // Controls declared in HelpSupport.aspx
        protected Panel pnlHelpNotice;
        protected Literal litHelpNotice;
        protected LinkButton btnShowBugReport;
        protected Panel pnlBugForm;
        protected TextBox txtBugTitle;
        protected TextBox txtBugDesc;
        protected Button btnSubmitBug;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnShowBugReport_Click(object sender, EventArgs e)
        {
            pnlBugForm.Visible = !pnlBugForm.Visible;
        }

        protected void btnSubmitBug_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                pnlBugForm.Visible = false;
                pnlHelpNotice.Visible = true;
                litHelpNotice.Text = "✓ Demo: Thank you! Your bug report has been logged with ticket ID #AY-9042 (In-memory Demo Mode).";
                txtBugTitle.Text = string.Empty;
                txtBugDesc.Text = string.Empty;
            }
        }
    }
}
