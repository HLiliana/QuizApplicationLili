<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.QuizApplication.model.User" %>
<%@ page import="com.QuizApplication.repository.UserRepository" %>
<%@ page import="com.QuizApplication.exception.BusinessException" %>
 <link rel="stylesheet" href="styles.css">

<html>
<head>
<title>Welcome to the Quiz Application!</title>
</head>

<body>
    <%
        // Retrieve the username from the request
        String username = request.getParameter("username");
    %>
    <h1>Welcome <%=username%></h1>

    <form action="quiz.jsp" method = "post">
        <input type="submit" value="Play Quiz">
    </form>

    <form action = "updateUser.jsp" method="post">
    <label for="username">Username:</label>
          <input type="text" id="username" name="username" required>
          <br>
          <input type ="submit" value="Update user">
    </form>

    <form action = "deleteUser.jsp" method = "post">
    <label for="username">Username:</label>
          <input type="text" id="username" name="username" required>
          <br>
          <input type ="submit" value="Delete user">
    <form>
</body>
</html>