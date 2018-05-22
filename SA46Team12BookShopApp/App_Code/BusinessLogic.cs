using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

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
        public static Book GetBookbyID(int BookID)
        {
            using (BooksDB entities = new BooksDB())
            {
                return entities.Books.Where(x => x.BookID == BookID).FirstOrDefault(); //todo
            }
        }
        public static Book GetBookbyISBN(string ISBN)
        {
            using (BooksDB entities = new BooksDB())
            {
                return entities.Books.Where(x => x.ISBN == ISBN).FirstOrDefault(); //todo
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
            return (1 - (discountpercent / 100)) * price;
        }
        public static void AddOrder(OrderHeader o, List<OrderDetail> od)
        {
            using (BooksDB entities = new BooksDB())
            {
                entities.OrderHeaders.Add(o);
                entities.SaveChanges();

                foreach (OrderDetail orddet in od)
                {
                    OrderDetail odet = new OrderDetail();
                    odet.Qty = orddet.Qty;
                    odet.UnitPrice = orddet.UnitPrice;
                    odet.NetPrice = orddet.NetPrice;
                    odet.BookID = orddet.BookID;
                    odet.DiscountID = orddet.DiscountID;
                    odet.OrderID = o.OrderID;
                    entities.OrderDetails.Add(odet);
                }
                entities.SaveChanges();
            }
        }
        public static List<OrderHeader> GetUserOrders()
        {
            using (BooksDB entities = new BooksDB())
            {

                MembershipUser user = Membership.GetUser();
                Guid UserID = (Guid)user.ProviderUserKey;
                string userid = UserID.ToString(); //todo
                return entities.OrderHeaders.Where(x => x.UserID == userid).ToList<OrderHeader>(); //todo
            }
        }
    }
}