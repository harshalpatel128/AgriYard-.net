using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgriYard.Data;

namespace AgriYard
{
    /// <summary>
    /// Code-behind for Marketing Yard Details (Pages 7 & 8 of Figma PDF).
    /// Binds address, contacts, total shops, and map navigation for Rajkot, Junagadh, etc.
    /// </summary>
    public partial class YardDetails : Page
    {
        // Controls declared in YardDetails.aspx
        protected Image imgYardHero;
        protected Literal litYardName;
        protected Literal litAddress;
        protected Literal litTotalShops;
        protected Literal litContact;
        protected Literal litEstablished;
        protected HyperLink lnkOpenMaps;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string yardId = Request.QueryString["id"] ?? "rajkot";
                LoadYardDetails(yardId);
            }
        }

        private void LoadYardDetails(string yardId)
        {
            var yard = SampleData.GetYardById(yardId);
            if (yard != null)
            {
                litYardName.Text = yard.YardName;
                litAddress.Text = yard.Address;
                litTotalShops.Text = yard.TotalShops;
                litContact.Text = yard.ContactNumber;
                litEstablished.Text = yard.EstablishedYear.ToString();
                imgYardHero.ImageUrl = yard.ImageUrl;
                imgYardHero.AlternateText = yard.YardName;
                lnkOpenMaps.NavigateUrl = yard.GoogleMapsUrl;
            }
        }
    }
}

