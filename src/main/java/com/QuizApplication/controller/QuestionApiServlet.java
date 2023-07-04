//package com.QuizApplication.controller;
//
//import com.QuizApplication.repository.QuestionRepository;
//import com.QuizApplication.repository.QuizRepository;
//import com.google.gson.Gson;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//
//@WebServlet(name = "QuestionApi", urlPatterns = "/getQuestionApi")
//public class QuestionApiServlet extends HttpServlet {
//
//    private final Gson gson = new Gson();
//    private final QuestionRepository questionRepository = new QuestionRepository();
//    @Override
//    protected void doGet(
//            HttpServletRequest request,
//            HttpServletResponse response) throws IOException {
//
//        var questionList = questionRepository.getAllQuestions();
//        String jsonOutput =  gson.toJson(questionList);
//
//        PrintWriter out = response.getWriter();
//        response.setContentType("application/json");
//        response.setCharacterEncoding("UTF-8");
//        out.print(jsonOutput);
//        out.flush();
//    }
//}
