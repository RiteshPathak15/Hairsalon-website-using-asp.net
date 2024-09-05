using System;
using System.Data.SqlClient;
using System.Configuration;

namespace Hairsalon
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the page is being loaded for the first time, not on postback
            if (!IsPostBack)
            {
                // Any code to execute on the first load of the page
            }
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            // Validate the user input
            if (IsValidInput())
            {
                // Register the user in the database
                RegisterUser();
            }
        }

        private bool IsValidInput()
        {
            // Check if all fields are filled
            if (string.IsNullOrEmpty(Username.Text.Trim()) ||
                string.IsNullOrEmpty(Email.Text.Trim()) ||
                string.IsNullOrEmpty(Gender.SelectedValue) ||
                string.IsNullOrEmpty(Password.Text.Trim()) ||
                string.IsNullOrEmpty(ConfirmPassword.Text.Trim()))
            {
                // Display an error message (you can replace this with your own error handling)
                Response.Write("<script>alert('All fields are required');</script>");
                return false;
            }

            // Check if passwords match
            if (Password.Text != ConfirmPassword.Text)
            {
                // Display an error message
                Response.Write("<script>alert('Passwords do not match');</script>");
                return false;
            }

            // Add additional validation if needed (e.g., email format validation, password strength, etc.)

            return true;
        }

        private void RegisterUser()
        {
            // Example connection string (make sure to adjust according to your database)
            string connString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                try
                {
                    conn.Open();

                    // SQL query to insert user data
                    string query = "INSERT INTO Users (Username, Email, Gender, Password) VALUES (@Username, @Email, @Gender, @Password)";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        // Parameters to prevent SQL injection
                        cmd.Parameters.AddWithValue("@Username", Username.Text.Trim());
                        cmd.Parameters.AddWithValue("@Email", Email.Text.Trim());
                        cmd.Parameters.AddWithValue("@Gender", Gender.SelectedValue);
                        cmd.Parameters.AddWithValue("@Password", Password.Text.Trim());

                        // Execute the query
                        cmd.ExecuteNonQuery();
                    }

                    // Display success message or redirect to login page
                    Response.Write("<script>alert('Registration successful! Please login.');</script>");
                    Response.Redirect("Login.aspx");
                }
                catch (Exception ex)
                {
                    // Handle any errors that occurred during the registration process
                    Response.Write("<script>alert('An error occurred: " + ex.Message + "');</script>");
                }
            }
        }
    }
}
