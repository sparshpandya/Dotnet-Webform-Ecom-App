using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StyleSavvy_FinalProject
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] != null)
            {
                Response.Redirect("Default");
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                // fetching the submitted values
                string username = txtUsername.Text.Trim();
                string email = txtEmail.Text.Trim();
                string password = txtPassword.Text.Trim();
                string fullName = txtFullName.Text.Trim();
                string address = txtAddress.Text.Trim();
                string phoneNumber = txtPhoneNumber.Text.Trim();

                // creating a byte array to store salt
                byte[] salt;
                new RNGCryptoServiceProvider().GetBytes(salt = new byte[16]);
                var pbkdf2 = new Rfc2898DeriveBytes(password, salt, 10000);
                byte[] hash = pbkdf2.GetBytes(20);
                byte[] hashBytes = new byte[36];
                Array.Copy(salt, 0, hashBytes, 0, 16);
                Array.Copy(hash, 0, hashBytes, 16, 20);
                string hashedPass = Convert.ToBase64String(hashBytes);

                try
                {
                    // connection string
                    string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                    // new sql connection
                    using (SqlConnection conn = new SqlConnection(connStr))
                    {
                        string query = "INSERT INTO user_info (username, password, email, full_name, address, phone_number) VALUES (@username, @password, @email, @fullName, @address, @phoneNumber)";
                        // new sql command to execute the insert query
                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@username", username);
                            cmd.Parameters.AddWithValue("@password", hashedPass);
                            cmd.Parameters.AddWithValue("@email", email);
                            cmd.Parameters.AddWithValue("@fullName", fullName);
                            cmd.Parameters.AddWithValue("@address", address);
                            cmd.Parameters.AddWithValue("@phoneNumber", phoneNumber);

                            conn.Open();
                            // executing the query
                            cmd.ExecuteNonQuery();
                        }
                    }

                    // displaying success message
                    string script = "alert('Registration Successful!');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", script, true);

                    Response.Redirect("Login");
                }
                catch (Exception ex)
                {
                    string script = $"alert('Oops! Registration Error has occurred! Error: {ex.Message}');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", script, true);
                }
            }
        }
    }
}