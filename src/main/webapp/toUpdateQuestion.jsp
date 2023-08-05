<html>
<head>
<link rel="stylesheet" href="style2.css">
</head>
<body>

<h2>Update question</h2>

     <form action="updateQuestion.jsp">
             <div class="form-outline mb-4">
                  <input type="text" name="id" value="Id..." onclick="this.value=''" required/><br/>
              </div>
         <div class="form-outline mb-4">
             <input type="text" name="questionDescription" value="Question..." onclick="this.value=''" required/><br/>
         </div>
         <div class="form-outline mb-4">
             <input type="text" name="category"  value="Category..." onclick="this.value=''" required/><br/>
         </div>
         <div class="form-outline mb-4">
             <input type="text" name="difficulty" value="Difficulty..." onclick="this.value=''" required/><br/>
         </div>
         <div class="form-outline mb-4">
             <input type="text" name="correctAnswer" value="Correct answer..." onclick="this.value=''" required/><br/>
         </div>
         <div class="form-outline mb-4">
              <input type="text" name="incorrectAnswer1" value="IncorrectAnswer 1..." onclick="this.value=''" required/><br/>
          </div>
          <div class="form-outline mb-4">
             <input type="text" name="incorrectAnswer2" value="IncorrectAnswer 2..." onclick="this.value=''" required/><br/>
         </div>
         <div class="form-outline mb-4">
             <input type="text" name="incorrectAnswer3" value="IncorrectAnswer 3..." onclick="this.value=''" required/><br/>
         </div>


     <br/>
     <input type="submit" value="Update Question" class="btn btn-primary btn-block"/>
     </form>

</body>
</html>