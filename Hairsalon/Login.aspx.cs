using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Hairsalon
{
    public partial class Login : System.Web.UI.Page
    {
        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string username = Username.Text.Trim();
            string password = Password.Text.Trim();

            if (IsUserRegistered(username))
            {
                if (AuthenticateUser(username, password))
                {
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    ErrorMessage.Text = "Invalid username or password.";
                }
            }
            else
            {
                ErrorMessage.Text = "User is not registered. Please register first.";
            }
        }

        private bool IsUserRegistered(string username)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["hair_salon"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM Users WHERE Username = @Username";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    conn.Open();
                    int count = (int)cmd.ExecuteScalar();
                    return count > 0;
                }
            }
        }

        private bool AuthenticateUser(string username, string password)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["hair_salon"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM Users WHERE Username = @Username AND Password = @Password";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password); // Ensure to hash passwords in production
                    conn.Open();
                    int count = (int)cmd.ExecuteScalar();
                    return count > 0;
                }
            }
        }
    }
}
