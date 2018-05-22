using SA46Team12BookShopApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SA46Team12BookShopApp
{
    public partial class Checkout : System.Web.UI.Page
    {
        double total = 0;
        double discount = 0;
        List<Book> lstBooks;
        List<OrderDetail> lstOD;
        List<CartModel> lstCart;

        protected void Page_Load(object sender, EventArgs e)
        {
            lstBooks = new List<Book>();
            lstOD = new List<OrderDetail>();

            //if (!IsPostBack)
            //{
            //    //List<int> cartItems = (List<int>)Session["cart_items"];    //todo
            //    //cartItems.Add(1);
            //    //cartItems.Add(2);
            //    //cartItems.Add(3);
            //    //cartItems.Add(4);
            //    //cartItems.Add(1);
            //    //Session["cart_items"] = cartItems;
            //}


            List<int> carts = (List<int>)Session["cart_items"];    //todo

            foreach (int id in carts)
            {
                Book b = new Book();
                b = BusinessLogic.GetBookbyID(id);
                lstBooks.Add(b);
            }

            txtName.Focus();

            if (lstBooks.Count < 1)
            {
                Response.Redirect("../");
            }

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
            lstCart = new List<CartModel>();
            foreach (KeyValuePair<string, int> entry in cartDis)
            {
                Book b = BusinessLogic.GetBookbyISBN(entry.Key);
                total += (double)b.Price;
                discount += BusinessLogic.GetDiscountPrice(b.BookID);
                OrderDetail od = new OrderDetail();
                od.BookID = b.BookID;
                od.DiscountID = BusinessLogic.GetDiscountID(b.BookID);
                od.Qty = entry.Value; //todo
                od.UnitPrice = b.Price;
                od.NetPrice = (b.Price - (decimal)BusinessLogic.GetDiscountPrice(b.BookID));
                lstOD.Add(od);


                CartModel ca = new CartModel();
                ca.Title = b.Title;
                ca.Price = b.Price;
                ca.BookID = b.BookID;
                ca.Discount = (decimal)BusinessLogic.GetDiscountPrice(b.BookID);
                ca.Qty = entry.Value;
                ca.Amount = (decimal)ca.Price - (ca.Price * (ca.Discount / 100));
                lstCart.Add(ca);
            }

            cartBooks.DataSource = lstCart;
            cartBooks.DataBind();

            lblBooks.Text = lstBooks.Count.ToString();

            string samount = String.Format("{0:C}", total);
            string sdiscount = String.Format("{0:C}", discount);
            string stotal = String.Format("{0:C}", (total - discount));
            lblAmount.Text = samount;
            lblDiscount.Text = sdiscount;
            lblTotal.Text = stotal;
        }
        protected void btnPay_Click(object sender, EventArgs e)
        {

            OrderHeader order = new OrderHeader();
            order.OrderDate = DateTime.Today;
            order.Total = (decimal)total;

            MembershipUser user = Membership.GetUser();
            Guid UserID = (Guid)user.ProviderUserKey;
            order.UserID = UserID.ToString();
            //order.UserID = ""; //todo
            order.Address = txtAddress.Text;
            order.Email = txtEmail.Text;
            order.PostalCode = Convert.ToInt32(txtPostCode.Text);
            order.Name = txtName.Text;
            BusinessLogic.AddOrder(order, lstOD);
            Session["cart_items"] = null;
            Response.Redirect("ConfirmOrder.aspx?Ordered=" + true);

        }

    }
}