using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AgriYard.Profile
{
    /// <summary>
    /// Code-behind for User Profile (Page 15 of Figma PDF).
    /// Displays authenticated user profile summary and navigation links.
    /// </summary>
    public partial class Profile : Page
    {
        // Controls declared in Profile.aspx
        protected LinkButton btnLogout;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Profile data is initialized to Harshal Dobariya as shown in PDF
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Demo logout redirect
            Response.Redirect("~/Account/Login.aspx");
        }
    }
}
