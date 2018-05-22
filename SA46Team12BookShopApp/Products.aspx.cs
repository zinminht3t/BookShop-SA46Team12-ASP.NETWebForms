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
        private int itemClicked;
        private List<int> cartItems;


        protected void Page_Load(object sender, EventArgs e)
        {
                cartItems = new List<int>();
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
                else if (ddlCategoryFilter.SelectedValue == "sales")
                {
                    SqlDataSource6.SelectCommand = "SELECT Book.BookID,Book.Title, Book.Author, Book.Price, Category.Name, Book.ISBN,Discount.DiscountPercent FROM Book INNER JOIN Category ON Book.CategoryID = Category.CategoryID LEFT OUTER JOIN Discount ON Book.BookID=Discount.BookID where Discount.DiscountPercent IS NOT NULL AND (Book.Title like '%" + txtSearchBooks.Text + "%' OR Book.Author like '%" + txtSearchBooks.Text + "%') ORDER BY Book.Price " + orderString;
                    lvProductsList.DataSourceID = "SqlDataSource6";
                    lvProductsList.DataBind();
                }
                else //category filter selected is sales
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
            else if (ddlPriceSort.SelectedIndex == 0 && ddlCategoryFilter.SelectedValue == "sales")
            {
                lvProductsList.DataSourceID = "SqlDataSource8"; //Sort products on SALES, price by Asc
                lvProductsList.DataBind();
            }
            else if (ddlPriceSort.SelectedIndex == 1 && ddlCategoryFilter.SelectedValue == "sales")
            {
                lvProductsList.DataSourceID = "SqlDataSource7"; //Sort products on SALES, price by Desc
                lvProductsList.DataBind();
            }
            else if (ddlPriceSort.SelectedIndex == 0 && ddlCategoryFilter.SelectedValue != "0")
            {
                lvProductsList.DataSourceID = "SqlDataSource1"; //Sort products of specified CATEGORY, price by Ascending
                lvProductsList.DataBind();
            }
            else
            {
                lvProductsList.DataSourceID = "SqlDataSource3"; //Sort products of specified CATEGORY, price by Desc
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

            return String.Format("{0:0}% off", myValue);
        }

        public int getItemClicked()
        {
            return this.itemClicked;
        }

        protected void ProductsListView_OnItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (String.Equals(e.CommandName, "SelectedItem"))
            {
                ListViewDataItem dataItem = (ListViewDataItem)e.Item;
                Button buttonclicked = (Button)dataItem.FindControl("Button1");
                this.itemClicked = int.Parse(e.CommandArgument.ToString());
                Response.Write(cartItems.Count.ToString());
                if (buttonclicked.Text != "Remove from Cart")
                {
                    buttonclicked.Text = "Remove from Cart";
                    buttonclicked.CssClass = "btn btn-primary buttonClicked";
                    cartItems = (List<int>)Session["cart_items"];    // GET
                    cartItems.Add(this.itemClicked);
                    Master.ChangeCartItemQty(cartItems.Count.ToString());
                    Session["cart_items"] = cartItems;

                    if (cartItems == null)
                    {
                        cartItems = new List<int>();
                    }
                    
                }
                else
                {
                    buttonclicked.Text = "Add to Cart";
                    buttonclicked.CssClass = "btn btn-primary";

                    //remove bookid from session state
                    cartItems = (List<int>)Session["cart_items"];    // GET
                    cartItems.Remove(this.itemClicked);
                    Master.ChangeCartItemQty(cartItems.Count.ToString());
                    Response.Write(cartItems.Count.ToString());
                    Session["cart_items"] = cartItems;
                }
                //check if selected book is already in cart
               // MessageBox.Show(this, "Book has been added to cart.");
            }
        }

        public string ProcessProductDiscount(object discountPercentage, object originalPrice)
        {
            string discPerc = discountPercentage.ToString();
            Decimal.TryParse(discPerc, out decimal percentDisc);

            string oriPrice = originalPrice.ToString();
            Decimal.TryParse(oriPrice, out decimal priceOri);

            decimal disPrice = priceOri * (1 - (percentDisc / 100));

            if (discountPercentage == DBNull.Value)
            {
                return string.Format("Price: ${0:0.00}", oriPrice);
            }
            else
                return String.Format("Discounted Price: ${0:0.00}", disPrice);
        }

        protected void lvProductsList_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            ListViewDataItem dataItem = (ListViewDataItem)e.Item;
            Button btnAdd = (Button)dataItem.FindControl("Button1");

            int dataItemBookID = int.Parse(btnAdd.CommandArgument);
            cartItems = (List<int>)Session["cart_items"];    // GET
            cartItems = new List<int>();
            bool alreadyExist = cartItems.Contains(dataItemBookID);

            if (alreadyExist)
            {
                btnAdd.Text = "Remove from Cart";
                btnAdd.CssClass = "btn btn-primary buttonClicked";
            }
        }
    }

    public static class MessageBox
    {
        public static void Show(this Page Page, String Message)
        {
            Page.ClientScript.RegisterStartupScript(
               Page.GetType(),
               "MessageBox",
               "<script language='javascript'>alert('" + Message + "');</script>"
            );
        }
    }
}