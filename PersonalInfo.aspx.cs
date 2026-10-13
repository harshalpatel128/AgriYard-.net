using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgriYard.Data;

namespace AgriYard
{
    /// <summary>
    /// Code-behind for user profile personal information editing.
    /// Matches Image 2 layout with two-column responsive form.
    /// </summary>
    public partial class PersonalInfo : Page
    {
        // Controls declared in PersonalInfo.aspx
        protected Panel pnlProfileUpdated;
        protected Literal litProfileUpdated;
        protected Literal litCardFullName;
        protected TextBox txtFullName;
        protected TextBox txtMobileNumber;
        protected TextBox txtEmailAddress;
        protected TextBox txtUserCategory;
        protected TextBox txtCityLocation;
        protected Button btnSaveProfile;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var user = SampleData.CurrentUser;
                if (user != null)
                {
                    txtFullName.Text = user.FullName;
                    txtMobileNumber.Text = user.MobileNumber;
                    txtEmailAddress.Text = string.IsNullOrEmpty(user.Email) ? "hdobariya343@rku.ac.in" : user.Email;
                    litCardFullName.Text = user.FullName;
                }
                else
                {
                    txtFullName.Text = "Harshal Dobariya";
                    txtMobileNumber.Text = "+91 98765 43210";
                    txtEmailAddress.Text = "hdobariya343@rku.ac.in";
                    litCardFullName.Text = "Harshal Dobariya";
                }
                txtUserCategory.Text = "Farmer (ખેડૂત)";
                txtCityLocation.Text = "Junagadh, Gujarat";
            }
        }

        protected void btnSaveProfile_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string name = txtFullName.Text.Trim();
                string phone = txtMobileNumber.Text.Trim();
                string email = txtEmailAddress.Text.Trim();
                string location = txtCityLocation.Text.Trim();

                SampleData.UpdateCurrentUser(name, phone, email, location);
                litCardFullName.Text = name;

                pnlProfileUpdated.Visible = true;
                litProfileUpdated.Text = string.Format("&#10003; Profile updated successfully for <strong>{0}</strong>!", Server.HtmlEncode(name));
            }
        }
    }
}
