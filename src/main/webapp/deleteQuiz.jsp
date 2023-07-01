<%@ page import="com.QuizApplication.model.Quiz, com.QuizApplication.repository.QuizRepository" %>
<%@ page import="com.QuizApplication.model.Question" %>

<html>

<body>

<h1> We deleted a quiz </h1>



    <%
            String name = request.getParameter("name");
              QuizRepository repository = new QuizRepository();
              Quiz quiz = repository.findByName(name);
          repository.deleteQuiz(quiz);

        %>

    </body>

</html>

