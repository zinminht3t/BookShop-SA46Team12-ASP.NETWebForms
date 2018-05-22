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
            if (BusinessLogic.GetUserOrders().Count < 1)
            {
                ShowOrders.Visible = false;
                HideOrders.Visible = true;
            }
            else
            {
                ShowOrders.Visible = true;
                HideOrders.Visible = false;


                MembershipUser user = Membership.GetUser();
                Guid UserID = (Guid)user.ProviderUserKey;
                string userid = UserID.ToString(); //todo

                SQLDataSourceConfirmOrder.SelectCommand = "SELECT * FROM Book INNER JOIN OrderDetail ON Book.BookID = OrderDetail.BookID INNER JOIN OrderHeader ON OrderDetail.OrderID = OrderHeader.OrderID WHERE OrderHeader.UserID = '" + userid + "' Order by OrderHeader.OrderDate DESC";
            lstOrders.DataSourceID = "SQLDataSourceConfirmOrder";
                lstOrders.DataBind();
            }

            if (!IsPostBack)
            {
                if (Request.QueryString["Ordered"] == null)
                {
                    ShowAlert.Visible = false;
                }
                else
                {
                    ShowAlert.Visible = true;
                }
            }
        }
    }
}