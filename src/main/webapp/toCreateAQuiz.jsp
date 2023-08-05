<html>
<head>
<link rel="stylesheet" href="style2.css">
</head>

<body>

<h1>Create quiz</h1>

     <form action="createQuiz.jsp">
         <div class="form-outline mb-4">
             <input type="text" name="name" value="Name..." onclick="this.value=''" required/><br/>
         </div>
         <div class="form-outline mb-4">
             <input type="text" name="category"  value="Category..." onclick="this.value=''" required/><br/>
         </div>
         <div class="form-outline mb-4">
             <input type="text" name="difficulty" value="Difficulty..." onclick="this.value=''" required/><br/>
         </div>
         <div class="form-outline mb-4">
                  <input type="text" name="numberOfQuestions" value="Enter Number..." onclick="this.value=''" required/><br/>
                          </div>

     <br/>
     <input type="submit" value="Create quiz" class="btn btn-primary btn-block"/>
     </form>

</body>
</html>