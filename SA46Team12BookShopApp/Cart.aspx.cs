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
                //lblBookID.Text = "(Added Book ID: "+PreviousPage.itemClicked+")";
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