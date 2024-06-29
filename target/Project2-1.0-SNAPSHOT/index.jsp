<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Start Page</title>
    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: 'Arial', sans-serif;
            background-image: url('https://i.pinimg.com/564x/1d/51/88/1d5188e87cedb61ecb3d89bb943c5b06.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .navbar {
            background-color: rgba(0, 0, 0, 0.2);
            padding: 10px 0;
            border-radius: 1px;
            width: 100%;
            display: flex;
            justify-content: flex-end; /* Align items to the right */
        }

        .navbar a {
            color: #fff;
            text-decoration: none;
            padding: 10px 15px;
            font-size: 18px;
            margin-left: 10px; /* Adjust spacing between links */
        }

        .navbar a:hover {
            background-color: #555;
        }

        .content {
            text-align: center;
            color: white;
            padding: 20px;
            background-color: rgba(0, 0, 0, 0.5);
            border-radius: 8px;
            max-width: 400px;
            width: 100%;
        }

        .index {
            margin-bottom: 20px;
            font-size: 36px;
            font-weight: bold;
        }

        .sub-heading {
            margin-bottom: 30px;
            font-size: 24px;
        }

        .form {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 20px;
            border-radius: 8px;
            max-width: 300px;
            margin: auto;
        }

        .form h6 {
            color: #ccc;
            margin-bottom: 10px;
        }

        .form button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: block;
            margin: 10px auto;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        .form button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="content">
        <div class="navbar">
            <a href="viewRooms.jsp">View Rooms</a> <!-- Added link -->
        </div>
        <div class="index">
            <h2>LUXURY LEISURE HOTEL</h2>
        </div>
        <div class="sub-heading">
            <h3>YOUR EXPERIENCE STARTS NOW.</h3>
        </div>
        <div class="form">
            <h6>Need to create an account?</h6>
            <button onclick="window.location.href = 'register.jsp';">Register</button>
            <h6>Already have an account?</h6>
            <button onclick="window.location.href = 'login.jsp';">Login</button>
        </div>
    </div>
</body>
</html>



