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
            lstBooks = new List<Book>();

            List<int> carts = (List<int>)Session["cart_items"];

            if (carts == null)
            {
                carts = new List<int>();
            }

            if (carts.Count < 1)
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
                ca.Discount = Math.Round(ca.Discount * entry.Value, 2);
                ca.Qty = entry.Value;
                ca.Amount = (ca.Qty * ca.Price) - ca.Discount;
                ca.Amount = Math.Round(ca.Amount, 2);
                lstCart.Add(ca);
            }


            cartGridview.DataSource = lstCart;
            cartGridview.DataBind();

        }

        #region Checkout/Catalogue buttons
        protected void Checkout(object sender, EventArgs e)
        {
            Response.Redirect("Checkout.aspx");
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
            Master.ChangeCartItemQty(ids.Count.ToString());
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

            var index = ids.FindIndex(x => x == cm.BookID); //returns bookId

            //search db for book stock based on bookOID
            Book b = new Book();
            b = BusinessLogic.GetBookbyID(cm.BookID);
            CartModel ca = new CartModel();

            Label lbl = (Label)cartGridview.Rows[gvr.RowIndex].FindControl("lblQty");
            int displayedQty = int.Parse(lbl.Text);

            if (index >= 0 && b.Stock != displayedQty)
            {
                ids.Insert(index, cm.BookID); //insert into list of bookIDs
            }

            

            Session["cart_items"] = ids;
            Master.ChangeCartItemQty(ids.Count.ToString());
            Response.Redirect("cart.aspx");

        }

    }
}