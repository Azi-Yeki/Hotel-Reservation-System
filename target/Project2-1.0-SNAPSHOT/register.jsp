<%-- 
    Document   : register
    Created on : 26 Jun 2024, 19:40:09
    Author     : Mrqts
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            form input[type="email"],
            form input[type="phone"],
            form input[type="tel"],
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
        <div class="registration-section">
            <h1>register now</h1> 
            <% String msg = (String) request.getAttribute("message");
                if (msg != null) { %>
                 <%=msg%>
             <% } %>
            <form id="registration-form" method="post" action="GuestController">
                <label for="name">name:</label><br>
                <input type="text" id="name" name="name" required><br>

                <label for="surname">surname:</label><br>
                <input type="text" id="surname" name="surname" required><br>

                <label for="email">email address:</label><br>
                <input type="email" id="email" name="email" required><br>

                <label for="phone">phone number:</label><br>
                <input type="tel" id="phone" name="phone" required><br>

                <label for="password">password:</label><br>
                <input type="password" id="password" name="password" required><br><br>

                <input name="submit" type="submit" value="register">
                <h5>already a member? <a href="login.jsp">log in</a></h5>
            </form> 
        </div>  
    </body>
</html>
