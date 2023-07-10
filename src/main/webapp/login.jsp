<%@ page import="com.QuizApplication.repository.UserRepository" %>


<%!
        UserRepository userRepository = new UserRepository();

        boolean authenticateUser(String email, String password) {
        return userRepository.authenticateUser(email, password);
    }
%>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    // Perform authentication using your preferred approach (e.g., querying the database)
    boolean isAuthenticated = authenticateUser(email, password);

    if (isAuthenticated) {
      String username = userRepository.getUsernameByEmail(email);
      request.setAttribute("username", username);
      request.getRequestDispatcher("welcomeUser.jsp").forward(request, response);
    } else {
        response.sendRedirect("error.jsp");
    }
%>
