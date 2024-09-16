<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProductListing.aspx.cs" Inherits="Hairsalon.ProductListing" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Beauty Services</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .navbar {
            background-color: #fff;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
        }

        .navbar a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
            padding: 0 20px;
            transition: color 0.3s ease;
        }

        .navbar a:hover {
            color: #ff9800;
        }

        .navbar .logo {
            font-size: 1.8em;
            font-weight: bold;
            color: #ff9800;
        }

        .banner {
            width: 100%;
            background: url('images/Services-Mens.jpg') no-repeat center center/cover;
            height: 300px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
            font-size: 2.8em;
            font-weight: bold;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .services {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }

        .service-card {
            flex: 1 1 calc(33.333% - 40px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
            text-align: center;
            background-color: #fff;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .service-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
        }

        .service-card img {
            width: 100%;
            height: auto;
        }

        .service-card h3 {
            margin: 15px 0;
            font-size: 1.5em;
            color: #333;
        }

        .service-card p {
            margin: 0 15px 15px;
            color: #666;
        }

        .product-section {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
        }

        .product-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
            background-color: #fff;
            margin-bottom: 20px;
            padding: 15px;
        }

        .product-image {
            max-width: 200px;
            height: 150px;
            border-radius: 10px;
            margin-right: 20px;
        }

        .product-info {
            flex-grow: 1;
            text-align: left;
        }

        .product-info h3 {
            font-size: 1.5em;
            color: #333;
            margin-bottom: 10px;
        }

        .product-info p {
            color: #666;
            margin-bottom: 10px;
        }

        .price {
            font-weight: bold;
            color: #e67e22;
            margin-bottom: 10px;
        }

        .slot-selection {
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .slot-selection label {
            margin-right: 10px;
            font-weight: bold;
        }

        .slot-selection select {
            padding: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .add-to-cart-button, .book-slot-button {
            background-color: #e67e22;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 10px;
            transition: background-color 0.3s ease;
        }

        .add-to-cart-button:hover, .book-slot-button:hover {
            background-color: #d35400;
        }
    </style>
    <script type="text/javascript">
        function bookSlot(productName, itemIndex) {
            const timeSlotElement = document.getElementById('timeSlot' + itemIndex);
            const selectedTimeSlot = timeSlotElement.value;
            alert('Booking ' + productName + ' at ' + selectedTimeSlot);

            // Redirect to the ShoppingCart.aspx page
            window.location.href = 'ShoppingCart.aspx?product=' + encodeURIComponent(productName) + '&timeSlot=' + encodeURIComponent(selectedTimeSlot);
        }

        function addToCart(productName) {
            alert('Added ' + productName + ' to cart.');
            // You can add your cart logic here
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navigation Header -->
        <div class="navbar">
            <div class="logo">Juice</div>
            <div class="menu">
                <a href="Home.aspx">Home</a>
                <a href="ProductListing.aspx">Services</a>
                <a href="ManageOrders.aspx">Order</a>
                <a href="ShoppingCart.aspx">Checkout</a>
                <a href="Home.aspx/#about">About Us</a>
                <a href="Home.aspx/#contact">Contact Us</a>
                <a href="Login.aspx">Sign Up</a>
                <a href="Registration.aspx">Sign In</a>
            </div>
        </div>

        <!-- Banner Section -->
        <div class="banner">
            Services
        </div>

        <!-- Services Section -->
        <div class="services">
            <asp:Repeater ID="ServiceRepeater" runat="server">
                <ItemTemplate>
                    <div class="service-card">
                        <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Title") %>' />
                        <h3><%# Eval("Title") %></h3>
                        <p><%# Eval("Description") %></p>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <!-- Products Section -->
        <div class="product-section">
            <h2>Products & Services</h2>
            <asp:Repeater ID="ProductRepeater" runat="server">
                <ItemTemplate>
                    <div class="product-item">
                        <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("ProductName") %>' class="product-image" />
                        <div class="product-info">
                            <h3><%# Eval("ProductName") %></h3>
                            <p class="description"><%# Eval("ProductDescription") %></p>
                            <p class="price">Price: <%# Eval("Price", "{0:C}") %></p>
                            <div class="slot-selection">
                                <label for="timeSlot<%# Container.ItemIndex %>">Select Time Slot:</label>
                                <asp:DropDownList ID="DropDownList1" runat="server">
                                    <asp:ListItem Text="11:00 AM" Value="11:00 AM" />
                                    <asp:ListItem Text="1:00 PM" Value="1:00 PM" />
                                    <asp:ListItem Text="3:00 PM" Value="3:00 PM" />
                                    <asp:ListItem Text="5:00 PM" Value="5:00 PM" />
                                    <asp:ListItem Text="7:00 PM" Value="7:00 PM" />
                                    <asp:ListItem Text="9:00 PM" Value="9:00 PM" />
                                </asp:DropDownList>
                            </div>
                            <asp:Button ID="AddToCartButton" runat="server" Text="Add to Cart" CommandArgument='<%# Eval("ProductID") %>' OnClick="AddToCart_Click" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>
