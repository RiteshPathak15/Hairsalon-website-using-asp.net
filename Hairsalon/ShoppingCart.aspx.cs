using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI.WebControls;

namespace Hairsalon
{
    public partial class ShoppingCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCartItems();
            }
        }

        private void LoadCartItems()
        {
            var cart = (List<CartItem>)Session["Cart"] ?? new List<CartItem>();
            CartRepeater.DataSource = cart;
            CartRepeater.DataBind();
            UpdateCartTotals(cart);
        }

        private void UpdateCartTotals(List<CartItem> cartItems)
        {
            decimal subtotal = cartItems.Sum(item => item.Total);
            SubtotalLabel.Text = subtotal.ToString("C");
            TotalLabel.Text = subtotal.ToString("C"); // Assuming free shipping for simplicity
        }

        protected void UpdateQuantity_Click(object sender, EventArgs e)
        {
            var button = (Button)sender;
            var productId = Convert.ToInt32(button.CommandArgument);

            RepeaterItem item = (RepeaterItem)button.NamingContainer;
            var quantityTextBox = item.FindControl("QuantityTextBox") as TextBox;

            if (quantityTextBox != null)
            {
                int newQuantity;
                if (int.TryParse(quantityTextBox.Text, out newQuantity) && newQuantity > 0)
                {
                    var cart = (List<CartItem>)Session["Cart"] ?? new List<CartItem>();
                    var cartItem = cart.FirstOrDefault(i => i.ProductID == productId);

                    if (cartItem != null)
                    {
                        cartItem.Quantity = newQuantity;
                        cartItem.Total = cartItem.Price * newQuantity;
                        Session["Cart"] = cart;
                        LoadCartItems();
                    }
                }
            }
        }

        protected void RemoveFromCart_Click(object sender, EventArgs e)
        {
            var button = (Button)sender;
            var productId = Convert.ToInt32(button.CommandArgument);

            var cart = (List<CartItem>)Session["Cart"] ?? new List<CartItem>();
            var cartItem = cart.FirstOrDefault(i => i.ProductID == productId);

            if (cartItem != null)
            {
                cart.Remove(cartItem);
                Session["Cart"] = cart;
                LoadCartItems();
            }
        }

        protected void CheckoutButton_Click(object sender, EventArgs e)
        {
            // Retrieve the cart from the session
            var cart = (List<CartItem>)Session["Cart"] ?? new List<CartItem>();

            // Check if the cart is empty
            if (cart.Count == 0)
            {
                // Handle empty cart scenario (e.g., show a message)
                Response.Write("Your cart is empty.");
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["hair_salon"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Insert each item into the Orders table
                foreach (var item in cart)
                {
                    string query = "INSERT INTO Orders (ProductID, ProductName, Price, Quantity, Total, OrderDate) VALUES (@ProductID, @ProductName, @Price, @Quantity, @Total, @OrderDate)";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@ProductID", item.ProductID);
                    cmd.Parameters.AddWithValue("@ProductName", item.ProductName);
                    cmd.Parameters.AddWithValue("@Price", item.Price);
                    cmd.Parameters.AddWithValue("@Quantity", item.Quantity);
                    cmd.Parameters.AddWithValue("@Total", item.Total);
                    cmd.Parameters.AddWithValue("@OrderDate", DateTime.Now);

                    cmd.ExecuteNonQuery();
                }

                // Optionally, you can clear the cart from the session
                Session["Cart"] = new List<CartItem>();
            }

            // Redirect to a confirmation page or thank you page
            Response.Redirect("ManageOrders.aspx");
        }
    }
}
