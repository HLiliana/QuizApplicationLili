package com.QuizApplication.repository;

import com.QuizApplication.model.Quiz;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;



@WebServlet("/addQuiz")
public class AddQuiz extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)throws IOException{
        QuizRepository repository = new QuizRepository();

        String name = req.getParameter("name");
        String category = req.getParameter("category");
        String difficulty = req.getParameter("difficulty");

        Quiz quiz = new Quiz(name,category,difficulty);
        repository.addQuiz(quiz);
        resp.getOutputStream().print("Added!");
    }

}
