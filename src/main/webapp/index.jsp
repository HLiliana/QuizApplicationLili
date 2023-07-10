<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.QuizApplication.repository.QuizRepository" %>
<%@ page import="com.QuizApplication.repository.QuestionRepository" %>
<%@ page import="com.QuizApplication.model.Quiz" %>
<%@ page import="com.QuizApplication.model.Question" %>


<html>
 <head>
    <title>Quiz Application</title>
</head>
<body>
    <h1>Welcome to the Quiz Application!</h1>



    <form action="login.jsp" method="post">
        <label for="email">Email:</label>
        <input type="text" id="email" name="email" required>
        <br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
        <br>
        <input type="submit" value="Login">
    </form>

    <form action="signup.jsp">
        <input type="submit" value="Sign Up" class="btn btn-primary btn-block"/>
        </form>
</body>
</head>
</html>
