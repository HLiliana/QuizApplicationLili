<%@ page import="com.QuizApplication.model.User" %>
<%@ page import="com.QuizApplication.repository.UserRepository" %>
<%@ page import="com.QuizApplication.exception.BusinessException" %>
<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII" errorPage="errorUser.jsp"%>
<%@ page import="java.util.List" %>
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
                request.setAttribute("redirectTo", "editUserInformation"); // Set the attribute value
redirectTo=se
                request.setAttribute("errorMessage", "Failed to update account information.");
            response.sendRedirect("editUserInformation.jsp");
            }
        } catch (BusinessException e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("errorUser.jsp").forward(request, response);
        }
    } else {
        request.setAttribute("errorMessage", "Passwords do not match. Please try again.");
        request.getRequestDispatcher("errorUser.jsp").forward(request, response);
    }
%>
</body>
</html>