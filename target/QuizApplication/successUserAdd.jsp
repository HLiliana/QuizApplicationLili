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

<html lang="en">
<head><meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=yes">

            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
            <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.21.4/dist/bootstrap-table.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
            <link rel="stylesheet" href="styles.css">
<title>Welcome to the Quiz Application!</title>
</head>
<body>
            <% //Display the confirmation message if it exists//received from update
            if (session.getAttribute("successMessage") != null) { %>
                <p><%= session.getAttribute("successMessage") %></p>
                <% session.removeAttribute("successMessage"); %>
            <% } %>


<nav class="navbar" style="background-color: #9ad9ea;" >
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="login.jsp">Quiz Application</a>
    </div>
    <ul class="nav navbar-nav">
     <li><a class = "text-primary" href="mainQuiz.jsp">Quiz Page</a></li>
      <li><a href="mainQuestion.jsp">Question page</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="signup.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>

<div class="container">
<h1>Welcome <%= username %></h1>
</div>

</body>
</html>
