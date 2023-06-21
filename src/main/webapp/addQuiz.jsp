<%@ page import="com.QuizApplication.model.Quiz, com.QuizApplication.repository.QuizRepository" %>
<%@ page import="com.QuizApplication.model.Question" %>

<%
        String name = req.getParameter("name");
        String category = req.getParameter("category");
        String difficulty = req.getParameter("difficulty");

        Quiz quiz = new Quiz(name,category,difficulty);

        QuizRepository repository = new QuizRepository();

        repository.addQuiz(quiz);

    %>

    <meta http-equiv="Refresh" content="0; url='/world" />