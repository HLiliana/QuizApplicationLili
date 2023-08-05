<%@ page import="com.QuizApplication.model.Quiz, com.QuizApplication.repository.QuizRepository" %>
<%@ page import="com.QuizApplication.model.Question, com.QuizApplication.repository.QuestionRepository" %>



<html>
<head>
<link rel="stylesheet" href="style2.css">
</head>
<body>

    <form action="mainQuestion.jsp">
        <br/>
          <input type="submit" value="Back to questions" class="btn btn-primary btn-block"/>
          </form>

    <%
         String id = request.getParameter("id");
         QuestionRepository repository = new QuestionRepository();
         Question question = repository.findQuestionById(id);
         repository.deleteQuestion(question);

        %>

    </body>

</html>