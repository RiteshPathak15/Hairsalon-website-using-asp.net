<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShoppingCart.aspx.cs" Inherits="Hairsalon.ShoppingCart" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Shopping Cart</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #fff;
            margin: 0;
            padding: 0;
            color: #333;
        }
        /* Navigation Header */
        .navbar {
            background-color: #fff;
            border-bottom: 1px solid #ddd;
            padding: 10px 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

            .navbar a {
                text-decoration: none;
                color: #333;
                font-weight: bold;
                padding: 0 20px;
            }

            .navbar .logo {
                font-size: 1.5em;
                font-weight: bold;
                color: #000;
            }

            .navbar .menu {
                display: flex;
                gap: 15px;
            }

        .cart-container {
            max-width: 1200px;
            margin: 50px auto;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            border-radius: 10px;
        }

        h2 {
            text-align: center;
            font-size: 2em;
            margin-bottom: 30px;
            color: #e67e22;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

            table th, table td {
                padding: 15px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            table th {
                background-color: #f8f8f8;
            }

        .cart-total, .cart-summary {
            text-align: right;
        }

        .cart-summary {
            margin-top: 20px;
            font-size: 1.2em;
            font-weight: bold;
        }

        .apply-coupon {
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

            .apply-coupon input[type="text"] {
                width: 70%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
            }

            .apply-coupon button {
                padding: 10px 20px;
                background-color: #e67e22;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

                .apply-coupon button:hover {
                    background-color: #d35400;
                }

        .checkout-button {
            width: 100%;
            padding: 15px;
            background-color: #e67e22;
            color: #fff;
            text-align: center;
            font-size: 1.2em;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

            .checkout-button:hover {
                background-color: #d35400;
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

        <div class="cart-container">
            <h2>Shopping Cart</h2>
            <table>
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                        <th>Remove</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="CartRepeater" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("ProductName") %></td>
                                <td><%# Eval("Price", "{0:C}") %></td>
                                <td>
                                    <asp:TextBox ID="QuantityTextBox" runat="server" Text='<%# Eval("Quantity") %>' CssClass="quantity-box"></asp:TextBox>
                                    <asp:Button ID="UpdateQuantityButton" runat="server" Text="Update" CommandArgument='<%# Eval("ProductID") %>' OnClick="UpdateQuantity_Click" CssClass="update-quantity-button" />
                                </td>
                                <td><%# Eval("Total", "{0:C}") %></td>
                                <td>
                                    <asp:Button ID="RemoveButton" runat="server" Text="Remove" CommandArgument='<%# Eval("ProductID") %>' OnClick="RemoveFromCart_Click" CssClass="remove-button" />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>

            <div class="cart-summary">
                <p>Subtotal: <asp:Label ID="SubtotalLabel" runat="server" Text="₹0.00" /></p>
                <p>Shipping: Free Shipping</p>
                <p>Total: <asp:Label ID="TotalLabel" runat="server" Text="₹0.00" /></p>
            </div>
               <div class="checkout">
            <asp:Button ID="CheckoutButton" runat="server" Text="Checkout" OnClick="CheckoutButton_Click" CssClass="checkout-button"/>
        </div>
        </div>
    </form>
</body>
</html>