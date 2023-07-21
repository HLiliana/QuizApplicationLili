<%@ page import="com.QuizApplication.model.Quiz, com.QuizApplication.repository.QuizRepository" %>
<%@ page import="com.QuizApplication.model.Question" %>

<html>

<body>

<h1> We deleted a quiz </h1>



    <%
          String id = request.getParameter("id");
          QuizRepository repository = new QuizRepository();
          Quiz quiz = repository.findById(id);
          repository.deleteQuiz(quiz);

        %>

<form action="mainQuiz.jsp">
<input type="submit" value="Back to Quiz" class="btn btn-primary btn-block"/>
</form>
    </body>

</html>

