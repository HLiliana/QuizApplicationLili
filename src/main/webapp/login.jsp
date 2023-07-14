<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.QuizApplication.model.User" %>
<%@ page import="com.QuizApplication.repository.UserRepository" %>
<%@ page import="com.QuizApplication.exception.BusinessException" %>

<html>
 <head>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
     <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.21.4/dist/bootstrap-table.min.css">
        <link rel="stylesheet" href="styles.css">
    <title>Quiz something</title>
</head>
<body>

<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    UserRepository userRepository = new UserRepository();

try{
    // Perform authentication using your preferred approach (e.g., querying the database)
    boolean isAuthenticated = userRepository.authenticateUser(email, password);

    if (isAuthenticated) {
        String username = userRepository.getUsernameByEmail(email);

        session.setAttribute("username", username);
        session.setAttribute("loggedInEmail", email);
        request.getRequestDispatcher("welcomeUser.jsp").forward(request, response);
    } else {
        response.sendRedirect("errorUser.jsp");
    }

    } catch (BusinessException e) {
        request.setAttribute("errorMessage", e.getMessage());
        request.getRequestDispatcher("errorUser.jsp").forward(request, response);
    }
%>
</body>
</html>