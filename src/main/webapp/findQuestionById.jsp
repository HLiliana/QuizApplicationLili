<%@ page import="com.QuizApplication.model.Quiz, com.QuizApplication.repository.QuizRepository" %>
<%@ page import="com.QuizApplication.model.Question, com.QuizApplication.repository.QuestionRepository" %>
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

<table>

   <table border="1" class="table table-striped table-hover w-50 p-3">
       <tr>
           <th>ID</th>
           <th>Question</th>
           <th>Category</th>
           <th>Difficulty</th>
           <th>Correct Answer</th>
           <th>Incorrect Answer1</th>
           <th>Incorrect Answer2</th>
           <th>Incorrect Answer3</th>


           </tr>
       <%
                    String id = request.getParameter("id");
                   QuestionRepository questionRepo = new QuestionRepository();
                  Question question = questionRepo.findQuestionById(id);
               %>
                   <tr>
                       <td><%= question.getId() %></td>
                       <td><%= question.getQuestionDescription() %></td>
                       <td><%= question.getCategory() %></td>
                       <td><%= question.getDifficulty() %></td>
                       <td><%= question.getCorrectAnswer() %></td>
                       <td><%= question.getIncorrectAnswer1() %></td>
                       <td><%= question.getIncorrectAnswer2() %></td>
                       <td><%= question.getIncorrectAnswer3() %></td>
                   </tr>

</table>