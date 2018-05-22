using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.HtmlControls;

namespace SA46Team12BookShopApp.Owner
{
    public partial class Default : System.Web.UI.Page
    {
        #region Properties
        private string connection;
        private string sqlquery;
        private static DataTable dtbl;
        private static string sqlwhere;

        private static string Sqlwhere
        {
            get
            {
                return sqlwhere;
            }
            set
            {
                sqlwhere = value;
            }
        }

        private static DataTable Dtbl
        {
            get
            {
                return dtbl;
            }
            set
            {
                dtbl = value;
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
                "LEFT OUTER JOIN Discount ON Book.BookID = Discount.BookID ";
                return sqlquery;
            }
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            connection = @"Data Source=localhost; Initial Catalog=Bookshop; Integrated Security=SSPI;";
            if (!IsPostBack)
            {
                populate(Sqlquery);
                ViewState.Add("SqlQuery", Sqlquery);
            }
        }

        protected void gbEditBooks_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvEditBooks.EditIndex = e.NewEditIndex;
            populate(ViewState["SqlQuery"].ToString());
        }

        protected void gbEditBooks_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection sqlcon = new SqlConnection(connection))
                {
                    sqlcon.Open();
                    // Update Book Table
                    string sql = "  Update book set Stock = @qty , price = @price where bookid = @id";
                    SqlCommand sqlcom = new SqlCommand(sql, sqlcon);
                    sqlcom.Parameters.AddWithValue
                        ("qty", (gvEditBooks.Rows[e.RowIndex].FindControl("tbQty") as TextBox).Text.Trim());
                    sqlcom.Parameters.AddWithValue
                        ("price", (gvEditBooks.Rows[e.RowIndex].FindControl("tbPrice") as TextBox).Text.Trim());
                    sqlcom.Parameters.AddWithValue
                        ("id", (gvEditBooks.Rows[e.RowIndex].FindControl("lblBookID") as Label).Text);
                    sqlcom.ExecuteNonQuery();

                    // Update Discount Table
                    string sqlinsertupdate = "Select * from discount where bookid ='" +
                        (gvEditBooks.Rows[e.RowIndex].FindControl("lblBookID") as Label).Text + "'";
                    sqlcom = new SqlCommand(sqlinsertupdate, sqlcon);
                    using (SqlDataReader reader = sqlcom.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            sql = "Update Discount set DiscountPercent = @disc, DiscountDesc = @discD where bookid = @id";
                            sqlcom = new SqlCommand(sql, sqlcon);
                            sqlcom.Parameters.AddWithValue
                                ("disc", (gvEditBooks.Rows[e.RowIndex].FindControl("tbDiscP") as TextBox).Text.Trim());
                            sqlcom.Parameters.AddWithValue
                                ("discD", (gvEditBooks.Rows[e.RowIndex].FindControl("tbDiscDesc") as TextBox).Text.Trim());
                            sqlcom.Parameters.AddWithValue
                                ("id", (gvEditBooks.Rows[e.RowIndex].FindControl("lblBookID") as Label).Text);
                        }
                        else
                        {
                            sql = "Insert into Discount (Bookid, DiscountDesc, DiscountPercent) values (@id , @discD, @disc)";
                            sqlcom = new SqlCommand(sql, sqlcon);
                            sqlcom.Parameters.AddWithValue("id", (gvEditBooks.Rows[e.RowIndex].FindControl("lblBookID") as Label).Text);
                            sqlcom.Parameters.AddWithValue("discD", (gvEditBooks.Rows[e.RowIndex].FindControl("tbDiscDesc") as TextBox).Text);
                            sqlcom.Parameters.AddWithValue("disc", (gvEditBooks.Rows[e.RowIndex].FindControl("tbDiscP") as TextBox).Text.Trim());
                        }
                    }   
                    sqlcom.ExecuteNonQuery();
                    gvEditBooks.EditIndex = -1;
                    populate(ViewState["SqlQuery"].ToString());
                    lblSuccess.Visible = true;
                }
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
            gvEditBooks.EditIndex = -1;
            gvEditBooks.DataSource = Dtbl;
            gvEditBooks.DataBind();
        }
        protected void gbEditBooks_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvEditBooks.EditIndex = -1;
            populate(ViewState["SqlQuery"].ToString());
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (ddlCategoryFilter.SelectedItem.Text == "All")
            {
                Sqlwhere = Sqlquery + "WHERE Book.Title LIKE '%" + tbSearch.Text + "%' OR Book.Author LIKE '%" 
                    + tbSearch.Text + "%' OR Book.BookID LIKE '%" + tbSearch.Text + "%' OR Book.ISBN LIKE '%" 
                    + tbSearch.Text + "%' OR Discount.DiscountDesc LIKE '%" + tbSearch.Text + "%'";
            }
            else
            {
                Sqlwhere = Sqlquery + "WHERE (Book.Title LIKE '%" + tbSearch.Text + "%' OR Book.Author LIKE '%" 
                    + tbSearch.Text + "%' OR Book.BookID LIKE '%" + tbSearch.Text + "%' OR Book.ISBN LIKE '%" 
                    + tbSearch.Text + "%' OR Discount.DiscountDesc LIKE '%" + tbSearch.Text + "%') AND Category.Name='" 
                    + ddlCategoryFilter.SelectedItem.Text + "'";
            }
            gvEditBooks.PageIndex = 0;
            populate(Sqlwhere);
            ViewState.Add("SqlQuery", Sqlwhere);
        }

        protected void btnViewAll_Click(object sender, EventArgs e)
        {
            populate(Sqlquery);
            ViewState.Add("SqlQuery", Sqlquery);
            gvEditBooks.PageIndex = 0;
            tbSearch.Text = "";
            ddlCategoryFilter.SelectedIndex = 0;
        }

        protected void ddlCategoryFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(tbSearch.Text.Trim() == null)
            {
                Sqlwhere = Sqlquery + "WHERE Category.Name = '" + ddlCategoryFilter.SelectedItem.Text + "'";
            }
            else
                if(ddlCategoryFilter.SelectedItem.Text == "All")
            {
                Sqlwhere = Sqlquery + "WHERE Book.Title LIKE '%" + tbSearch.Text + "%' OR Book.Author LIKE '%" 
                    + tbSearch.Text + "%' OR Book.BookID LIKE '%" + tbSearch.Text + "%' OR Book.ISBN LIKE '%" + tbSearch.Text 
                    + "%' OR Discount.DiscountDesc LIKE '%" + tbSearch.Text + "%'";
            }
            else
            {
                Sqlwhere = Sqlquery + "WHERE (Book.Title LIKE '%" + tbSearch.Text + "%' OR Book.Author LIKE '%" 
                    + tbSearch.Text + "%' OR Book.BookID LIKE '%" + tbSearch.Text + "%' OR Book.ISBN LIKE '%" + tbSearch.Text 
                    + "%' OR Discount.DiscountDesc LIKE '%" + tbSearch.Text + "%') AND Category.Name='" 
                    + ddlCategoryFilter.SelectedItem.Text + "'";
            }
            gvEditBooks.PageIndex = 0;
            populate(Sqlwhere);
            ViewState.Add("SqlQuery", Sqlwhere);
        }

        protected void populate(string query)
        {
            Dtbl = new DataTable();
            using (SqlConnection sqlcon = new SqlConnection(connection))
            {
                sqlcon.Open();
                SqlDataAdapter sqlda = new SqlDataAdapter(query, sqlcon);
                sqlda.Fill(Dtbl);
                sqlcon.Close();
            }
            gvEditBooks.DataSource = Dtbl;
            gvEditBooks.DataBind();
        }
    }
}