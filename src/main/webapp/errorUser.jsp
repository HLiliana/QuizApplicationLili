<%@ page import="com.QuizApplication.repository.UserRepository" %>
<%@ page import="com.QuizApplication.exception.BusinessException" %>
<%@ page import="com.QuizApplication.model.User" %>



<html>
<head>
    <title>Error Page</title>
</head>
<body>
    <h1>Error User Information.</h1>
    <p>${errorMessage}</p>
    <form action="index.jsp">
    <input type="submit" value="Back to Login" class="btn btn-primary btn-block"/>
    </form>
</body>
</html>
