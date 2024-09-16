<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageOrders.aspx.cs" Inherits="Hairsalon.ManageOrders" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Orders</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f3f3f3;
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

        .order-container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .order-container h2 {
            text-align: center;
            color: #444;
            margin-bottom: 30px;
        }

        .order-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .order-table th, .order-table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .order-table th {
            background-color: #f7f7f7;
            font-weight: bold;
            color: #555;
        }

        .order-table tr:hover {
            background-color: #f1f1f1;
        }

        .cancel-button {
            background-color: #f44336;
            color: #fff;
            padding: 8px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .cancel-button:hover {
            background-color: #d32f2f;
        }

        .cancel-button:disabled {
            background-color: grey;
            cursor: not-allowed;
        }

        .confirm-button {
            background-color: #4CAF50;
            color: #fff;
            padding: 8px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 20px;
        }

        .confirm-button:hover {
            background-color: #45a049;
        }
    </style>
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
            Orders
        </div>
        <div>
            <h2>Your Orders</h2>
            <asp:Repeater ID="OrdersRepeater" runat="server">
                <HeaderTemplate>
                    <table class="order-table">
                        <tr>
                            <th>Product Name</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Actions</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("ProductName") %></td>
                        <td><%# Eval("Quantity") %></td>
                        <td><%# Eval("Price", "{0:C}") %></td>
                        <td>
                            <asp:Button ID="CancelButton" runat="server" Text="Cancel"
                                CssClass="cancel-button" CommandArgument='<%# Eval("OrderId") %>'
                                OnClick="CancelOrder_Click" />
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>

        <!-- Confirm Booking Button -->
        <div style="text-align: center; margin-top: 20px;">
            <asp:Button ID="ConfirmBookingButton" runat="server" Text="Confirm Booking"
                CssClass="confirm-button" OnClientClick="return showConfirmationAlert();" OnClick="ConfirmBooking_Click" />
        </div>

        <script type="text/javascript">
            function showConfirmationAlert() {
                return confirm("Are you sure you want to confirm the booking?");
            }
        </script>
    </form>
</body>
</html>
