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
            cartItems = new List<int>();
            
        }        

        public string ProcessMyDiscountedDataItem(object discountPercentage, object originalPrice)
        {       
            string discPerc = discountPercentage.ToString();        
            Decimal.TryParse(discPerc, out decimal percentDisc);

            string oriPrice = originalPrice.ToString();
            Decimal.TryParse(oriPrice, out decimal priceOri);

            decimal disPrice = priceOri * (1 - (percentDisc / 100));

            if (discountPercentage == DBNull.Value)
            {
                return null;
            }

            return String.Format("{0:0.00}", disPrice);
        }

        public string ProcessMyDataItem(object myValue)
        {

            if (myValue == DBNull.Value)
            {
                return null;
            }

            return String.Format("{0:0}"+"%", myValue);
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
                this.itemClicked = int.Parse(e.CommandArgument.ToString());

                cartItems = (List<int>)Session["cart_items"];    // GET
                cartItems.Add(this.itemClicked);
                Master.ChangeCartItemQty(cartItems.Count.ToString());

                Session["cart_items"] = cartItems;

                //check if selected book is already in cart
                MessageBox1.Show(this, "Book has been added to cart.");
            }
        }

        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
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

                    if (cartItems == null)
                    {
                        cartItems = new List<int>();
                    }

                    cartItems.Add(this.itemClicked);
                    Master.ChangeCartItemQty(cartItems.Count.ToString());
                    Session["cart_items"] = cartItems;


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

        protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            ListViewDataItem dataItem = (ListViewDataItem)e.Item;
            Button btnAdd = (Button)dataItem.FindControl("Button1");

            int dataItemBookID = int.Parse(btnAdd.CommandArgument);
            cartItems = (List<int>)Session["cart_items"];    // GET

            if (cartItems == null)
            {
                cartItems = new List<int>();
            }
            //cartItems = new List<int>();
            bool alreadyExist = cartItems.Contains(dataItemBookID);

            if (alreadyExist)
            {
                btnAdd.Text = "Remove from Cart";
                btnAdd.CssClass = "btn btn-primary buttonClicked";
            }
        }
    }

    public static class MessageBox1
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