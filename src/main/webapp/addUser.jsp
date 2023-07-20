
<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII" errorPage="errorUser.jsp"%>
<%@ page import="java.util.List" %>
<%@ page import="com.QuizApplication.model.User" %>
<%@ page import="com.QuizApplication.repository.UserRepository" %>
<%@ page import="com.QuizApplication.exception.BusinessException" %>

<html>
<head>
     <meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">

   <title>Add User Page</title>
</head>
<body>
<%

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        String redirectTo = "signup";

        if (!password.equals(confirmPassword)) {
            String errorMessage = "Passwords do not match. Please try again.";
            request.getSession().setAttribute("redirectTo", redirectTo);
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("errorUser.jsp").forward(request, response);
        }else{
            User user = new User(username,password,email,phone);
            try {
                UserRepository userRepository = new UserRepository();
                userRepository.addUserToDatabase(user);

                boolean isAuthenticated = userRepository.authenticateUser(email, password);

                if (isAuthenticated) {
                    session.setAttribute("username", username);
                    session.setAttribute("loggedInEmail", email);

                    String successMessage = "User successfully added";

                    request.getSession().setAttribute("successMessage", successMessage);
                    response.sendRedirect("successUserAdd.jsp");
                } else {
                        request.getSession().invalidate();
                        request.getSession().setAttribute("redirectTo", redirectTo);
                        response.sendRedirect("signup.jsp");
                }
                } catch (BusinessException e) {
                    request.getSession().setAttribute("redirectTo", redirectTo);
                    request.setAttribute("errorMessage", e.getMessage());
                    request.getRequestDispatcher("errorUser.jsp").forward(request, response);
                }
        }
    %>

%>
</body>
</html>

