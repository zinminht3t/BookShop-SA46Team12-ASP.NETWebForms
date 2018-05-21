using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
    
        protected void Page_Load(object sender, EventArgs e)
        {
            lstBooks = new List<Book>();
            lstOD = new List<OrderDetail>();
            txtName.Focus();
            lstBooks = BusinessLogic.GetBooks();
            cartBooks.DataSource = lstBooks;
            cartBooks.DataBind();
            if(lstBooks.Count < 1)
            {
                Response.Redirect("../");
            }

            lblBooks.Text = lstBooks.Count.ToString();


            foreach (Book b in lstBooks)
            {
                total += (double)b.Price;
                discount += BusinessLogic.GetDiscountPrice(b.BookID);
                OrderDetail od = new OrderDetail();
                od.BookID = b.BookID;
                od.DiscountID = BusinessLogic.GetDiscountID(b.BookID);
                od.Qty = 3; //todo
                od.UnitPrice = b.Price;
                od.NetPrice = (b.Price - (decimal) BusinessLogic.GetDiscountPrice(b.BookID));
                lstOD.Add(od);
            }

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
            order.Total = (decimal) total;
            order.UserID = 1;
            order.Address = txtAddress.Text;
            order.Email = txtEmail.Text;
            order.PostalCode = Convert.ToInt32(txtPostCode.Text);
            order.Name = txtName.Text;
            BusinessLogic.AddOrder(order, lstOD);
        }

    }
}