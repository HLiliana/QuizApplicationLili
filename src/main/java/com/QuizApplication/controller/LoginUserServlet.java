package com.QuizApplication.controller;
import com.QuizApplication.repository.UserRepository;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/loginUser")
public class LoginUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        UserRepository userRepository= new UserRepository();
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        response.sendRedirect("index.jsp");
    }

}
