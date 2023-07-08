<%@ page import="com.QuizApplication.repository.UserRepository" %>


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
      request.getRequestDispatcher("welcomeUser.jsp").forward(request, response);
    } else {
        // Authentication failed, show an error message or redirect to an error page
        response.sendRedirect("error.jsp");
    }
%>
