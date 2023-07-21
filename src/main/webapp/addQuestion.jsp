<%@ page import="com.QuizApplication.model.Quiz, com.QuizApplication.repository.QuizRepository" %>
<%@ page import="com.QuizApplication.model.Question, com.QuizApplication.repository.QuestionRepository" %>

<%
        String questionDescription = request.getParameter("questionDescription");
        String category = request.getParameter("category");
        String difficulty = request.getParameter("difficulty");
        String correctAnswer = request.getParameter("correctAnswer");
        String incorrectAnswer1 = request.getParameter("incorrectAnswer1");
        String incorrectAnswer2 = request.getParameter("incorrectAnswer2");
        String incorrectAnswer3 = request.getParameter("incorrectAnswer3");
        QuestionRepository repository = new QuestionRepository();
        Question question = new Question(questionDescription,category,difficulty, correctAnswer,incorrectAnswer1,incorrectAnswer2,incorrectAnswer3);

        repository.addQuestion(question);

    %>
<meta http-equiv="Refresh" content="0; url='/quizapp/mainQuestion.jsp" />