<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page import="java.util.List" %>
<%@ page import="com.QuizApplication.model.User" %>
<%@ page import="com.QuizApplication.repository.UserRepository" %>
<%@ page import="com.QuizApplication.exception.BusinessException" %>

<%
    UserRepository userRepository = new UserRepository();
    String loggedInEmail = session.getAttribute("loggedInEmail").toString();
    String username = session.getAttribute("username").toString();

    session.setAttribute("loggedInEmail", loggedInEmail);

    User user = userRepository.getUserByEmail(loggedInEmail);
%>

<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
    <link rel="stylesheet" href="style2.css">
    <title>Update Account Information</title>
</head>
<body>
    <h1>Account Information for <%=username%></h1>

    <form action="updateUser.jsp" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" value="<%= user.getUsername() %>" readonly>
        <br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" value="<%= user.getPassword() %>" readonly>
        <br>
        <label for="phone">Phone Number:</label>
        <input type="text" id="phone" name="phone" value="<%= user.getPhone() %>" readonly>
        <br>
        <label for="email">Email:</label>
        <input type="text" id="email" name="email" value="<%=user.getEmail() %>" readonly>
        <br>
        <br>
        <h1>Update Your account information</h1>
        <label for="newUsername">New Username:</label>
        <input type="text" id="newUsername" name="newUsername" >
        <br>
        <label for="newPassword">New Password:</label>
        <input type="password" id="newPassword" name="newPassword" >
        <br>
        <label for="confirmPassword">Confirm Password:</label>
        <input type="password" id="confirmPassword" name="confirmPassword" >
        <br>
        <label for="newPhone">New Phone Number:</label>
        <input type="text" id="newPhone" name="newPhone" >
        <br>
        <input type="hidden" name="email" value="<%= user.getEmail() %>">
        <input type="submit" value="Update">
    </form>

    <h1>Delete Account Information</h1>
    <form action = "deleteUser.jsp" method = "post">
              <label for="email">Email:</label>
              <input type="text" id="email" name="email" required >
              <br>
              <br>
              <label for="password">Password:</label>
              <input type="password" id="password" name="password" required>
              <br>
              <br>
              <label for="confirmPassword">Confirm password:</label>
              <input type="password" id="confirmPassword" name="confirmPassword" required>
              <br>
              <br>
              <input type ="submit" value="Delete user">

</body>
</html>