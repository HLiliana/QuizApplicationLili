<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page import="java.util.List" %>
<%@ page import="com.QuizApplication.model.User" %>
<%@ page import="com.QuizApplication.repository.UserRepository" %>
<%@ page import="com.QuizApplication.exception.BusinessException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">

<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">

            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=yes">

            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
            <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.21.4/dist/bootstrap-table.min.css">
            <link rel="stylesheet" href="styles.css">
   <title>Quiz Application</title>
</head>
<body>
         <% //Display the confirmation message if it exists
         if (session.getAttribute("confirmationMessage") != null) { %>
            <p><%= session.getAttribute("confirmationMessage") %></p>
            <% session.removeAttribute("confirmationMessage"); %>
         <% } %>

         <% //Display the confirmation message if it exists
         if (session.getAttribute("deleteConfirmationMessage") != null) { %>
            <p><%= session.getAttribute("deleteConfirmationMessage") %></p>
            <% session.removeAttribute("deleteConfirmationMessage"); %>
         <% } %>



<h1>Quiz Application!</h1>
                <form action="login.jsp" method="post">
                <strong>Email</strong>:<input type="text" name="email" required>
                <br>
                <strong>Password</strong>:<input type="password" name="password" required>
                <br>
                <input type="submit" value="Login" class="btn btn-primary btn-block"/>
                <br>
                </form>
                <form action="signup.jsp">
                        <input type="submit" value="Sign Up" class="btn btn-primary btn-block"/>
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
