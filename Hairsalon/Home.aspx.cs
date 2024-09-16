using System;
using System.Data.SqlClient;
using System.Configuration;

namespace Hairsalon
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitForm_Click(object sender, EventArgs e)
        {
            string name = Request.Form["name"];
            string email = Request.Form["email"];
            string message = Request.Form["message"];
            DateTime submittedOn = DateTime.Now;

            // Check if all fields are filled
            if (!string.IsNullOrEmpty(name) && !string.IsNullOrEmpty(email) && !string.IsNullOrEmpty(message))
            {
                try
                {
                    // Connection string (Update this with your own connection string)
                    string connectionString = ConfigurationManager.ConnectionStrings["hair_salon"].ConnectionString;

                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        conn.Open();
                        string insertQuery = "INSERT INTO dbo.Contacts (Name, Email, Message, SubmittedOn) VALUES (@Name, @Email, @Message, @SubmittedOn)";

                        using (SqlCommand cmd = new SqlCommand(insertQuery, conn))
                        {
                            cmd.Parameters.AddWithValue("@Name", name);
                            cmd.Parameters.AddWithValue("@Email", email);
                            cmd.Parameters.AddWithValue("@Message", message);
                            cmd.Parameters.AddWithValue("@SubmittedOn", submittedOn);

                            int rowsAffected = cmd.ExecuteNonQuery();

                            if (rowsAffected > 0)
                            {
                                StatusLabel.Text = "Your message has been sent successfully!";
                            }
                            else
                            {
                                StatusLabel.Text = "An error occurred. Please try again.";
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    StatusLabel.Text = "An error occurred: " + ex.Message;
                }
            }
            else
            {
                StatusLabel.Text = "Please fill out all fields.";
            }
        }
    } 

}

