<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.QuizApplication.model.User" %>
<%@ page import="com.QuizApplication.repository.UserRepository" %>
<%@ page import="com.QuizApplication.exception.BusinessException" %>
<%
    UserRepository userRepository = new UserRepository();
    String loggedInEmail = session.getAttribute("loggedInEmail").toString();
    String username = session.getAttribute("username").toString();

    // Retrieve the user's existing data based on the logged-in email
    User user = userRepository.getUserByEmail(loggedInEmail);
%>

<html>
<head><meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=yes">

            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
            <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.21.4/dist/bootstrap-table.min.css">
            <link rel="stylesheet" href="styles.css">
<title>Welcome to the Quiz Application!</title>
</head>
<body>
    <h1>Welcome <%= username %></h1>

    <form action="quiz.jsp" method = "post">
        <input type="submit" value="Play Quiz">
    </form>

    <form action = "editUserInformation.jsp" method="post">
        <input type ="submit" value="Edit information">
    </form>

    <form action="index.jsp">
    <input type="submit" value="Back to Login" class="btn btn-primary btn-block"/>
    </form>
<div class="bg-image"
     style="background-image: url('QuizImage1.avif');
              background-repeat: no-repeat;
              background-position: center bottom 100px;
              background-size: contain;
              height: 100vh">
             </div>
</body>
</html>