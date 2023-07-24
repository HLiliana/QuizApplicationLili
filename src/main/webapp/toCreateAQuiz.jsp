<h1> Here we are creating a Quiz</h1>

<h2>Add a quiz</h2>

     <form action="addQuiz.jsp">
         <div class="form-outline mb-4">
             <input type="text" name="name" value="Name..." onclick="this.value=''"/><br/>
         </div>
         <div class="form-outline mb-4">
             <input type="text" name="category"  value="Category..." onclick="this.value=''"/><br/>
         </div>
         <div class="form-outline mb-4">
             <input type="text" name="difficulty" value="Difficulty..." onclick="this.value=''"/><br/>
         </div>
         <div class="form-outline mb-4">
                  <input type="text" name="numberOfQuestions" value="Enter Number..." onclick="this.value=''"/><br/>
                          </div>

     <br/>
     <input type="submit" value="Create quiz" class="btn btn-primary btn-block"/>
     </form>