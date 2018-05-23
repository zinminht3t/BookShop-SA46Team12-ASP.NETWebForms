using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Web.Security;

namespace SA46Team12BookShopApp.Owner
{
    public partial class InsertProducts : System.Web.UI.Page
    {
        #region Properties
        private string connection;
        private string sqlquery;
        private static DataTable Dtbl { get; set; }
        private string GetID
        {
            get
            {
                // Query next Book ID
                string result = "select ident_current('Book') + ident_incr('Book')";
                using (SqlConnection sqlcon = new SqlConnection(connection))
                {
                    SqlCommand showresult = new SqlCommand(result, sqlcon);
                    sqlcon.Open();
                    return showresult.ExecuteScalar().ToString();
                }
            }
        }
        public string Sqlquery
        {
            get
            {
                sqlquery = "SELECT Book.BookID, Book.Title, Category.Name, Book.Author, " +
                "Book.ISBN, Book.Stock, Book.Price, ISNULL(Discount.DiscountPercent, '0') AS DiscountPercent, " +
                "Discount.DiscountDesc, " +
                "CAST(ROUND(Book.Price*((100-ISNULL(Discount.DiscountPercent, 0))/100), 2) AS numeric(10,2)) AS TOTAL " +
                "FROM Book INNER JOIN Category ON Book.CategoryID = Category.CategoryID " +
                "LEFT OUTER JOIN Discount ON Book.BookID = Discount.BookID where 1=2";
                return sqlquery;
            }
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            connection = @"Data Source=localhost; Initial Catalog=Bookshop; Integrated Security=SSPI;";
            if (!IsPostBack)
            {
                populate();
            }
        }

        #region Event Listeners - Gridview
        protected void gbInsertBooks_RowEditing(object sender, GridViewEditEventArgs e)
        {
            lblSuccess.Visible = false;
            gvInsertBooks.EditIndex = e.NewEditIndex;
            populate();
            Label lblID = (Label)gvInsertBooks.Rows[0].FindControl("lblBookID");
            lblID.Text = GetID;
        }

        protected void gbInsertBooks_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                string sql;
                SqlCommand sqlcom;
                using (SqlConnection sqlcon = new SqlConnection(connection))
                {
                    sqlcon.Open();
                    // Insert Book Table
                    sql = "Insert into Book (Title, CategoryID, ISBN, Author, Stock, Price) values (@Title, @CategoryID, @ISBN, @Author, @Stock, @Price)";
                    sqlcom = new SqlCommand(sql, sqlcon);
                    sqlcom.Parameters.AddWithValue("Title", (gvInsertBooks.Rows[e.RowIndex].FindControl("tbTitle") as TextBox).Text.Trim());
                    sqlcom.Parameters.AddWithValue("CategoryID", getCategoryID((gvInsertBooks.Rows[e.RowIndex].FindControl("ddlCategoryFilter") as DropDownList).SelectedItem.Text.Trim()));
                    sqlcom.Parameters.AddWithValue("ISBN", (gvInsertBooks.Rows[e.RowIndex].FindControl("tbISBN") as TextBox).Text.Trim());
                    sqlcom.Parameters.AddWithValue("Author", (gvInsertBooks.Rows[e.RowIndex].FindControl("tbAuthor") as TextBox).Text.Trim());
                    sqlcom.Parameters.AddWithValue("Stock", (gvInsertBooks.Rows[e.RowIndex].FindControl("tbQty") as TextBox).Text.Trim());
                    sqlcom.Parameters.AddWithValue("Price", (gvInsertBooks.Rows[e.RowIndex].FindControl("tbPrice") as TextBox).Text.Trim());
                    sqlcom.ExecuteNonQuery();

                    // Insert Discount Table
                    sql = "Insert into Discount (Bookid, DiscountDesc, DiscountPercent) values (@id , @discD, @disc)";
                    sqlcom = new SqlCommand(sql, sqlcon);
                    sqlcom.Parameters.AddWithValue("id", (gvInsertBooks.Rows[e.RowIndex].FindControl("lblBookID") as Label).Text);
                    sqlcom.Parameters.AddWithValue("discD", (gvInsertBooks.Rows[e.RowIndex].FindControl("tbDiscDesc") as TextBox).Text);
                    sqlcom.Parameters.AddWithValue("disc", (gvInsertBooks.Rows[e.RowIndex].FindControl("tbDiscP") as TextBox).Text.Trim());

                    sqlcom.ExecuteNonQuery();

                    FileUpload Image1 = (FileUpload)gvInsertBooks.Rows[0].FindControl("fuBookImg");
                    if (Image1.HasFile)
                    {
                        Image1.SaveAs(Server.MapPath("../images/") + Image1.FileName);
                    }
                    gvInsertBooks.EditIndex = -1;
                    populate();
                    lblSuccess.Visible = true;
                    lblSuccess.Text = "Book ID: " + GetID + " is successfully inserted";
                }

            }
            catch (Exception ex)
            {
                lblSuccess.Visible = true;
                lblSuccess.Text = ex.Message;
            }
        }

        protected void gbInsertBooks_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvInsertBooks.EditIndex = -1;
            Label lblID = (Label)gvInsertBooks.Rows[0].FindControl("lblBookID");
            lblID.Text = GetID;
            populate();
        }
        #endregion

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void populate()
        {
            // For Showing Header
            Dtbl = new DataTable();
            using (SqlConnection sqlcon = new SqlConnection(connection))
            {
                sqlcon.Open();
                SqlDataAdapter sqlda = new SqlDataAdapter(Sqlquery, sqlcon);
                sqlda.Fill(Dtbl);
                sqlcon.Close();
            }
            gvInsertBooks.DataSource = Dtbl;
            gvInsertBooks.DataBind();

            // Add Empty Rows
            DataRow dr = Dtbl.NewRow();
            dr[0] = 0; dr[1] = ""; dr[2] = ""; dr[3] = ""; dr[4] = "";
            dr[5] = 0; dr[6] = 0; dr[7] = 0; dr[8] = 0; dr[9] = 0;
            Dtbl.Rows.Add(dr);

            gvInsertBooks.DataSource = Dtbl;
            gvInsertBooks.DataBind();
        }

        protected int getCategoryID(string genre)
        {
            // Query next Book ID
            string result = "select categoryid from category where name='" + genre + "'";
            using (SqlConnection sqlcon = new SqlConnection(connection))
            {
                SqlCommand showresult = new SqlCommand(result, sqlcon);
                sqlcon.Open();
                return Convert.ToInt32(showresult.ExecuteScalar());
            }
        }

        protected void logout(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Session.Clear();
            Response.Redirect("../default.aspx");
        }

    }
}