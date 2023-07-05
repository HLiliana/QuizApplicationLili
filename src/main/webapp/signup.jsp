<%@ page import="com.QuizApplication.model.User" %>
<%@ page import="com.QuizApplication.repository.UserRepository" %>

<html>
 <head>
    <title>SignUp Form</title>
</head>
<body>
    <h1>Please enter your data: </h1>


     <form action="addUser.jsp" method="post">
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
</html>