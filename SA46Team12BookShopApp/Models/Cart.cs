using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SA46Team12BookShopApp.Models
{
    public class CartModel
    {
        public int BookID { get; set; }
        public string Title { get; set; }
        public decimal Price { get; set; }
        public decimal Discount { get; set; }
        public int Qty { get; set; }
        public decimal Amount { get; set; }
    }
}