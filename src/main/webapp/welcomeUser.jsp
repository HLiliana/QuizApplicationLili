<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.QuizApplication.model.User" %>
<%@ page import="com.QuizApplication.repository.UserRepository" %>
<%@ page import="com.QuizApplication.exception.BusinessException" %>


<html>
<head>
<title>Welcome to the Quiz Application!</title>
</head>

<body>


     <h1>Welcome <%=request.getAttribute ("username")%></h1>

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