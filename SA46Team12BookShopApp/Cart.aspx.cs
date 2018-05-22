using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;


namespace SA46Team12BookShopApp
{
    public partial class Cart : System.Web.UI.Page
    {
        //int count;
        double total = 0;
        double discount = 0;
        List<Book> lstBooks;
        List<OrderDetail> lstOD;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
<<<<<<< HEAD
                lblBookID.Text = "(Added Book ID: "+PreviousPage.itemClicked+")";
=======
                //    //DataTable dt = new DataTable();
                //    //dt.Columns.AddRange(new DataColumn[6] { new DataColumn("List"), new DataColumn("Title"),
                //    //                                        new DataColumn("Price"), new DataColumn("Discount"),
                //    //                                        new DataColumn("Qty"), new DataColumn("Subtotal")});
                //    //Session["Customers"] = dt;
                //count = 0;
>>>>>>> 7b4656b7abefd8fe45f629d4be13fe9a84b82af6
                lstBooks = new List<Book>();
                lstOD = new List<OrderDetail>();
                lstBooks = BusinessLogic.GetBooks();
                cartGridview.DataSource = lstBooks;
                cartGridview.DataBind();

                foreach (Book b in lstBooks)
                {
                    total += (double)b.Price;
                    discount += BusinessLogic.GetDiscountPrice(b.BookID);
                    OrderDetail od = new OrderDetail();
                    od.BookID = b.BookID;
                    od.DiscountID = BusinessLogic.GetDiscountID(b.BookID);
                    od.Qty = 3; //todo
                    od.UnitPrice = b.Price;
                    od.NetPrice = (b.Price - (decimal)BusinessLogic.GetDiscountPrice(b.BookID));
                    lstOD.Add(od);
                }

            
            }

            else
            {

            }
        }

        protected void Checkout(object sender, EventArgs e)
        {
            Response.Redirect("Members/Checkout.aspx");
        }

        protected void Products(object sender, EventArgs e)
        {
            Response.Redirect("Products.aspx");
        }

    }
}