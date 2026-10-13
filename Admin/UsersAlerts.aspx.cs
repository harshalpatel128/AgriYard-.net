using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgriYard.Data;
using AgriYard.Models;

namespace AgriYard.Admin
{
    /// <summary>
    /// Code-behind for Users & Broadcast Alerts (Page 19 of Figma PDF).
    /// Binds registered users table and handles broadcast notification submissions.
    /// </summary>
    public partial class UsersAlerts : Page
    {
        // Controls declared in UsersAlerts.aspx
        protected Panel pnlAlertNotice;
        protected Literal litAlertNotice;
        protected Button btnToggleBroadcastModal;
        protected Panel pnlBroadcastForm;
        protected TextBox txtAlertTitle;
        protected DropDownList ddlTargetAudience;
        protected TextBox txtAlertMsg;
        protected Button btnSendBroadcast;
        protected Button btnCancelBroadcast;
        protected Repeater rptRegisteredUsers;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindUsers();
            }
        }

        private void BindUsers()
        {
            rptRegisteredUsers.DataSource = SampleData.GetAllUsers();
            rptRegisteredUsers.DataBind();
        }

        protected void btnToggleBroadcastModal_Click(object sender, EventArgs e)
        {
            pnlBroadcastForm.Visible = !pnlBroadcastForm.Visible;
        }

        protected void btnCancelBroadcast_Click(object sender, EventArgs e)
        {
            pnlBroadcastForm.Visible = false;
        }

        protected void btnSendBroadcast_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string title = txtAlertTitle.Text.Trim();
                string target = ddlTargetAudience.SelectedItem.Text;
                string msg = txtAlertMsg.Text.Trim();

                AlertModel newAlert = new AlertModel(
                    0, title, msg, target, DateTime.Now.ToString("dd MMM yyyy"), "Active"
                );

                SampleData.AddAlert(newAlert);

                pnlBroadcastForm.Visible = false;
                pnlAlertNotice.Visible = true;
                litAlertNotice.Text = string.Format("✓ Demo: Broadcast alert '{0}' sent to <strong>{1}</strong> successfully! (In-memory mock broadcast; no push/SMS dispatched).",
                    Server.HtmlEncode(title), Server.HtmlEncode(target));

                txtAlertTitle.Text = string.Empty;
                txtAlertMsg.Text = string.Empty;
            }
        }
    }
}
