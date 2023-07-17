<%@ page import="com.QuizApplication.model.Quiz, com.QuizApplication.repository.QuizRepository" %>
<%@ page import="com.QuizApplication.model.Question" %>
<%@ page import="com.QuizApplication.exception.BusinessException" %>

<%
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String difficulty = request.getParameter("difficulty");

        Quiz quiz = new Quiz(name,category,difficulty);

    try{
        QuizRepository repository = new QuizRepository();
        repository.addQuiz(quiz);

        boolean validateName = repository.isNameValid(name);

        if(validateName){
        String message = "Quiz was added.";
        request.setAttribute("successMessage", message);
        request.getRequestDispatcher("successQuizAdd.jsp").forward(request, response);
        } else {
                throw new IllegalStateException("Quiz add failed.");
            }
        } catch (BusinessException e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("errorQuizAdd.jsp").forward(request, response);
        }
    %>

