<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.food.model.User, com.food.model.Restaurant, java.util.List" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Online Food Application</title>
    <link rel="stylesheet" href="home.css">
</head>
<body>
<header>
    <h1>Welcome to Online Food Application</h1>
</header>

<nav>
<%
    HttpSession se = request.getSession();
    User user = (User)se.getAttribute("user");
    if (user != null) {
%>
        <a href="#">Home</a>
        <a href="#">Cart</a>
        <a href="#">Order History</a>
        <a href="logout.jsp">Logout</a>
<%
    } else {
%>
        <a href="login.jsp">Login</a>
        <a href="register.jsp">Register</a>
<%
    }
%>
    <p><a href="Home">Back to Home</a></p>
    <p><a href="LoginServlet">Back to Home</a></p>
</nav>

<div class="content">
    <div class="welcome-message">
        <h2>Welcome to our online food application!</h2>
        <p>Explore a variety of cuisines and place your orders seamlessly.</p>
    </div>
</div>
<div class="restaurant-list">
    <h2>Available Restaurants:</h2>
    <ul>
        <c:forEach var="restaurant" items="${restaurants}">
            <li>
                <h3>${restaurant.name}</h3>
                <p>Phone Number: ${restaurant.phoneNumber}</p>
                <p>Address: ${restaurant.address}</p>
                <p>Rating: ${restaurant.rating}</p>
                <p>Cuisine Type: ${restaurant.cuisineType}</p>
                <!-- Add more details as needed -->
            </li>
        </c:forEach>
        
    </ul>
</div>
    
    <!-- Form tag with action attribute -->
    <form action="Home" method="post">
        <!-- Your form elements go here -->
        <input type="submit" value="Submit">
    </form>

</body>
</html>