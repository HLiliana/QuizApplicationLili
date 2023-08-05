<%@ page import="com.QuizApplication.model.Quiz, com.QuizApplication.repository.QuizRepository" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Result list</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.21.4/dist/bootstrap-table.min.css">
  </head>
<body>

<table border="1" class="table table-dark w-25 p-3">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Category</th>
            <th>Difficulty</th>
        </tr>

<%
  String name = request.getParameter("name");
  QuizRepository repository = new QuizRepository();
  Quiz quiz = repository.findByName(name);

  %>

  <tr>
                  <td><%= quiz.getId() %></td>
                  <td><%= quiz.getName() %></td>
                  <td><%= quiz.getCategory() %></td>
                  <td><%= quiz.getDifficulty() %></td>
              </tr>
              </table>

<form action="mainQuiz.jsp">
<input type="submit" value="Back to Quiz" class="btn btn-primary btn-block"/>
</form>
  </body>
</html>