using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Hairsalon
{

    public partial class ManageOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOrders();
            }
        }

        private void LoadOrders()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["hair_salon"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Orders"; // Replace with your actual query to fetch orders
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                OrdersRepeater.DataSource = dt;
                OrdersRepeater.DataBind();
            }
        }

        protected void CancelOrder_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int orderId = Convert.ToInt32(btn.CommandArgument);

            string connectionString = ConfigurationManager.ConnectionStrings["hair_salon"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Orders WHERE OrderId = @OrderId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@OrderId", orderId);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            LoadOrders(); // Reload orders after deletion
        }

        protected void ConfirmBooking_Click(object sender, EventArgs e)
        {
            // Implement booking confirmation logic here
            // For example, update the order status in your database
        }
    }
}