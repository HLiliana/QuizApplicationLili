<html>
<head>
    <Title> Update quiz </title>
</head>
<body>
<h1> Here we are updating</h1>
<h1> Update a quiz </h1>
<form action="updateQuiz.jsp" method="post">
<div class="form-outline mb-4">
                             <input type="text" name="id" value="Enter Id..." onclick="this.value=''"/>
                             <br/>
                         </div>
    <div class="form-outline mb-4">
                             <input type="text" name="name" value="Name..." onclick="this.value=''"/>
                             <br/>
                         </div>
    <div class="form-outline mb-4">
               <input type="text" name="category" value="Category..." onclick="this.value=''"/>
               <br/>
                   </div>

   <div class="form-outline mb-4">
                <input type="text" name="difficulty" value="Difficulty..." onclick="this.value=''"/>
                <br/>
                    </div>

    <input type="submit" value="Update quiz" class="btn btn-primary btn-block"/>
</form>

<h2> Update quiz by name </h2>
<form action="updateQuizByName.jsp" method="post">
<label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
        <br>
<label for="newName">New name:</label>
        <input type="text" id="newName" name="newName" required>
        <br>
<label for="newCategory">Category:</label>
        <input type="text" id="newCategory" name="newCategory" required>
        <br>
<label for="newDifficulty">Difficulty:</label>
        <input type="text" id="newDifficulty" name="newDifficulty" required>
        <br>

    <input type="submit" value="Update quiz by name"/>
</form>

</body>
</html>