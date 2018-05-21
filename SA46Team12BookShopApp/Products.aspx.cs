using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SA46Team12BookShopApp
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ddlPriceSort_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlPriceSort.SelectedIndex == 1)
            {
                lvProductsList.DataSourceID = "SqlDataSource3"; //Sort products price by Descending
                lvProductsList.DataBind();
            }
            else
            {
                lvProductsList.DataSourceID = "SqlDataSource1"; //Sort products price by Ascending
                lvProductsList.DataBind();
            }
        }
    }
}