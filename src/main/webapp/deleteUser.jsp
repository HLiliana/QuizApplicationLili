<%@ page import="com.QuizApplication.model.User" %>
<%@ page import="com.QuizApplication.repository.UserRepository" %>
<%@ page import="com.QuizApplication.exception.BusinessException" %>
<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII" errorPage="errorUser.jsp"%>
<%@ page import="java.util.List" %>
<html>
<head>
     <meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
   <title>Delete User Page</title>
</head>
<body>

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
                    String deleteConfirmationMessage = "User successfully deleted";

                    request.getSession().invalidate();
                    request.getSession().setAttribute("deleteConfirmationMessage", deleteConfirmationMessage);
                    response.sendRedirect("index.jsp");
                }else {
                    throw new BusinessException("User can not be deleted.");
                    }
                }catch (BusinessException e) {
                    request.setAttribute("errorMessage", e.getMessage());
                    request.getRequestDispatcher("errorUser.jsp").forward(request, response);
            }
        }

%>
</body>
</html>