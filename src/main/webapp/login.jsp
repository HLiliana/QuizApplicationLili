<%@ page import="com.QuizApplication.repository.UserRepository" %>
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

<%!
        boolean authenticateUser(String username, String password) {
        UserRepository userRepository = new UserRepository();
        return userRepository.authenticateUser(username, password);
    }
%>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // Perform authentication using your preferred approach (e.g., querying the database)
    boolean isAuthenticated = authenticateUser(username, password);

    if (isAuthenticated) {
        // Redirect to the quiz page or another authenticated page
      request.getRequestDispatcher("welcomeUser.jsp").forward(request, response);
    } else {
        // Authentication failed, show an error message or redirect to an error page
        response.sendRedirect("error.jsp");
    }
%>
</body>
</html>