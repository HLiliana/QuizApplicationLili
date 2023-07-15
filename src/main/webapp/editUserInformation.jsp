<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.QuizApplication.model.User" %>
<%@ page import="com.QuizApplication.repository.UserRepository" %>
<%@ page import="com.QuizApplication.exception.BusinessException" %>

<html>
<head>
<title>Welcome to user page!</title>
</head>
<body>

     <h1> <%=request.getAttribute ("username")%> You can edit account information.</h1>

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
            <label for="email">Email:</label>
            <input type="text" id="email" name="email" required>
            <br>
            <br>
            <label for="phone">Phone:</label>
            <input type="text" id="phone" name="phone" required>
            <br>
            <br>
        <input type="submit" value="Update user" class="btn btn-primary">
        </form>


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