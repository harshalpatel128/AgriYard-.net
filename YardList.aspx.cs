using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgriYard.Data;

namespace AgriYard
{
    /// <summary>
    /// Code-behind for the Marketing Yards directory listing.
    /// Binds all four Saurashtra APMC yards from in-memory sample data.
    /// </summary>
    public partial class YardList : Page
    {
        // Controls declared in YardList.aspx
        protected Repeater rptAllYards;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                rptAllYards.DataSource = SampleData.GetAllYards();
                rptAllYards.DataBind();
            }
        }
    }
}

