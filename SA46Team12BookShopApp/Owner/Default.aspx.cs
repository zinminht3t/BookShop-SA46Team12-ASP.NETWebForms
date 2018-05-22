using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace SA46Team12BookShopApp.Owner
{
    public partial class Default : System.Web.UI.Page
    {
        private string connection;
        private string sqlquery;
        private DataTable dtbl;

        protected void Page_Load(object sender, EventArgs e)
        {
            connection = @"Data Source=localhost; Initial Catalog=Bookshop; Integrated Security=SSPI;";
            if (!IsPostBack)
            {
                populate();
            }
        }

        protected void gbEditBooks_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvEditBooks.EditIndex = e.NewEditIndex;
            populate();
        }

        protected void gbEditBooks_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                UpdateDatabase(e);
            }
            catch (Exception ex)
            {
                lblError.Visible = true;
                lblError.Text = ex.Message;
            }
        }

        protected void gbEditBooks_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvEditBooks.PageIndex = e.NewPageIndex;
            populate();
        }
        protected void gbEditBooks_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvEditBooks.EditIndex = -1;
            populate();
        }

        protected void populate()
        {
            sqlquery = "SELECT Book.BookID, Book.Title, Category.Name, Book.Author, " +
                "Book.ISBN, Book.Stock, Book.Price, ISNULL(Discount.DiscountPercent, '1') AS DiscountPercent, CAST(ROUND(Book.Price*ISNULL(Discount.DiscountPercent,1), 2) AS numeric(10,2)) AS TOTAL " +
                "FROM Book INNER JOIN Category ON Book.CategoryID = Category.CategoryID " +
                "LEFT OUTER JOIN Discount ON Book.BookID = Discount.BookID";

            SearchDatabase(sqlquery);
        }

        protected void tbSearch_TextChanged(object sender, EventArgs e)
        {
            sqlquery = "SELECT Book.BookID, Book.Title, Category.Name, Book.Author, " +
                "Book.ISBN, Book.Stock, Book.Price, ISNULL(Discount.DiscountPercent, '1') AS DiscountPercent, CAST(ROUND(Book.Price*ISNULL(Discount.DiscountPercent,1), 2) AS numeric(10,2)) AS TOTAL " +
                "FROM Book INNER JOIN Category ON Book.CategoryID = Category.CategoryID " +
                "LEFT OUTER JOIN Discount ON Book.BookID = Discount.BookID " +
                "WHERE Book.Title LIKE '%" + tbSearch.Text + "%'";

            SearchDatabase(sqlquery);
        }

        protected void NoRecordsFound()
        {
            dtbl.Rows.Add(dtbl.NewRow());
            gvEditBooks.DataSource = dtbl;
            gvEditBooks.DataBind();
            gvEditBooks.Rows[0].Cells.Clear();
            gvEditBooks.Rows[0].Cells.Add(new TableCell());
            gvEditBooks.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
            gvEditBooks.Rows[0].Cells[0].Text = "No Records Found";
            gvEditBooks.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
        }

        protected void SearchDatabase(string sqlquery)
        {
            dtbl = new DataTable();
            using (SqlConnection sqlcon = new SqlConnection(connection))
            {
                sqlcon.Open();
                SqlDataAdapter sqlda = new SqlDataAdapter(sqlquery, sqlcon);
                sqlda.Fill(dtbl);
                sqlcon.Close();
            }
            if (dtbl.Rows.Count > 0)
            {
                gvEditBooks.DataSource = dtbl;
                gvEditBooks.DataBind();
            }
            else
            {
                NoRecordsFound();
            }
        }

        protected void UpdateDatabase(GridViewUpdateEventArgs e)
        {
            using (SqlConnection sqlcon = new SqlConnection(connection))
            {
                sqlcon.Open();
                string sql = "  Update book set Stock = @qty , price = @price where bookid = @id";
                SqlCommand sqlcom = new SqlCommand(sql, sqlcon);
                sqlcom.Parameters.AddWithValue("qty", (gvEditBooks.Rows[e.RowIndex].FindControl("tbQty") as TextBox).Text.Trim());
                sqlcom.Parameters.AddWithValue("price", (gvEditBooks.Rows[e.RowIndex].FindControl("tbPrice") as TextBox).Text.Trim());
                sqlcom.Parameters.AddWithValue("id", (gvEditBooks.Rows[e.RowIndex].FindControl("lblBookID") as Label).Text);
                sqlcom.ExecuteNonQuery();

                sql = "Update Discount set DiscountPercent=@disc where bookid =@id";
                sqlcom = new SqlCommand(sql, sqlcon);
                sqlcom.Parameters.AddWithValue("disc", (gvEditBooks.Rows[e.RowIndex].FindControl("tbDiscP") as TextBox).Text.Trim());
                sqlcom.Parameters.AddWithValue("id", (gvEditBooks.Rows[e.RowIndex].FindControl("lblBookID") as Label).Text);
                sqlcom.ExecuteNonQuery();

                gvEditBooks.EditIndex = -1;
                populate();
                lblSuccess.Visible = true;
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            tbSearch.Text = String.Empty;
        }

        protected void btnViewAll_Click(object sender, EventArgs e)
        {
            populate();
        }

        protected void ddlCategoryFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            sqlquery = "SELECT Book.BookID, Book.Title, Category.Name, Book.Author, " +
                "Book.ISBN, Book.Stock, Book.Price, ISNULL(Discount.DiscountPercent, '1') AS DiscountPercent, CAST(ROUND(Book.Price*ISNULL(Discount.DiscountPercent,1), 2) AS numeric(10,2)) AS TOTAL " +
                "FROM Book INNER JOIN Category ON Book.CategoryID = Category.CategoryID " +
                "LEFT OUTER JOIN Discount ON Book.BookID = Discount.BookID " +
                "WHERE Category.Name = '" + ddlCategoryFilter.SelectedItem.Text + "'";

            SearchDatabase(sqlquery);
        }
    }
}