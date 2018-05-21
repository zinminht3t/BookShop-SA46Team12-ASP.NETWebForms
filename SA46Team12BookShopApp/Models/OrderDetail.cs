namespace SA46Team12BookShopApp
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("OrderDetail")]
    public partial class OrderDetail
    {
        public int OrderDetailID { get; set; }

        public int OrderID { get; set; }

        public int BookID { get; set; }

        public int Qty { get; set; }

        public decimal UnitPrice { get; set; }

        public int DiscountID { get; set; }

        public decimal NetPrice { get; set; }
    }
}
