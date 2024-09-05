<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Hairsalon.Registration" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            background-image: url('images/Services-Mens.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            margin: 0;
        }

        .container {
            display: flex; /* Use row direction to place image and form side by side */
            align-items: center;
            justify-content: center;
            width: 800px;
            margin: 50px auto;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-container {
            width: 50%; /* Keep the width for the form container */
            padding: 20px;
        }

        .image-container {
            width: 50%; /* Keep the width for the image container */
            padding: 20px;
            display: flex; /* Center the image vertically */
            justify-content: center;
            align-items: center;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .btn {
            width: 100%;
            padding: 10px;
            background-color: #000;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #333;
        }

        .image-container img {
            width: 100%; /* Make the image responsive */
            height: 90%; /* Ensure it fits within its container */
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- Image Section -->
            <div class="image-container">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpOt48H8ZkV57L-6-14UmlxRGv3KAIvN_tQg&s" alt="Registration Image" />
            </div>

            <!-- Form Section -->
            <div class="form-container">
                <h2>Registration Form</h2>
                <div class="form-group">
                    <label for="Username">Username</label>
                    <asp:TextBox ID="Username" runat="server" CssClass="form-control" />
                </div>
                <div class="form-group">
                    <label for="Email">Email Address</label>
                    <asp:TextBox ID="Email" runat="server" CssClass="form-control" TextMode="Email" />
                </div>
                <div class="form-group">
                    <label for="Gender">Gender</label>
                    <asp:DropDownList ID="Gender" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Select Gender" Value="" />
                        <asp:ListItem Text="Male" Value="Male" />
                        <asp:ListItem Text="Female" Value="Female" />
                        <asp:ListItem Text="Other" Value="Other" />
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label for="Password">Password</label>
                    <asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="Password" />
                </div>
                <div class="form-group">
                    <label for="ConfirmPassword">Confirm Password</label>
                    <asp:TextBox ID="ConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" />
                </div>
                <div class="form-group">
                    <asp:Button ID="RegisterButton" runat="server" Text="Register" CssClass="btn" OnClick="RegisterButton_Click" />
                </div>
                <div class="form-group">
                    <asp:Label ID="Loginlink" runat="server" Text="Already have an account? "></asp:Label>
                    <asp:HyperLink ID="Quicklink" runat="server" Text="Login Page" NavigateUrl="Login.aspx"></asp:HyperLink>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
