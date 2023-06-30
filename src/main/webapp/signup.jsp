<%@ page import="com.QuizApplication.model.User" %>
<%@ page import="com.QuizApplication.repository.UserRepository" %>

<%
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        User user = new User(username,password,email,phone);

        UserRepository userRepository = new UserRepository();

        userRepository.addUser(user);

    %>

