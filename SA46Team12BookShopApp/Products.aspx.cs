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
        public string itemClicked;

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

                if (ddlCategoryFilter.SelectedValue == "0")
                {

                    SqlDataSource6.SelectCommand = "SELECT Book.BookID,Book.Title, Book.Author, Book.Price, Category.Name, Book.ISBN,Discount.DiscountPercent FROM Book INNER JOIN Category ON Book.CategoryID = Category.CategoryID LEFT OUTER JOIN Discount ON Book.BookID=Discount.BookID where Book.Title like '%" + txtSearchBooks.Text + "%' or Book.Author like '%" + txtSearchBooks.Text + "%' ORDER BY Book.Price " + orderString;
                    lvProductsList.DataSourceID = "SqlDataSource6";
                    lvProductsList.DataBind();
                }
                else
                {

                    SqlDataSource6.SelectCommand = "SELECT Book.BookID,Book.Title, Book.Author, Book.Price, Category.Name, Book.ISBN,Discount.DiscountPercent FROM Book INNER JOIN Category ON Book.CategoryID = Category.CategoryID LEFT OUTER JOIN Discount ON Book.BookID=Discount.BookID where Book.CategoryID = " + ddlCategoryFilter.SelectedValue.ToString() + " AND Book.Title like '%" + txtSearchBooks.Text + "%' or Book.Author like '%" + txtSearchBooks.Text + "%' ORDER BY Book.Price " + orderString;
                    lvProductsList.DataSourceID = "SqlDataSource6";
                    lvProductsList.DataBind();
                }

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
            if (ddlPriceSort.SelectedIndex == 0 && ddlCategoryFilter.SelectedValue=="0")
            {
                lvProductsList.DataSourceID = "SqlDataSource5"; //Sort ALL products price by Ascending
                lvProductsList.DataBind();
            }
            else if (ddlPriceSort.SelectedIndex == 1 && ddlCategoryFilter.SelectedValue == "0")
            {
                lvProductsList.DataSourceID = "SqlDataSource4"; //Sort ALL products price by Descending
                lvProductsList.DataBind();
            }
            else if (ddlPriceSort.SelectedIndex == 0 && ddlCategoryFilter.SelectedValue != "0")
            {
                lvProductsList.DataSourceID = "SqlDataSource1"; //Sort products of specified CATEGORY, price by Ascending
                lvProductsList.DataBind();
            }
            else
            {
                lvProductsList.DataSourceID = "SqlDataSource3"; //Sort products of specified CATEGORY, price by Ascending
                lvProductsList.DataBind();
            }


                txtSearchBooks.Text = "";
        }

        public string ProcessMyDataItem(object myValue)
        {
            if (myValue == DBNull.Value)
            {
                return null;
            }

            return String.Format("{0:0%}", myValue);
        }

        public String getItemClicked()
        {
            return this.itemClicked;
        }

        protected void ProductsListView_OnItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (String.Equals(e.CommandName, "SelectedItem"))
            {
                ListViewDataItem dataItem = (ListViewDataItem)e.Item;
                this.itemClicked = e.CommandArgument.ToString();

                Server.Transfer("Cart.aspx");
            }
        }

    }
}