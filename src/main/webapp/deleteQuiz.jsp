<%@ page import="com.QuizApplication.model.Quiz, com.QuizApplication.repository.QuizRepository" %>
<%@ page import="com.QuizApplication.model.Question" %>
<%@ page import="com.QuizApplication.exception.BusinessException" %>

<html>

<body>

<h1> We deleted a quiz </h1>



    <%
            String name = request.getParameter("name");
            String difficulty = request.getParameter("difficulty");

              QuizRepository repository = new QuizRepository();
              try{
              boolean isDeleted = repository.deleteQuiz(name,difficulty);
                if(!isDeleted){
                request.setAttribute("errorMessage", "Something went wrong");
                response.sendRedirect("errorQuizAdd.jsp");

                }else {
              String confirmationMessageDelete = "Quiz was deleted";

              request.getSession().invalidate();
                      request.getSession().setAttribute("confirmationMessageDelete", confirmationMessageDelete);
                      response.sendRedirect("mainQuiz.jsp");
                    }
                     } catch(BusinessException e){
                request.setAttribute("errorMessage", e.getMessage());
                request.getRequestDispatcher("errorQuizAdd.jsp").forward(request, response);
                      }


        %>

<form action="mainQuiz.jsp">
<input type="submit" value="Back to Quiz" class="btn btn-primary btn-block"/>
</form>
    </body>

</html>

