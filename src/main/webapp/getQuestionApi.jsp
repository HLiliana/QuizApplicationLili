<%@ page import="com.QuizME.model.Quiz, com.QuizME.repository.QuizRepository" %>
<%@ page import="com.QuizME.model.Question, com.QuizME.repository.QuestionRepository" %>


<%
        if(request.getParameter("getQuestionApi") != null) {
        QuestionRepository repository = new QuestionRepository();
        Question generatedQuestion = repository.getQuestionsFromApi();

        String generatedQuestionDescription = generatedQuestion.getQuestionDescription;
        String generatedCategory = generatedQuestion.getCategory;
        String generatedDifficulty = generatedQuestion.getDifficulty;
        String generatedIncorrectAnswer1 = generatedQuestion.getIncorrectAnswer1;
        String generatedIncorrectAnswer2 = generatedQuestion.getIncorrectAnswer2;
        String generatedIncorrectAnswer3 = generatedQuestion.getIncorrectAnswer3;
        String generatedCorrectAnswer = generatedQuestion.getCorrectAnswer;

    %>
    <script>
        window.unload = function() {
            window.location.href = "addQuestion.jsp?questionDescription=<%= generatedQuestionDescription %>&category=<%= generatedCategory %>&difficulty=<%generatedDifficulty%>&incorrectAnswer1=<%generatedIncorrectAnswer1%>&incorrectAnswer2=<%generatedIncorrectAnswer2%>&incorrectAnswer3=<%generatedIncorrectAnswer3%>&correctAnswer=<% generatedCorrectAnswer%>";
        };
    </script>
    <%

        }
    %>







