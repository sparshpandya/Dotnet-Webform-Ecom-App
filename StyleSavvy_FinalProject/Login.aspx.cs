using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI;

namespace StyleSavvy_FinalProject
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] != null)
            {
                Response.Redirect("Default");
            }
        }

        private void validateUser()
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            string showMsg = msg.Text;

            bool isValidUser = false;

            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "SELECT password FROM user_info WHERE email = @Email";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);

                        conn.Open();
                        string storedHash = (string)cmd.ExecuteScalar();

                        if (!string.IsNullOrEmpty(storedHash))
                        {
                            // Extract the bytes
                            byte[] hashBytes = Convert.FromBase64String(storedHash);

                            // Get the salt
                            byte[] salt = new byte[16];
                            Array.Copy(hashBytes, 0, salt, 0, 16);

                            // Hash the entered password with the stored salt
                            var pbkdf2 = new Rfc2898DeriveBytes(password, salt, 10000);
                            byte[] hash = pbkdf2.GetBytes(20);

                            // Compare the results
                            for (int i = 0; i < 20; i++)
                            {
                                if (hashBytes[i + 16] != hash[i])
                                {
                                    throw new UnauthorizedAccessException();
                                }
                            }

                            isValidUser = true;
                        }

                        conn.Close();
                    }
                }
            }
            catch (UnauthorizedAccessException)
            {
                msg.Text = "Email or Password is Incorrect!";
            }
            catch (Exception ex)
            {
                string script = $"alert('Oops! An error occurred: {ex.Message}!');";
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", script, true);
            }

            if (isValidUser)
            {
                if (email == "admin@gmail.com")
                {
                    Session["userName"] = "admin";
                    Response.Redirect("Admin");
                }
                else
                {
                    Session["userName"] = "user";
                    Response.Redirect("Default");
                }
            }
            else
            {
                msg.Text = "Email or Password is Incorrect!";
            }
        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                validateUser();
            }
        }
    }
}
