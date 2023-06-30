<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.QuizApplication.repository.QuizRepository" %>
<%@ page import="com.QuizApplication.repository.QuestionRepository" %>
<%@ page import="com.QuizApplication.model.Quiz" %>
<%@ page import="com.QuizApplication.model.Question" %>
<%@ page import="com.QuizApplication.controller.HomePageController" %>
<%@ page import="com.QuizApplication.controller.LoginUserServlet" %>

<html>
 <head>
    <title>Quiz Application</title>
</head>
<body>
    <h1>Welcome to the Quiz Application!</h1>

    <form action="login.jsp" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>
        <br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
        <br>
        <input type="submit" value="Login">
    </form>
     <form action="signup.jsp" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            <br>
            <label for="password">Password:</label>
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
            <input type="submit" value="SignUp">
        </form>
</body>
</head>
</html>
