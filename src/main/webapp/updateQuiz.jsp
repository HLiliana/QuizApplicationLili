<%@ page import="com.QuizApplication.model.Quiz, com.QuizApplication.repository.QuizRepository" %>
<%@ page import="com.QuizApplication.model.Question" %>

<html>
<body>
<h1> The Quiz is updated </h1>



<table border="1" class="table table-dark w-25 p-3">
        <tr>
            <th>Name</th>
            <th>Category</th>
            <th>Difficulty</th>
        </tr>
        <%
                    String name = request.getParameter("name");
                    String category = request.getParameter("category");
                    String difficulty = request.getParameter("difficulty");

                    QuizRepository repository = new QuizRepository();
                    Quiz quiz = repository.findByName(name);
                    quiz.setName(name);
                    quiz.setCategory(category);
                    quiz.setDifficulty(difficulty);
                    repository.updateQuiz(quiz);

        %>
            <tr>

                <td><%= quiz.getName() %></td>
                <td><%= quiz.getCategory() %></td>
                <td><%= quiz.getDifficulty() %></td>
            </tr>
    </table>

</body>
</html>