<%@ page import="com.QuizApplication.model.User" %>
<%@ page import="com.QuizApplication.repository.UserRepository" %>
<%@ page import="com.QuizApplication.exception.BusinessException" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>

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
                request.setAttribute("errorMessage", "Failed to update account information.");
                request.getRequestDispatcher("errorUser.jsp").forward(request, response);
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
