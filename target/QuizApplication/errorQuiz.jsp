<html>
<body>

<h3> You have entered a wrong quiz id </h3>
<h3>Please use a valid Id</h3>

<form action="findQuizById.jsp">
     <div class="form-outline mb-4">
                 <input type="text" name="id" value="Id..." onclick="this.value=''"/><br/>
             </div>
     <br/>
        <input type="submit" value="Find quiz" class="btn btn-primary btn-block"/>
        </form>

<form action="mainQuiz.jsp" method="get">
<input type="submit" value="To Quiz Page">


</body>
</html>