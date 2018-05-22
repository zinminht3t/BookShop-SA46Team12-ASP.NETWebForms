using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using SA46Team12BookShopApp.Models;

namespace SA46Team12BookShopApp
{
    public partial class Cart : System.Web.UI.Page
    {
        //int count;
        //double total = 0;
        //double discount = 0;
        List<Book> lstBooks;
        List<CartModel> lstCart;
        //List<OrderDetail> lstOD;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                //if (Session["cart_items"] == null)
                //{
                //    List<int> cartItems = (List<int>)Session["cart_items"];    //todo
                //    cartItems.Add(1);
                //    cartItems.Add(2);
                //    cartItems.Add(3);
                //    cartItems.Add(4);
                //    cartItems.Add(1);
                //    Session["cart_items"] = cartItems;
                //}
            }

            lstBooks = new List<Book>();

            List<int> carts = (List<int>)Session["cart_items"];


            if(carts == null)
            {
                Response.Redirect("Products.aspx");
            }
            foreach (int id in carts)
            {
                Book b = new Book();
                b = BusinessLogic.GetBookbyID(id);
                lstBooks.Add(b);
            }

            lstCart = new List<CartModel>();


            Dictionary<string, int> cartDis = new Dictionary<string, int>();
            foreach (Book b in lstBooks)
            {
                if (!cartDis.ContainsKey(b.ISBN))
                {
                    cartDis.Add(b.ISBN, 1);
                }
                else
                {
                    int count = 0;
                    cartDis.TryGetValue(b.ISBN, out count);
                    cartDis.Remove(b.ISBN);
                    cartDis.Add(b.ISBN, count + 1);
                }
            }
            foreach (KeyValuePair<string, int> entry in cartDis)
            {
                Book b = BusinessLogic.GetBookbyISBN(entry.Key);
                CartModel ca = new CartModel();
                ca.Title = b.Title;
                ca.Price = b.Price;
                ca.BookID = b.BookID;
                ca.Discount = (decimal)BusinessLogic.GetDiscountPrice(b.BookID);
                ca.Qty = entry.Value;
                ca.Amount = ca.Qty * ((decimal)ca.Price - (ca.Price * (ca.Discount / 100)));
                lstCart.Add(ca);
            }


            cartGridview.DataSource = lstCart;
            cartGridview.DataBind();

        }

        #region Checkout/Catalogue buttons
        protected void Checkout(object sender, EventArgs e)
        {
            Response.Redirect("Members/Checkout.aspx");
        }

        protected void Products(object sender, EventArgs e)
        {
            Response.Redirect("Products.aspx");
        }
        #endregion

        protected void MyButtonClick(object sender, System.EventArgs e)
        {
            //Get the button that raised the event
            LinkButton btn = (LinkButton)sender;

            //Get the row that contains this button
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            CartModel cm = new CartModel();
            cm = lstCart[gvr.RowIndex];

            List<int> ids = new List<int>();

            ids = (List<int>) Session["cart_items"];

            var index = ids.FindIndex(x => x == cm.BookID);
            if(index >= 0)
            {
                ids.RemoveAt(index);
            }


            Session["cart_items"] = ids;
            Response.Redirect("cart.aspx");

        }

        protected void MyButtonClick2(object sender, System.EventArgs e)
        {
            //Get the button that raised the event
            LinkButton btn = (LinkButton)sender;

            //Get the row that contains this button
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            CartModel cm = new CartModel();
            cm = lstCart[gvr.RowIndex];

            List<int> ids = new List<int>();

            ids = (List<int>)Session["cart_items"];

            var index = ids.FindIndex(x => x == cm.BookID);
            if (index >= 0)
            {
                ids.Insert(index, cm.BookID);
            }


            Session["cart_items"] = ids;
            Response.Redirect("cart.aspx");

        }

    }
}