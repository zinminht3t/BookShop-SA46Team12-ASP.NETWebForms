using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace SA46Team12BookShopApp
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.IsAuthenticated && !string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
                    // This is an unauthorized, authenticated request...
                    Response.Redirect("~/UnauthorizedAccess.aspx");
            }
        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            string username = CreateUserWizard1.UserName;
            Roles.AddUserToRole(username, "Member");
        }
    }
}