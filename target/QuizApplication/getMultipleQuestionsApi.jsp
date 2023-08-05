<%@ page import="com.QuizApplication.model.Quiz, com.QuizApplication.repository.QuizRepository" %>
<%@ page import="com.QuizApplication.model.Question, com.QuizApplication.repository.QuestionRepository" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.QuizApplication.exception.BusinessException" %>


<%
        QuestionRepository repository = new QuestionRepository();
        List<Question> generatedList = repository.getMultipleQuestions();

        for (Question generatedQuestion : generatedList) {
            String generatedCategory = generatedQuestion.getCategory();
            String generatedDifficulty = generatedQuestion.getDifficulty();
            String generatedCorrectAnswer = generatedQuestion.getCorrectAnswer();
            String generatedIncorrectAnswer1 = generatedQuestion.getIncorrectAnswer1();
            String generatedIncorrectAnswer2 = generatedQuestion.getIncorrectAnswer2();
            String generatedIncorrectAnswer3 = generatedQuestion.getIncorrectAnswer3();
            String generatedQuestionDescription = generatedQuestion.getQuestionDescription();

            repository.addQuestion(generatedQuestion);
%>
    <script>
        window.unload = function() {
            window.location.href = "addQuestion.jsp?questionDescription=<%= generatedQuestionDescription %>&category=<%= generatedCategory %>&difficulty=<%=generatedDifficulty%>&incorrectAnswer1=<%=generatedIncorrectAnswer1%>&incorrectAnswer2=<%=generatedIncorrectAnswer2%>&incorrectAnswer3=<%=generatedIncorrectAnswer3%>&correctAnswer=<%=generatedCorrectAnswer%>";
        };
    </script>
<%
        }
%>
    <html>
    <head>
        <title>API Page</title>
    </head>
    <body>
        <h1>Welcome To Api Functional, multiple Questions were added!!</h1>
    </body>
    </html>