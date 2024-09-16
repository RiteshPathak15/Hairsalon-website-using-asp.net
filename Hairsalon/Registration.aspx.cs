using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Hairsalon
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            string username = Username.Text.Trim();
            string email = Email.Text.Trim();
            string password = Password.Text;
            string confirmPassword = ConfirmPassword.Text;

            if (password == confirmPassword)
            {
                if (!IsUserRegistered(username))
                {
                    SaveUser(username, email, password);
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    ErrorMessage.Text = "Username already exists.";
                }
            }
            else
            {
                ErrorMessage.Text = "Passwords do not match.";
            }
        }

        private bool IsUserRegistered(string username)
        {
            // Check if the user is registered in the database
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

        private void SaveUser(string username, string email, string password)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["hair_salon"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Users (Username, Email, Password) VALUES (@Username, @Email, @Password)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", password); // Ensure to hash passwords in production
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}
