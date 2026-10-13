using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgriYard.Data;
using AgriYard.Models;

namespace AgriYard
{
    /// <summary>
    /// Code-behind for Users & Broadcast Alerts (Page 19 of Figma PDF).
    /// Binds registered users table, supports user status toggling, and handles broadcast announcements.
    /// </summary>
    public partial class AdminUsersAlerts : Page
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
        protected Literal litAlertsCount;
        protected Repeater rptActiveAlerts;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindUsers();
                BindAlerts();
            }
        }

        private void BindUsers()
        {
            rptRegisteredUsers.DataSource = SampleData.GetAllUsers();
            rptRegisteredUsers.DataBind();
        }

        private void BindAlerts()
        {
            var alerts = SampleData.GetAllAlerts();
            litAlertsCount.Text = alerts.Count.ToString();
            rptActiveAlerts.DataSource = alerts;
            rptActiveAlerts.DataBind();
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
                litAlertNotice.Text = string.Format("&#10003; Demo: Broadcast alert '{0}' sent to <strong>{1}</strong> successfully! This announcement is now live on the public Home Dashboard.",
                    Server.HtmlEncode(title), Server.HtmlEncode(target));

                txtAlertTitle.Text = string.Empty;
                txtAlertMsg.Text = string.Empty;

                BindAlerts();
            }
        }

        protected void rptRegisteredUsers_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "ToggleStatus")
            {
                int userId = Convert.ToInt32(e.CommandArgument);
                SampleData.ToggleUserStatus(userId);
                pnlAlertNotice.Visible = true;
                litAlertNotice.Text = string.Format("&#10003; Demo: Status of user #{0} was toggled.", userId);
                BindUsers();
            }
        }

        protected void rptActiveAlerts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "DeleteAlert")
            {
                int alertId = Convert.ToInt32(e.CommandArgument);
                SampleData.DeleteAlert(alertId);
                pnlAlertNotice.Visible = true;
                litAlertNotice.Text = string.Format("&#10003; Demo: Broadcast alert #{0} deleted and removed from public dashboard.", alertId);
                BindAlerts();
            }
        }
    }
}

