using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace SA46Team12BookShopApp.Owner
{
    public partial class Default : System.Web.UI.Page
    {
        private SqlConnection conn;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gvbind();
            }
        }

        protected void gbEditBooks_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvEditBooks.EditIndex = e.NewEditIndex;
            gvbind();
        }
        protected void gbEditBooks_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //int userid = Convert.ToInt32(gvEditBooks.DataKeys[e.RowIndex].Value.ToString());
            //GridViewRow row = (GridViewRow)gvEditBooks.Rows[e.RowIndex];
            //Label bookID = (Label)row.FindControl("BookID");
            ////TextBox txtname=(TextBox)gr.cell[].control[];  
            //TextBox textName = (TextBox)row.Cells[0].Controls[0];
            //TextBox textadd = (TextBox)row.Cells[1].Controls[0];
            //TextBox textc = (TextBox)row.Cells[2].Controls[0];
            ////TextBox textadd = (TextBox)row.FindControl("txtadd");  
            ////TextBox textc = (TextBox)row.FindControl("txtc");  
            //gvEditBooks.EditIndex = -1;
            //conn.Open();
            ////SqlCommand cmd = new SqlCommand("SELECT * FROM detail", conn);  
            //SqlCommand cmd = new SqlCommand("update BooksDB set name='" + textName.Text + "',address='" + textadd.Text + "',country='" + textc.Text + "'where id='" + userid + "'", conn);
            //cmd.ExecuteNonQuery();
            //conn.Close();
            //gvbind();
            ////GridView1.DataBind();  
            
        }
        protected void gbEditBooks_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvEditBooks.PageIndex = e.NewPageIndex;
            gvbind();
        }
        protected void gbEditBooks_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvEditBooks.EditIndex = -1;
            gvbind();
        }

        protected void SQLCon()
        {
            conn = new SqlConnection("Data Source=BooksDB;Integrated Security=true;Initial Catalog=SSPI");
        }

        protected void gvbind()
        {
            using (BooksDB b = new BooksDB())
            {
                if (b.Books.ToList<Book>().Count() > 0)
                {
                    gvEditBooks.DataSource = b.Books.ToList<Book>();
                    gvEditBooks.DataBind();
                }
                else
                {
                    Response.Write("No Records Found");
                }
            }
        }
    }


}