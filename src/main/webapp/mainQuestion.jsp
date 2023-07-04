<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.QuizApplication.repository.QuizRepository" %>
<%@ page import="com.QuizApplication.repository.QuestionRepository" %>
<%@ page import="com.QuizApplication.model.Quiz" %>
<%@ page import="com.QuizApplication.model.Question" %>
<%@ page import="com.QuizApplication.controller.HomePageController" %>
<%@ page import="com.QuizApplication.controller.LoginUserServlet" %>

<html>
 <head>
    <!-- This will make the table look nicer -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>QuizME</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.21.4/dist/bootstrap-table.min.css">
  </head>
<body>

  <form action="" method="GET">
            <br/>
            <input type="submit" name="getQuestionApi" value="Generate Question" class="btn btn-primary btn-block"/>
        </form>


<h1> Table for question <h1/>
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

 <h2>Add a Question</h2>

     <form action="addQuestion.jsp">
         <div class="form-outline mb-4">
             <input type="text" name="questionDescription" value="QuestionDescription..." onclick="this.value=''"/><br/>
         </div>
         <div class="form-outline mb-4">
             <input type="text" name="category"  value="Category..." onclick="this.value=''"/><br/>
         </div>
         <div class="form-outline mb-4">
             <input type="text" name="difficulty" value="Difficulty..." onclick="this.value=''"/><br/>
         </div>
         <div class="form-outline mb-4">
                      <input type="text" name="correctAnswer" value="CorrectAnswer..." onclick="this.value=''"/><br/>
         </div>
         <div class="form-outline mb-4">
                      <input type="text" name="incorrectAnswer1" value="IncorrectAnswer1..." onclick="this.value=''"/><br/>
         </div>
         <div class="form-outline mb-4">
                      <input type="text" name="incorrectAnswer2" value="IncorrectAnswer2..." onclick="this.value=''"/><br/>
         </div>
         <div class="form-outline mb-4">
                      <input type="text" name="incorrectAnswer3" value="IncorrectAnswer3..." onclick="this.value=''"/><br/>
                  </div>


     <br/>
     <input type="submit" value="Add question" class="btn btn-primary btn-block"/>
     </form>

    <br/>
    <br/>
    <h1>Find a Question by id</h1>

    <form action="findQuestionById.jsp">
         <div class="form-outline mb-4">
                     <input type="text" name="id" value="Enter Id..." onclick="this.value=''"/><br/>
                 </div>
         <br/>
            <input type="submit" value="Find question" class="btn btn-primary btn-block"/>
            </form>

 <br/>
 <br/>

    <h1>Find a Question by description</h1>

     <form action="findQuestionByDescription.jsp">
          <div class="form-outline mb-4">
                      <input type="text" name="questionDescription" value="Enter Description..." onclick="this.value=''"/><br/>
                  </div>
          <br/>
             <input type="submit" value="Find question" class="btn btn-primary btn-block"/>
             </form>

    <br/>
     <br/>

     <h2>Update a Question</h2>

          <form action="updateQuestion.jsp" method="post">
               <div class="form-outline mb-4">
                                 <input type="text" name="id" value="Id..." onclick="this.value=''"/><br/>
                  </div>
              <div class="form-outline mb-4">
                  <input type="text" name="questionDescription" value="QuestionDescription..." onclick="this.value=''"/><br/>
              </div>
              <div class="form-outline mb-4">
                  <input type="text" name="category"  value="Category..." onclick="this.value=''"/><br/>
              </div>
              <div class="form-outline mb-4">
                  <input type="text" name="difficulty" value="Difficulty..." onclick="this.value=''"/><br/>
              </div>
              <div class="form-outline mb-4">
                           <input type="text" name="correctAnswer" value="CorrectAnswer..." onclick="this.value=''"/><br/>
              </div>
              <div class="form-outline mb-4">
                           <input type="text" name="incorrectAnswer1" value="IncorrectAnswer1..." onclick="this.value=''"/><br/>
              </div>
              <div class="form-outline mb-4">
                           <input type="text" name="incorrectAnswer2" value="IncorrectAnswer2..." onclick="this.value=''"/><br/>
              </div>
              <div class="form-outline mb-4">
                           <input type="text" name="incorrectAnswer3" value="IncorrectAnswer3..." onclick="this.value=''"/><br/>
                       </div>


          <br/>
          <input type="submit" value="Update question" class="btn btn-primary btn-block"/>
          </form>


          <br/>
          <br/>

           <h3>Delete question</h3>

                    <form action="deleteQuestion.jsp">

                        <div class="form-outline mb-4">
                            <input type="text" name="id" value="Enter ID..." onclick="this.value=''"/><br/>
                        </div>
                       <br/>
                    <input type="submit" value="Delete question" class="btn btn-primary btn-block"/>
                    </form>
</body>
</html>