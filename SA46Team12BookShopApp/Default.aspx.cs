using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SA46Team12BookShopApp
{
    public partial class Default : System.Web.UI.Page
    {
        private int itemClicked;
        private List<int> cartItems;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cartItems = new List<int>();
            }
        }

        //protected string getOrderString()
        //{
        //    string orderString = null;

        //    if (ddlPriceSort.SelectedIndex == 0)
        //    {
        //        orderString = "ASC";
        //    }
        //    else
        //    {
        //        orderString = "DESC";
        //    }

        //    return orderString;
        //}

        //protected string GetOrderString()
        //{
        //    string orderString = null;

        //    if (ddlPriceSort.SelectedIndex == 0)
        //    {
        //        orderString = "ASC";
        //    }
        //    else
        //    {
        //        orderString = "DESC";
        //    }

        //    return orderString;
        //}
       
        public string ProcessMyDataItem(object myValue)
        {
            if (myValue == DBNull.Value)
            {
                return null;
            }

            return String.Format("{0:0%}", myValue);
        }

        protected void ProductsListView_OnItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (String.Equals(e.CommandName, "SelectedItem"))
            {
                ListViewDataItem dataItem = (ListViewDataItem)e.Item;
                this.itemClicked = int.Parse(e.CommandArgument.ToString());

                cartItems = (List<int>)ViewState["cart_items"];    // GET
                cartItems.Add(this.itemClicked);
                ViewState["cart_items"] = cartItems;

                //check if selected book is already in cart
                MessageBox.Show(this, "Book has been added to cart.");
            }
        }

    }
}