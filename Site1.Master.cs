using System;
using System.Web.UI;

namespace AgriYard
{
    /// <summary>
    /// Master page code-behind for the public-facing AgriYard website.
    /// Handles active link detection to display the green or red underline bar.
    /// </summary>
    public partial class Site1 : MasterPage
    {
        // Property to allow individual pages to explicitly override the active section
        public string ActivePageKey { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(ActivePageKey))
            {
                DetermineActivePageFromUrl();
            }
        }

        /// <summary>
        /// Inspects the current request URL path to automatically set the active tab.
        /// </summary>
        private void DetermineActivePageFromUrl()
        {
            string path = Request.AppRelativeCurrentExecutionFilePath.ToLowerInvariant();

            if (path.Contains("default.aspx") || path.Contains("yard"))
            {
                ActivePageKey = "home";
            }
            else if (path.Contains("pricerise.aspx"))
            {
                ActivePageKey = "rise";
            }
            else if (path.Contains("pricefall.aspx"))
            {
                ActivePageKey = "fall";
            }
            else if (path.Contains("rates.aspx") || path.Contains("crop") || path.Contains("pricehistory") || path.Contains("filtersort"))
            {
                ActivePageKey = "rates";
            }
            else if (path.Contains("shop"))
            {
                ActivePageKey = "shops";
            }
            else if (path.Contains("profile") || path.Contains("changepassword") || path.Contains("personalinfo") || path.Contains("helpsupport"))
            {
                ActivePageKey = "profile";
            }
            else
            {
                ActivePageKey = "home";
            }
        }

        /// <summary>
        /// Returns CSS classes for desktop navigation item (e.g. "active", "active-fall").
        /// </summary>
        public string GetActiveNavClass(string key)
        {
            if (string.Equals(ActivePageKey, key, StringComparison.OrdinalIgnoreCase))
            {
                if (key.Equals("fall", StringComparison.OrdinalIgnoreCase))
                {
                    return "active active-fall";
                }
                return "active";
            }
            return string.Empty;
        }

        /// <summary>
        /// Returns CSS class for mobile menu item.
        /// </summary>
        public string GetActiveMobileClass(string key)
        {
            return string.Equals(ActivePageKey, key, StringComparison.OrdinalIgnoreCase) ? "active" : string.Empty;
        }
    }
}

