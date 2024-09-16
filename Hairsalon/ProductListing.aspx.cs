using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Linq;

namespace Hairsalon
{
    public partial class ProductListing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProducts();
                LoadServices();
            }
        }

        private void LoadProducts()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["hair_salon"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Products";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                ProductRepeater.DataSource = dt;
                ProductRepeater.DataBind();
            }
        }

        private void LoadServices()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["hair_salon"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Services";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                ServiceRepeater.DataSource = dt;
                ServiceRepeater.DataBind(); // Bind services to Repeater
            }
        }

        protected void AddToCart_Click(object sender, EventArgs e)
        {
            var button = (Button)sender;
            var productId = Convert.ToInt32(button.CommandArgument);

            // Retrieve the product details from the database
            string connectionString = ConfigurationManager.ConnectionStrings["hair_salon"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Products WHERE ProductID = @ProductID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@ProductID", productId);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    var product = new CartItem
                    {
                        ProductID = Convert.ToInt32(reader["ProductID"]),
                        ProductName = reader["ProductName"].ToString(),
                        Price = Convert.ToDecimal(reader["Price"]),
                        Quantity = 1, // Default quantity
                        Total = Convert.ToDecimal(reader["Price"]) // Default total
                    };

                    // Retrieve the cart from session
                    var cart = (List<CartItem>)Session["Cart"] ?? new List<CartItem>();

                    // Check if the product is already in the cart
                    var existingItem = cart.FirstOrDefault(item => item.ProductID == product.ProductID);
                    if (existingItem != null)
                    {
                        existingItem.Quantity++;
                        existingItem.Total = existingItem.Price * existingItem.Quantity;
                    }
                    else
                    {
                        cart.Add(product);
                    }

                    // Save the cart back to the session
                    Session["Cart"] = cart;
                }
                conn.Close();
            }

            // Redirect to ShoppingCart.aspx
            Response.Redirect("ShoppingCart.aspx");
        }
    }
}
