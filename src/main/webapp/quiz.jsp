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
  </head>
<body>
<h1> Please pick a choice</h1>

<table>
<tr>
<td><form action="mainQuestion.jsp">
<input type="submit" value="To Questions" class="btn btn-primary btn-block"/> </form> </td>
<td><form action="mainQuiz.jsp">
<input type="submit" value="To Quiz" class="btn btn-primary btn-block"/> </form></td>
</tr>
</table>

<form action = "mainQuiz.jsp">
<input type="button" value="To quizzes" name="mainQuiz"
    onclick="openPage('mainQuiz.jsp')"/>

    </form>
    <script type="text/javascript">
     function openPage(pageURL)
     {
     window.location.href = pageURL;
     }
    </script>

</body>
</html>
