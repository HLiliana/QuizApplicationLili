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

<h1> Question </h1>
<style>

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #D18812;
}

li {
  float: left;
}

li a {
  display: block;
  color: blue;
  text-align: center;
  font-weight: bold;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover {
  background-color: #c7d112;
}
</style>


<ul>
  <li><a href="toAddQuestion.jsp">Add question</a></li>
  <li><a href="toRandomQuestion.jsp">Create random questions</a></li>
  <li><a href="toUpdateQuestion.jsp">Update question</a></li>
  <li><a href="deleteQuestion.jsp">Delete question</a></li>
  <li><a href="findQuestionById.jsp">Search by Id</a></li>
  <li style="float:right"><a href="welcomeUser.jsp">Homepage</a></li>


</ul>
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
                   QuestionRepository questionRepo = new QuestionRepository();
                   List<Question> questionList = questionRepo.getAllQuestions();
                   for (Question question : questionList) {
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
               <% } %>
</table>
  </div>

<form action="toRandomQuestion.jsp">
         <input type="submit" value="Create Random Questions" class="btn btn-primary btn-block"/>
         </form>

  <form action="getQuestionApi.jsp" method="GET">

            <input type="submit" name="getQuestionApi" value="Generate Question" class="btn btn-primary btn-block"/>
        </form>

  <form action="getMultipleQuestionsApi.jsp" method="GET">

            <input type="submit" name="getMultipleQuestionApi" value="Generate multiple question" class="btn btn-primary btn-block"/>
        </form>

            issue here
         <h2>Add a question</h2>

            <form action="toAddQuestion.jsp">
            <input type="submit" value="Add a Question" class="btn btn-primary btn-block"/>
            </form>

   <%-- <h2>Find a Question by id</h2> --%>

    <form action="findQuestionById.jsp">
         <div class="form-outline mb-4">
         <input type="text" name="id" value="Enter Id..." onclick="this.value=''"/><br/>
                 </div>
         <input type="submit" value="Find question" class="btn btn-primary btn-block"/>
         </form>

 <br/>

    <%-- <h2>Find a Question by description</h2> --%>

     <form action="findQuestionByDescription.jsp">
          <div class="form-outline mb-4">
                      <input type="text" name="questionDescription" value="Enter Description..." onclick="this.value=''"/><br/>
                  </div>

             <input type="submit" value="Find question" class="btn btn-primary btn-block"/>
             </form>

    <br/>

 <%-- <h2>Update a Question</h2> --%>

            <form action="toUpdateQuestion.jsp">
            <input type="submit" value="Update a Question" class="btn btn-primary btn-block"/>
            </form>

          <br/>

<%-- <h2>Delete question</h2> --%>

            <form action="deleteQuestion.jsp">

                   <div class="form-outline mb-4">
                            <input type="text" name="id" value="Enter ID..." onclick="this.value=''"/><br/>
                   </div>

            <input type="submit" value="Delete question" class="btn btn-primary btn-block"/>
            </form>
            <form action="index.jsp">
                <input type="submit" value="Back to Login" class="btn btn-primary btn-block"/>
                </form>
                <form action="welcomeUser.jsp">
                    <input type="submit" value="Back to Main Page" class="btn btn-primary btn-block"/>
                    </form>
                    <form action="logout.jsp">
                                    <input type="submit" value="Logout" class="btn btn-primary btn-block"/>
                                    </form>

</body>
</html>