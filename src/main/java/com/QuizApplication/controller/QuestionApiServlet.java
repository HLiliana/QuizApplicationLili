//package com.QuizApplication.controller;
//
//import com.QuizApplication.model.Question;
//import com.QuizApplication.model.dto.QuestionDtoApiResponse;
//import com.QuizApplication.repository.QuestionRepository;
//import com.QuizApplication.repository.QuizRepository;
//import com.google.gson.Gson;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//import java.io.BufferedReader;
//import java.io.IOException;
//import java.io.InputStreamReader;
//import java.io.PrintWriter;
//import java.net.HttpURLConnection;
//import java.net.URL;
//import java.util.List;
//
//@WebServlet(name = "QuestionApi", urlPatterns = "/getQuestionsApi")
//public class QuestionApiServlet extends HttpServlet {
//
//    private final Gson gson = new Gson();
//    private final QuestionRepository questionRepository = new QuestionRepository();
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        String apiUrl = "https://opentdb.com/api.php?amount=30&category=22&difficulty=easy&type=multiple";
//
//        // Send HTTP GET request to the API URL
//        HttpURLConnection connection = (HttpURLConnection) new URL(apiUrl).openConnection();
//        connection.setRequestMethod("GET");
//
//        // Read the JSON response from the API
//        BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
//        StringBuilder responseBuilder = new StringBuilder();
//        String line;
//        while ((line = reader.readLine()) != null) {
//            responseBuilder.append(line);
//        }
//        reader.close();
//        connection.disconnect();
//
//        // Parse the JSON response and extract the questions
//        Gson gson = new Gson();
//        QuestionDtoApiResponse apiResponse = gson.fromJson(responseBuilder.toString(), QuestionDtoApiResponse.class);
//        List<Question> questions = apiResponse.getResults();
//
//        // Save the questions to your database table
//        QuestionRepository questionRepository = new QuestionRepository();
//        for (Question question : questions) {
//            questionRepository.addQuestion(question);
//        }
//
//        // Set the response content type to "application/json"
//        response.setContentType("application/json");
//        response.setCharacterEncoding("UTF-8");
//
//        // Write the JSON response to the servlet response
//        response.getWriter().write(responseBuilder.toString());
//    }
//}
