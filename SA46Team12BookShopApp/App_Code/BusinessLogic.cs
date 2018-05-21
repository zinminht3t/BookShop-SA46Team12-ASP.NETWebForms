using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SA46Team12BookShopApp
{
    public class BusinessLogic
    {
        public static List<Book> GetBooks()
        {
            using (BooksDB entities = new BooksDB())
            {
                return entities.Books.Take(4).ToList<Book>(); //todo
            }
        }
        public static int GetDiscountID(int BookID)
        {
            int discountid = -1;
            try
            {
                using (BooksDB entities = new BooksDB())
                {

                    discountid = entities.Discounts.Where(d => d.BookID == BookID).Select(x => x.DiscountID).FirstOrDefault();
                }
                return discountid;
            }
            catch
            {
                return -1;
            }
        }
        public static double GetDiscountPercent(int BookID)
        {
            double discount = 0;
            try
            {
                using (BooksDB entities = new BooksDB())
                {

                    discount = (double)entities.Discounts.Where(d => d.BookID == BookID).Select(x => x.DiscountPercent).FirstOrDefault();
                }
                return discount;
            }
            catch
            {
                return 0;
            }
        }
        public static double GetBookPrice(int BookID)
        {
            double price = 0;
            try
            {
                using (BooksDB entities = new BooksDB())
                {

                    price = (double)entities.Books.Where(d => d.BookID == BookID).Select(x => x.Price).FirstOrDefault();
                }
                return price;
            }
            catch
            {
                return 0;
            }
        }
        public static double GetDiscountPrice(int BookID)
        {
            double discountpercent = GetDiscountPercent(BookID);
            double price = GetBookPrice(BookID);
            return (discountpercent / 100) * price;
        }
        public static void AddOrder(double total, int userid, List<OrderDetail> od)
        {
            using (BooksDB entities = new BooksDB())
            {
                OrderHeader order = new OrderHeader();
                order.OrderDate = DateTime.Today;
                order.Total = (decimal) total;
                order.UserID = 1;
                entities.OrderHeaders.Add(order);
                entities.SaveChanges();
                
                foreach (OrderDetail orddet in od)
                {
                    OrderDetail odet = new OrderDetail();
                    odet.Qty = orddet.Qty;
                    odet.UnitPrice = orddet.UnitPrice;
                    odet.NetPrice = orddet.NetPrice;
                    odet.BookID = orddet.BookID;
                    odet.DiscountID = orddet.DiscountID;
                    odet.OrderID = order.OrderID;
                    entities.OrderDetails.Add(odet);
                }
                entities.SaveChanges();
            }
        }
    }
}