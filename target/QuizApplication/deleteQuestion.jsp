<%@ page import="com.QuizApplication.model.Quiz, com.QuizApplication.repository.QuizRepository" %>
<%@ page import="com.QuizApplication.model.Question, com.QuizApplication.repository.QuestionRepository" %>



<html>

<body>

<h1> We deleted a question </h1>



    <%
            String id = request.getParameter("id");
            QuestionRepository repository = new QuestionRepository();
            Question question = repository.findQuestionById(id);
          repository.deleteQuestion(question);

        %>

    </body>

</html>