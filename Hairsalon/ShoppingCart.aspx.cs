using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace Hairsalon
{
    public partial class ShoppingCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load the cart items from the session or database
                LoadCartItems();
            }
        }

        private void LoadCartItems()
        {
            // Sample data; replace with actual cart retrieval logic
            var cartItems = new List<CartItem>
            {
                new CartItem { ProductID = 1, ProductName = "Shampoo", Price = 2650, Quantity = 1 },
                new CartItem { ProductID = 2, ProductName = "Conditioner", Price = 2650, Quantity = 1 }
            };

            CartRepeater.DataSource = cartItems;
            CartRepeater.DataBind();

            // Update the cart totals
            UpdateCartTotals(cartItems);
        }

        private void UpdateCartTotals(List<CartItem> cartItems)
        {
            decimal subtotal = 0;
            foreach (var item in cartItems)
            {
                subtotal += item.Price * item.Quantity;
            }

            SubtotalLabel.Text = subtotal.ToString("C");
            TotalLabel.Text = subtotal.ToString("C"); // Assuming free shipping for simplicity
        }

        protected void UpdateQuantity_Click(object sender, EventArgs e)
        {
            var button = (Button)sender;
            var productId = Convert.ToInt32(button.CommandArgument);

            // Find the RepeaterItem where the button was clicked
            RepeaterItem item = (RepeaterItem)button.NamingContainer;

            // Find the TextBox within the RepeaterItem
            var quantityTextBox = item.FindControl("QuantityTextBox") as TextBox;

            if (quantityTextBox != null)
            {
                int newQuantity;
                if (int.TryParse(quantityTextBox.Text, out newQuantity))
                {
                    // Update the quantity in the cart (in session or database)
                    // ...

                    // Reload the cart items to reflect the changes
                    LoadCartItems();
                }
            }
        }


        protected void RemoveFromCart_Click(object sender, EventArgs e)
        {
            var button = (Button)sender;
            var productId = Convert.ToInt32(button.CommandArgument);

            // Remove item from cart (in session or database)
            // ...

            // Reload the cart items to reflect the changes
            LoadCartItems();
        }

        protected void ApplyCoupon_Click(object sender, EventArgs e)
        {
            var couponCode = CouponTextBox.Text.Trim();
            // Validate and apply coupon
            // ...

            // Reload the cart items to reflect any discount
            LoadCartItems();
        }

        protected void Checkout_Click(object sender, EventArgs e)
        {
            // Proceed to checkout
            // Redirect to the checkout page
            Response.Redirect("Checkout.aspx");
        }
    }

    public class CartItem
    {
        public int ProductID { get; set; }
        public string ProductName { get; set; }
        public decimal Price { get; set; }
        public int Quantity { get; set; }
        public decimal Total => Price * Quantity;
    }
}
