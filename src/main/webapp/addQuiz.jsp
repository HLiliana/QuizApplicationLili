<%@ page import="com.QuizApplication.model.Quiz, com.QuizApplication.repository.QuizRepository" %>
<%@ page import="com.QuizApplication.model.Question" %>

<%
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String difficulty = request.getParameter("difficulty");

        Quiz quiz = new Quiz(name,category,difficulty);

        QuizRepository repository = new QuizRepository();

        repository.addQuiz(quiz);

    %>
<meta http-equiv="Refresh" content="0; url='/quizapp/quiz.jsp" />
