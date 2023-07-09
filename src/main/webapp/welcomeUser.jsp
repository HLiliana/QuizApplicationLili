<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.QuizApplication.model.User" %>
<%@ page import="com.QuizApplication.repository.UserRepository" %>
<%@ page import="com.QuizApplication.exception.BusinessException" %>


<html>
<head>
 <!-- This will make the table look nicer -->
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
     <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.21.4/dist/bootstrap-table.min.css">
        <link rel="stylesheet" href="styles.css">
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
    </form>

    <form action="index.jsp">
    <input type="submit" value="Back to Login" class="btn btn-primary btn-block"/>
    </form>
</body>
</html>