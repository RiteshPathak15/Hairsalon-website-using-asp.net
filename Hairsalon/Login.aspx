<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Hairsalon.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
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
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            display: flex;
            width: 800px;
            height: 600px; /* Increased height */
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .left-section {
            flex: 1;
            background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpOt48H8ZkV57L-6-14UmlxRGv3KAIvN_tQg&s');
            background-size: cover;
            background-position: center;
        }

        .right-section {
            flex: 1;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        h2 {
            margin-bottom: 20px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
        }

        .form-group input {
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
            margin-top: 10px;
        }

        .btn:hover {
            background-color: #333;
        }

        .form-container a {
            display: block;
            text-align: center;
            margin-top: 10px;
            color: #007bff;
            text-decoration: none;
        }

        .form-container a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="left-section"></div>
            <div class="right-section">
                <h2>Login Page</h2>
                <div class="form-group">
                    <label for="Username">Username</label>
                    <asp:TextBox ID="Username" runat="server" CssClass="form-control" />
                </div>
                <div class="form-group">
                    <label for="Password">Password</label>
                    <asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="Password" />
                </div>
                <div class="form-group">
                    <asp:Button ID="LoginButton" runat="server" Text="Login" CssClass="btn" OnClick="LoginButton_Click" />
                </div>
                <div class="form-group">
                    <asp:HyperLink ID="RegisterLink" runat="server" Text="Don't have an account? Register here" NavigateUrl="Registration.aspx" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
