namespace SA46Team12BookShopApp
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("OrderHeader")]
    public partial class OrderHeader
    {
        [Key]
        public int OrderID { get; set; }

        [Column(TypeName = "date")]
        public DateTime OrderDate { get; set; }

        public decimal Total { get; set; }

        public int UserID { get; set; }
    }
}
