<%@ page import="com.QuizApplication.model.User" %>
<%@ page import="com.QuizApplication.repository.UserRepository" %>
<%@ page import="com.QuizApplication.exception.BusinessException" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>

<%
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!password.equals(confirmPassword)) {
              String errorMessage = "Passwords do not match. Please try again.";
              request.setAttribute("errorMessage", errorMessage);
              request.getRequestDispatcher("errorUserAdd.jsp").forward(request, response);
        }else{
            try{
                UserRepository userRepository = new UserRepository();
                boolean isAuthenticated = userRepository.authenticateUser(email, password);
                boolean isDeleted = userRepository.deleteUser(email);

                if (isAuthenticated && isDeleted){
                    String message = "User successfully deleted";
                    request.setAttribute("successMessage", message);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }else {
                    throw new BusinessException("User can not be deleted.");
                    }
                }catch (BusinessException e) {
                    request.setAttribute("errorMessage", e.getMessage());
                    request.getRequestDispatcher("errorUserAdd.jsp").forward(request, response);
            }
        }

%>