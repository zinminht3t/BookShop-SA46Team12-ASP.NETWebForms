﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SA46Team12BookShopApp
{
    public partial class Layout : System.Web.UI.MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        public void ChangeCartItemQty(string newQty)
        {
            Label lbl = (Label)this.FindControl("CartItemQty");
            lbl.Text = newQty;
        }
    }
}