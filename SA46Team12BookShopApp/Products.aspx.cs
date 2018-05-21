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
        

        protected string getOrderString()
        {
            string orderString = null;

            if (ddlPriceSort.SelectedIndex == 0)
            {
                orderString = "ASC";
            }
            else
            {
                orderString = "DESC";
            }

            return orderString;
        }

        protected void btnSearchBooks_Click(object sender, EventArgs e)
        {
            if (btnSearchBooks.Text.Trim().Length > 0)
            {
                string orderString = GetOrderString();

                SqlDataSource4.SelectCommand = "SELECT Book.Title, Book.Author, Book.Price, Category.Name, Book.ISBN FROM Book INNER JOIN Category ON Book.CategoryID = Category.CategoryID where Book.CategoryID = " + ddlCategoryFilter.SelectedValue.ToString() + " AND Book.Title like '" + txtSearchBooks.Text + "%' or Book.Author like '" + txtSearchBooks.Text + "%' ORDER BY Book.Price " + orderString;
                lvProductsList.DataSourceID = "SqlDataSource4";
                lvProductsList.DataBind();
            }
           
        }

        protected string GetOrderString()
        {
            string orderString = null;

            if (ddlPriceSort.SelectedIndex == 0)
            {
                orderString = "ASC";
            }
            else
            {
                orderString = "DESC";
            }

            return orderString;
        }

        protected void ddlFilters_SelectedIndexChanged(object sender, EventArgs e)
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

            txtSearchBooks.Text = "";
        }
    }
}