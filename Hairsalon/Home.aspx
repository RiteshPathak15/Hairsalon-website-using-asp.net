<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Hairsalon.Home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Juice Hair Salon</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
            color: #333;
        }

        /* Navigation Header */
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

        /* Banner Section */
        .banner {
            width: 100%;
            background: url('images/Services-Mens.jpg') no-repeat center center/cover;
            height: 400px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
            font-size: 3em;
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.6);
        }

        /* About Section */
        .about {
            max-width: 1200px;
            margin: 40px auto;
            padding: 20px;
            text-align: center;
        }

            .about h2 {
                font-size: 2.5em;
                margin-bottom: 20px;
                color: #ff9800;
            }

            .about p {
                font-size: 1.2em;
                color: #666;
                line-height: 1.6;
            }

        /* Services Section */
        .services {
            max-width: 1200px;
            margin: 40px auto;
            padding: 20px;
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
            justify-content: center;
        }

        .service-card {
            flex: 1 1 calc(33.333% - 40px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
            text-align: center;
            background-color: #fff;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            margin-bottom: 20px;
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

        /* Testimonials Section */
        .testimonials {
            background-color: #fff3e0;
            padding: 40px 20px;
            text-align: center;
        }

            .testimonials h2 {
                font-size: 2.5em;
                margin-bottom: 20px;
                color: #ff9800;
            }

        .testimonial {
            max-width: 800px;
            margin: 20px auto;
            font-size: 1.2em;
            color: #666;
            line-height: 1.6;
            text-align: left;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Contact Section */
        .contact {
            max-width: 1200px;
            margin: 40px auto;
            padding: 20px;
            text-align: center;
        }

            .contact h2 {
                font-size: 2.5em;
                margin-bottom: 20px;
                color: #ff9800;
            }

        .contact-form {
            max-width: 600px;
            margin: 0 auto;
            text-align: left;
        }

            .contact-form label {
                font-weight: bold;
                display: block;
                margin-bottom: 10px;
                color: #333;
            }

            .contact-form input, .contact-form textarea {
                width: 100%;
                padding: 10px;
                margin-bottom: 20px;
                border-radius: 5px;
                border: 1px solid #ccc;
            }

            .contact-form button {
                background-color: #ff9800;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

                .contact-form button:hover {
                    background-color: #e67e22;
                }

        /* Footer */
        .footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 20px;
            margin-top: 40px;
        }

            .footer p {
                margin: 0;
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
                <a href="#about">About Us</a>
                <a href="#contact">Contact Us</a>
                <a href="Login.aspx">Sign Up</a>
                <a href="Registration.aspx">Sign In</a>
            </div>
        </div>

        <!-- Banner Section -->
        <div class="banner">
            Welcome to Juice Hair Salon
        </div>

        <!-- About Section -->
        <div id="about" class="about">
            <h2>About Us</h2>
            <p>
                At Juice Hair Salon, we believe in providing the best quality services to our clients.
                Our team of professionals is dedicated to making you look and feel your best. 
                From haircuts to facials, we offer a range of services tailored to your needs.
            </p>
        </div>

        <!-- Testimonials Section -->
        <div class="testimonials">
            <h2>What Our Clients Say</h2>
            <div class="testimonial">
                "I had the best experience at Juice Hair Salon. The staff is friendly, and the service is top-notch!"
                <br />
                - Sarah W.
            </div>
            <div class="testimonial">
                "My go-to place for all my grooming needs. Highly recommend it!"
                <br />
                - John D.
            </div>
        </div>

        <!-- Contact Section -->
        <div id="contact" class="contact">
            <h2>Contact Us</h2>
            <div class="contact-form">
            <h2>Contact Us</h2>

            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required />

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required />

            <label for="message">Message:</label>
            <textarea id="message" name="message" rows="5" required></textarea>

            <asp:Button ID="submitButton" runat="server" Text="Send Message" OnClick="SubmitForm_Click" />
        </div>
        <asp:Label ID="StatusLabel" runat="server" Text="" CssClass="status-message"></asp:Label>
        </div>

        <!-- Footer -->
        <div class="footer">
            <p>&copy; 2024 Juice Hair Salon. All rights reserved.</p>
        </div>
    </form>
</body>
</html>
