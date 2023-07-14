<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.QuizApplication.model.User" %>
<%@ page import="com.QuizApplication.repository.UserRepository" %>
<%@ page import="com.QuizApplication.exception.BusinessException" %>

<html>
<head>
    <title>Account Information</title>
</head>
<body>

    <h1>Update Account Information</h1>

     <form action="updateUser.jsp" method="post">
          <label for="username">Username:</label>
            <input type="text" id="username" name="username" required >
            <br>
            <br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <br>
            <br>
            <label for="confirmPassword">Confirm password:</label>
            <input type="password" id="password" name="password" required>
            <br>
            <br>
            <label for="phone">Phone:</label>
            <input type="tel" id="phone" name="phone" required>
            <br>
            <br>
        <input type="submit" value="Update user" class="btn btn-primary">
        </form>
????
        <c:if test="${not empty successMessage}">
            <p>${successMessage}</p>
        </c:if>

        <c:if test="${not empty errorMessage}">
        <p>${errorMessage}</p>
        </c:if>

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