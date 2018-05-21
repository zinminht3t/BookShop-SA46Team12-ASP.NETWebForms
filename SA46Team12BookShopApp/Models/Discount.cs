namespace SA46Team12BookShopApp
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Discount")]
    public partial class Discount
    {
        public int DiscountID { get; set; }

        public int BookID { get; set; }

        [Required]
        [StringLength(90)]
        public string DiscountDesc { get; set; }

        public decimal DiscountPercent { get; set; }
    }
}
