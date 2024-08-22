using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Runtime.Remoting.Messaging;

namespace StyleSavvy_FinalProject
{
    public partial class Admin : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] != null)
            {
                // checking if the user logged in is admin
                if (Session["userName"].ToString() != "admin")
                {
                    Response.Redirect("Default");
                }
            }
            else
            {
                // if no user is logged in
                Response.Redirect("Login");
            }
        }

        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO category (name) VALUES (@name)";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@name", txtCategoryName.Text.Trim());
                        try
                        {
                            con.Open();
                            cmd.ExecuteNonQuery();
                            gvCategories.DataBind();
                            txtCategoryName.Text = string.Empty;
                        }
                        catch (Exception ex)
                        {
                            litMessage.Text = $"<div class='alert alert-danger'>Error: {ex.Message}</div>";
                        }
                    }
                }
            }
        }

        protected void gvCategories_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int categoryId = (int)e.Keys["id"];

            // Check if there are any products associated with this category
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM products WHERE category_id = @category_id", conn);
                cmd.Parameters.AddWithValue("@category_id", categoryId);

                int productCount = (int)cmd.ExecuteScalar();

                if (productCount > 0)
                {
                    e.Cancel = true;
                    string script = "alert('This category has associated products and cannot be deleted.');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", script, true);
                }
            }
        }

        protected void ddlCategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            dlProducts.DataBind();
        }

        protected void gvProducts_SelectedIndexChanged(object sender, EventArgs e)
        {
            dvProductDetails.DataBind();
        }
    }
}
