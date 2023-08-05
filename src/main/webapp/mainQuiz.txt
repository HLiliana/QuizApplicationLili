<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.QuizApplication.repository.QuizRepository" %>
<%@ page import="com.QuizApplication.repository.QuestionRepository" %>
<%@ page import="com.QuizApplication.model.Quiz" %>
<%@ page import="com.QuizApplication.model.Question" %>

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

<h1> Quiz </h1>
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

  <li><a href="toCreateAQuiz.jsp">Create Quiz</a></li>
  <li><a href="toAddQuiz.jsp">Add quiz</a></li>
  <li><a href="toDeleteQuiz.jsp">Delete quiz</a></li>
  <li><a href="toUpdateQuiz.jsp">Update quiz</a></li>
  <li><a href="toFindQuizById.jsp">Search by Id</a></li>
  <li><a href="toFindQuizByName.jsp">Search by Name</a></li>
  <li style="float:right"><a href="welcomeUser.jsp">Homepage</a></li>


</ul>

<%
  if (session.getAttribute("confirmationMessage") != null) { %>
            <p><%= session.getAttribute("confirmationMessage") %></p>
            <% session.removeAttribute("confirmationMessage"); %>
         <% } %>
         <%
           if (session.getAttribute("confirmationMessageDelete") != null) { %>
                     <p><%= session.getAttribute("confirmationMessageDelete") %></p>
                     <% session.removeAttribute("confirmationMessageDelete"); %>
                  <% } %>

<div style="overflow:scroll; height:500px; margin: 200px">
    <table border="1" class="table table-striped table-hover w-50 p-3">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Category</th>
            <th>Difficulty</th>
            <th>Question </th>
            </tr>
        <%

                    QuizRepository repository = new QuizRepository();

                    List<Quiz> quizList = repository.getAllQuizzes();
                    for (Quiz quiz : quizList) {
                %>
                    <tr>
                        <td><%= quiz.getId() %></td>
                        <td><%= quiz.getName() %></td>
                        <td><%= quiz.getCategory() %></td>
                        <td><%= quiz.getDifficulty() %></td>
                        <td><%= quiz.getQuestionList().size() %></td>
                    </tr>
                <% } %>
 </table>
 </div>
 <br/>
 <h3>Create a quiz</h3>

           <form action="toCreateAQuiz.jsp">
              <br/>
           <input type="submit" value="Create a quiz" class="btn btn-primary btn-block"/>
           </form>



 <form action="toAddQuiz.jsp">
 <input type="submit" value="Add a Quiz" class="btn btn-primary btn-block"/>
 </form>
 <br/>

<br/>

     <h3>Delete quiz</h3>

          <form action="toDeleteQuiz.jsp">
             <br/>
          <input type="submit" value="Delete quiz" class="btn btn-primary btn-block"/>
          </form>

<h1>Find a Quiz by id</h1>

<form action="findQuizById.jsp">
     <div class="form-outline mb-4">
                 <input type="text" name="id" value="Enter Id..." onclick="this.value=''"/><br/>
             </div>
     <br/>
        <input type="submit" value="Find quiz" class="btn btn-primary btn-block"/>
        </form>
        <h1>Find a Quiz by name</h1>

        <form action="findQuizByName.jsp">
             <div class="form-outline mb-4">
                         <input type="text" name="name" value="Enter Name..." onclick="this.value=''"/><br/>
                     </div>
             <br/>
                <input type="submit" value="Find quiz" class="btn btn-primary btn-block"/>
                </form>


<br/>
<form action="toUpdateQuiz.jsp">
<input type="submit" value="Update a Quiz" class="btn btn-primary btn-block"/>
</form>

<br/>
<form action="welcomeUser.jsp">
<input type="submit" value="To main page" class="btn btn-primary btn-block"/>
</form>
<form action="index.jsp">
<input type="submit" value="Back to Login" class="btn btn-primary btn-block"/>
</form>




</body>
</html>