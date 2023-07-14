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