<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page import="java.util.List" %>
<%@ page import="com.QuizApplication.model.User" %>
<%@ page import="com.QuizApplication.repository.UserRepository" %>
<%@ page import="com.QuizApplication.exception.BusinessException" %>


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
         <% //Display the confirmation message if it exists//received from update
         if (session.getAttribute("confirmationMessage") != null) { %>
            <p><%= session.getAttribute("confirmationMessage") %></p>
            <% session.removeAttribute("confirmationMessage"); %>
         <% } %>

         <% //Display the confirmation message if it exists//received from delete
         if (session.getAttribute("deleteConfirmationMessage") != null) { %>
            <p><%= session.getAttribute("deleteConfirmationMessage") %></p>
            <% session.removeAttribute("deleteConfirmationMessage"); %>
         <% } %>


</br>
</br>
</br>


                <form action="login.jsp" method="post">
                <strong>  Email</strong>:<input type="text" name="email" required>
                <br>
                <strong>Password</strong>:<input type="password" name="password" required>
                <br>
                </br>
                <input type="submit" value="Login" class="btn btn-primary btn-block"/>
                <br>
                </form>


</body>
</html>
