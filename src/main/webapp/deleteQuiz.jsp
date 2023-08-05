<%@ page import="com.QuizApplication.model.Quiz, com.QuizApplication.repository.QuizRepository" %>
<%@ page import="com.QuizApplication.model.Question" %>
<%@ page import="com.QuizApplication.exception.BusinessException" %>

<html>

<body>

<%
      String name = request.getParameter("name");

      QuizRepository repository = new QuizRepository();
      try{
          boolean isDeleted = repository.deleteQuiz(name);
          if(!isDeleted){
          request.setAttribute("errorMessage", "Something went wrong");
                response.sendRedirect("errorQuizAdd.jsp");

          }else {
          String confirmationMessageDelete = "Quiz was deleted";

          request.getSession().setAttribute("confirmationMessageDelete", confirmationMessageDelete);
          response.sendRedirect("mainQuiz.jsp");
                }
             }  catch(BusinessException e){
                request.setAttribute("errorMessage", e.getMessage());
                request.getRequestDispatcher("errorQuizAdd.jsp").forward(request, response);
          }


        %>

</body>

</html>

