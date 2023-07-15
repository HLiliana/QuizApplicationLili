<%@ page import="com.QuizApplication.model.User" %>
<%@ page import="com.QuizApplication.repository.UserRepository" %>
<%@ page import="com.QuizApplication.exception.BusinessException" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>



<%
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        if (!password.equals(confirmPassword)) {
            String errorMessage = "Passwords do not match. Please try again.";
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("errorUserAdd.jsp").forward(request, response);
        }else{
            User user = new User(username,password,email,phone);
            try {
                UserRepository userRepository = new UserRepository();
                userRepository.addUser(user);

                boolean isAuthenticated = userRepository.authenticateUser(email, password);

                if (isAuthenticated) {
                    String message = "User successfully added";
                    request.setAttribute("successMessage", message);
                    request.getRequestDispatcher("successUserAdd.jsp").forward(request, response);
                    } else {
                    throw new BusinessException("User signup failed.");
                    }
                } catch (BusinessException e) {
                request.setAttribute("errorMessage", e.getMessage());
                request.getRequestDispatcher("errorUserAdd.jsp").forward(request, response);
                }
        }

%>