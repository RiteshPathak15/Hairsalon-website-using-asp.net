using System;
using System.Data.SqlClient;
using System.Configuration;

namespace Hairsalon
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Any code to execute on the first load of the page
            if (!IsPostBack)
            {
                // Initialization code here
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            // Validate user credentials
            if (IsValidUser())
            {
                // Redirect to another page upon successful login
                Response.Redirect("HomePage.aspx");
            }
            else
            {
                // Display an error message
                Response.Write("<script>alert('Invalid username or password');</script>");
            }
        }

        private bool IsValidUser()
        {
            bool isValid = false;
            string connString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                try
                {
                    conn.Open();
                    string query = "SELECT COUNT(*) FROM Users WHERE Username = @Username AND Password = @Password";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Username", Username.Text.Trim());
                        cmd.Parameters.AddWithValue("@Password", Password.Text.Trim());

                        int count = (int)cmd.ExecuteScalar();
                        isValid = (count > 0);
                    }
                }
                catch (Exception ex)
                {
                    // Handle any errors that occurred during the login process
                    Response.Write("<script>alert('An error occurred: " + ex.Message + "');</script>");
                }
            }

            return isValid;
        }
    }
}
