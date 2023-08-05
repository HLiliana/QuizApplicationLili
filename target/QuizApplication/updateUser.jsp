<%@ page import="com.QuizApplication.model.User" %>
<%@ page import="com.QuizApplication.repository.UserRepository" %>
<%@ page import="com.QuizApplication.exception.BusinessException" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String phone = request.getParameter("phone");

    UserRepository userRepository = new UserRepository();

    try {
        User user = userRepository.updateUserByEmail(username, password, email, phone);
        if (user != null) {
            request.setAttribute("successMessage", "Account information updated successfully.");
        } else {
            request.setAttribute("errorMessage", "Failed to update account information.");
        }
    } catch (BusinessException e) {
        request.setAttribute("The user information could not be updated", e.getMessage());
    }

    // Forward the control back to the original JSP page
    request.getRequestDispatcher("editUserInformation.jsp").forward(request, response);
%>