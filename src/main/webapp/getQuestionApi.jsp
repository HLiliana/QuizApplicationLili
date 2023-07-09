<%@ page import="com.QuizApplication.repository.QuestionRepository" %>
<%@ page import="com.QuizApplication.model.Question" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.QuizApplication.exception.BusinessException" %>

<%
        QuestionRepository repository = new QuestionRepository();
        Question generatedQuestion = repository.getQuestionsFromApi();

        String generatedQuestionDescription = generatedQuestion.getQuestionDescription();
        String generatedCategory = generatedQuestion.getCategory();
        String generatedDifficulty = generatedQuestion.getDifficulty();
        String generatedIncorrectAnswer1 = generatedQuestion.getIncorrectAnswer1();
        String generatedIncorrectAnswer2 = generatedQuestion.getIncorrectAnswer2();
        String generatedIncorrectAnswer3 = generatedQuestion.getIncorrectAnswer3();
        String generatedCorrectAnswer = generatedQuestion.getCorrectAnswer();

        repository.addQuestion(generatedQuestion);

    %>
    <script>
        window.unload = function() {
            window.location.href = "addQuestion.jsp?questionDescription=<%= generatedQuestionDescription %>&category=<%= generatedCategory %>&difficulty=<%= generatedDifficulty%>&incorrectAnswer1=<%= generatedIncorrectAnswer1%>&incorrectAnswer2=<%= generatedIncorrectAnswer2%>&incorrectAnswer3=<%= generatedIncorrectAnswer3%>&correctAnswer=<%= generatedCorrectAnswer%>";
        };
    </script>


<html>
<head>
    <title>Functional API</title>
</head>
<body>
    <h1>Welcome to Functional API</h1>
</body>
</html>






