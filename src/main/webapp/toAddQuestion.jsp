<h1> Here we are adding a Question</h1>

<h2>Add a question</h2>

     <form action="addQuestion.jsp">
         <div class="form-outline mb-4">
             <input type="text" name="questionDescription" value="Question..." onclick="this.value=''"/><br/>
         </div>
         <div class="form-outline mb-4">
             <input type="text" name="category"  value="Category..." onclick="this.value=''"/><br/>
         </div>
         <div class="form-outline mb-4">
             <input type="text" name="difficulty" value="Difficulty..." onclick="this.value=''"/><br/>
         </div>
         <div class="form-outline mb-4">
             <input type="text" name="correctAnswer" value="Correct answer..." onclick="this.value=''"/><br/>
         </div>
         <div class="form-outline mb-4">
              <input type="text" name="incorrectAnswer1" value="IncorrectAnswer 1..." onclick="this.value=''"/><br/>
          </div>
          <div class="form-outline mb-4">
             <input type="text" name="incorrectAnswer2" value="IncorrectAnswer 2..." onclick="this.value=''"/><br/>
         </div>
         <div class="form-outline mb-4">
             <input type="text" name="incorrectAnswer3" value="IncorrectAnswer 3..." onclick="this.value=''"/><br/>
         </div>


     <br/>
     <input type="submit" value="Add question" class="btn btn-primary btn-block"/>
     </form>