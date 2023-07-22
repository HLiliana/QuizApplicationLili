<html>
<body>

<h1> Here we are creating a random list of Questions</h1>


<form action="randomQuestion.jsp">
         <div class="form-outline mb-4">
         <input type="text" name="numberOfQuestions" value="Enter Number..." onclick="this.value=''"/><br/>
                 </div>
         <div class="form-outline mb-4">
                  <input type="text" name="category" value="Enter Category..." onclick="this.value=''"/><br/>
                          </div>
         <div class="form-outline mb-4">
                  <input type="text" name="difficulty" value="Enter difficulty..." onclick="this.value=''"/><br/>
                          </div>
         <input type="submit" value="Create Random Questions" class="btn btn-primary btn-block"/>
         </form>

</body>
</html>