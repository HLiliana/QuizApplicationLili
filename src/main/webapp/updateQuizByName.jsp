<%@ page import="com.QuizApplication.model.Quiz, com.QuizApplication.repository.QuizRepository" %>
<%@ page import="com.QuizApplication.model.Question" %>
<%@ page import="com.QuizApplication.exception.BusinessException" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>

<%
    String name = request.getParameter("name");
    String newName = request.getParameter("newName");
    String newCategory = request.getParameter("newCategory");
    String newDifficulty = request.getParameter("newDifficulty");

    QuizRepository quizRepository = new QuizRepository();


    try{

        quizRepository.updateQuiz(name,newName,newCategory,newDifficulty);

        String confirmationMessage = "Your quiz has been updated.";

        request.getSession().invalidate();
        request.getSession().setAttribute("confirmationMessage", confirmationMessage);
        response.sendRedirect("mainQuiz.jsp");

        } catch(BusinessException e){

        request.setAttribute("errorMessage", e.getMessage());
        request.getRequestDispatcher("errorQuizAdd.jsp").forward(request, response);
        }

%>
