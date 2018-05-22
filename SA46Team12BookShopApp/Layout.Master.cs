using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SA46Team12BookShopApp
{
    public partial class Layout : System.Web.UI.MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            MembershipUser user = Membership.GetUser();
           // Guid UserID = (Guid)user.ProviderUserKey;

            if (user == null)
            {
                AllUserNav.Visible = true;
                UserNav.Visible = false;
            }
            else
            {

                AllUserNav.Visible = false;
                UserNav.Visible = true;
            }
        }

        protected void logout(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Session.Clear();
            Response.Redirect("default.aspx");
        }

        public void ChangeCartItemQty(string newQty)
        {
            Label lbl = (Label)this.FindControl("CartItemQty");
            lbl.Text = newQty;
        }
    }
}