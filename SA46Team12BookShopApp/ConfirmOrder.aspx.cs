using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SA46Team12BookShopApp.Members
{
    public partial class ConfirmOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string userid = "";
                MembershipUser user = Membership.GetUser();

                if (user == null)
                {
                    Response.Redirect("default.aspx");
                }
                else
                {

                    Guid UserID = (Guid)user.ProviderUserKey;
                    userid = UserID.ToString();
                }


                if (Request.QueryString["orderid"] == null)
                {
                    ShowAlert.Visible = false;
                    SQLDataSourceConfirmOrder.SelectCommand = "SELECT * FROM Book INNER JOIN OrderDetail ON Book.BookID = OrderDetail.BookID INNER JOIN OrderHeader ON OrderDetail.OrderID = OrderHeader.OrderID WHERE OrderHeader.UserID = '" + userid + "' Order by OrderHeader.OrderID";

                }
                else
                {
                    ShowAlert.Visible = true;
                    string orid = Request.QueryString["orderid"];
                    int oid = Convert.ToInt32(orid);
                    SQLDataSourceConfirmOrder.SelectCommand = "SELECT * FROM Book INNER JOIN OrderDetail ON Book.BookID = OrderDetail.BookID INNER JOIN OrderHeader ON OrderDetail.OrderID = OrderHeader.OrderID WHERE OrderHeader.UserID = '" + userid + "' and OrderHeader.OrderID = '" + oid + "' Order by OrderHeader.OrderID";
                }


                if (BusinessLogic.GetUserOrders().Count < 1)
                {
                    ShowOrders.Visible = false;
                    HideOrders.Visible = true;
                }
                else
                {
                    ShowOrders.Visible = true;
                    HideOrders.Visible = false;
                    lstOrders.DataSourceID = "SQLDataSourceConfirmOrder";
                    lstOrders.DataBind();
                }
            }

        }
    }
}