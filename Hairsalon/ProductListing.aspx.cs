using System;
using System.Collections.Generic;

namespace Hairsalon
{
    public partial class ProductListing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindServices();
                BindProducts();
            }
        }

        private void BindServices()
        {
            // Example data, replace with database call
            var services = new List<Service>
            {
                new Service { Title = "Haircut", Description = "Professional haircut services.", ImageUrl = "https://cdn-ikppclh.nitrocdn.com/CueiRbtmHDfiLNmOiFYzPbGQWoFHcYmP/assets/images/optimized/rev-5c48b65/www.bodycraft.co.in/wp-content/uploads/beautiful-woman-getting-her-hair-cut-home-by-hairstylist-scaled.jpg" },
                new Service { Title = "Shaving", Description = "Close and clean shave.", ImageUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTt7RmE1Jmy6BUkuhwovS9efR58wMXiKof_Jw&s" },
                new Service { Title = "Facial", Description = "Relaxing facial treatments.", ImageUrl = "https://media.istockphoto.com/id/1399469980/photo/close-up-portrait-of-anorganic-facial-mask-application-at-spa-salon-facial-treatment-skin.jpg?s=612x612&w=0&k=20&c=ZvZi_bdGLicsykUtlrHgQe70ftZzd_xPKvq2vzfOyV0=" }
            };

            ServiceRepeater.DataSource = services;
            ServiceRepeater.DataBind();
        }

        private void BindProducts()
        {
            // Example data, replace with database call
            var products = new List<Product>
            {
                new Product { ProductName = "Shampoo", ProductDescription = "High-quality shampoo for daily use.", Price = 15.99m, ImageUrl = "https://www.thriveco.in/cdn/shop/files/COMBO1.jpg?v=1695724640" },
                new Product { ProductName = "Conditioner", ProductDescription = "Moisturizing conditioner to keep your hair smooth.", Price = 12.99m, ImageUrl = "https://images-cdn.ubuy.co.in/639d62cda9b26763bf33484b-tresemme-conditioner-for-dry-hair.jpg" },
                new Product { ProductName = "Beard Oil", ProductDescription = "Premium beard oil to maintain and nourish your beard.", Price = 9.99m, ImageUrl = "https://rukminim2.flixcart.com/image/850/1000/xif0q/hair-oil/l/s/u/32-ultra-bread-growth-oil-for-men-nioon-original-imaggey24hjxnyfv.jpeg?q=90&crop=false" }
            };

            ProductRepeater.DataSource = products;
            ProductRepeater.DataBind();
        }

    }

    public class Service
    {
        public string Title { get; set; }
        public string Description { get; set; }
        public string ImageUrl { get; set; }
    }

    public class Product
    {
        public string ProductName { get; set; }
        public string ProductDescription { get; set; }
        public decimal Price { get; set; }
        public string ImageUrl { get; set; }
    }
}
