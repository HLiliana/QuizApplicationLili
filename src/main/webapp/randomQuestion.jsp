<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.QuizApplication.repository.QuizRepository" %>
<%@ page import="com.QuizApplication.repository.QuestionRepository" %>
<%@ page import="com.QuizApplication.model.Quiz" %>
<%@ page import="com.QuizApplication.model.Question" %>
<%@ page import="com.QuizApplication.exception.BusinessException" %>

<html>
 <head>
    <!-- This will make the table look nicer -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>QuizME</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.21.4/dist/bootstrap-table.min.css">
    <link rel="stylesheet" href="styles.css">
  </head>
<body>
<h1>Welcome <%=session.getAttribute ("username")%></h1>

<h1> Table with random questions <h1/>
<div style="overflow:scroll; height:400px; width:600px;">
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
                   String numberOfQuestions = request.getParameter("numberOfQuestions");
                   String category = request.getParameter("category");
                   String difficulty = request.getParameter("difficulty");
                   QuestionRepository questionRepo = new QuestionRepository();
                   try{
                         List<Question> questionList = questionRepo.getAllQuestions();
                         List<Question> aSortedList = questionRepo.groupByCategoryAndDifficulty(category, difficulty, questionList);
                         List<Question> randomList = questionRepo.completeRandomQuestionList(numberOfQuestions, aSortedList);
                         for (Question question : randomList) {
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
                                  <% }
                           String randomConfirmationMessage = "Your list has been created.";
                           request.getSession().invalidate();
                           request.getSession().setAttribute("confirmationMessage", randomConfirmationMessage);
                           response.sendRedirect("mainQuiz.jsp");

                           } catch(BusinessException e){

                           request.setAttribute("errorMessage", e.getMessage());
                           request.getRequestDispatcher("errorQuizAdd.jsp").forward(request, response);
                           }
%>
</table>
  </div>

  </body>
  </html>