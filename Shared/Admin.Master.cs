using System;
using System.Web.UI;

namespace AgriYard.Shared
{
    /// <summary>
    /// Master page code-behind for the AgriYard administrative management console.
    /// Manages active menu styling for Dashboard, Manage Data, Users & Alerts, and Settings.
    /// </summary>
    public partial class Admin : MasterPage
    {
        public string ActiveAdminKey { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(ActiveAdminKey))
            {
                string path = Request.AppRelativeCurrentExecutionFilePath.ToLowerInvariant();
                if (path.Contains("dashboard.aspx"))
                {
                    ActiveAdminKey = "dashboard";
                }
                else if (path.Contains("managedata.aspx"))
                {
                    ActiveAdminKey = "managedata";
                }
                else if (path.Contains("usersalerts.aspx"))
                {
                    ActiveAdminKey = "usersalerts";
                }
                else if (path.Contains("settings.aspx"))
                {
                    ActiveAdminKey = "settings";
                }
                else
                {
                    ActiveAdminKey = "dashboard";
                }
            }
        }

        public string GetActiveAdminClass(string key)
        {
            return string.Equals(ActiveAdminKey, key, StringComparison.OrdinalIgnoreCase) ? "active" : string.Empty;
        }
    }
}
