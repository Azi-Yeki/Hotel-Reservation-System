<%-- 
    Document   : login
    Created on : 20 Jun 2024, 11:02:15
    Author     : Mrqts
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background-image: url('https://i.pinimg.com/474x/07/44/9e/07449e7824daffda0b424c4f9c37a370.jpg');
            background-size: cover; 
            background-repeat: no-repeat; 
            height: 100vh; 
            display: flex;
            justify-content: center; 
            align-items: center; 
            text-align: center;
            color: white;
        }
        
        form {
            background: rgba(0, 0, 0, 0.3); /* Example of semi-transparent background */
            padding: 20px;
            border-radius: 8px;
            width: 300px;
        }
        form input[type="text"],
        form input[type="password"],
        form input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
    </style>
</head>
    <body>
        <h1>sign in</h1>
        <% String msg = (String) request.getAttribute("message");
           if (msg != null) { %>
            <%=msg%>
        <% } %>
        <form method="post" action="GuestController">
            <label for="email">email:</label>
            <input id="email" name="email" type="text" required><br>
            <label for="password">password:</label>
            <input id="password" name="password" type="password" required><br>
            <input name="submit" type="submit" value="Login">
        </form>
    </body>
</html>

