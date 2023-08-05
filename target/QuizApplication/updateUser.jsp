<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII" errorPage="errorUser.jsp"%>
<%@ page import="java.util.List" %>
<%@ page import="com.QuizApplication.model.User" %>
<%@ page import="com.QuizApplication.repository.UserRepository" %>
<%@ page import="com.QuizApplication.exception.BusinessException" %>
<html>
<head>
     <meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
   <title>Update User Page</title>
</head>
<body>
<%
    String newUsername = request.getParameter("newUsername");
    String newPassword = request.getParameter("newPassword");
    String confirmPassword = request.getParameter("confirmPassword");
    String email = request.getParameter("email");
    String newPhone = request.getParameter("newPhone");

    String redirectTo = "editUserInformation";
    UserRepository userRepository = new UserRepository();

    if (newPassword.equals(confirmPassword)) {
        try {
            User user = userRepository.updateUserByEmail(newUsername, newPassword, email, newPhone);
            if (user != null) {
            String confirmationMessage = "Your account information has been updated. Please log in again.";

            // Invalidate the current session
            request.getSession().invalidate();
            request.getSession().setAttribute("confirmationMessage", confirmationMessage);
            response.sendRedirect("index.jsp");
            } else {
                    request.getSession().invalidate();
                    request.getSession().setAttribute("redirectTo", redirectTo);
                    response.sendRedirect("editUserInformation.jsp");
            }
        } catch (BusinessException e) {
                request.getSession().setAttribute("redirectTo", redirectTo);
                request.setAttribute("errorMessage", e.getMessage());
                request.getRequestDispatcher("errorUser.jsp").forward(request, response);
        }
    } else {
            request.getSession().setAttribute("redirectTo", redirectTo);
            request.setAttribute("errorMessage", "Passwords do not match. Please try again.");
            request.getRequestDispatcher("errorUser.jsp").forward(request, response);
    }
%>
</body>
</html>