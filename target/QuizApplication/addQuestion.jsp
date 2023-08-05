<%@ page import="com.QuizApplication.model.Quiz, com.QuizApplication.repository.QuizRepository" %>
<%@ page import="com.QuizApplication.model.Question, com.QuizApplication.repository.QuestionRepository" %>
<%@ page import="com.QuizApplication.exception.BusinessException" %>


<%
        String questionDescription = request.getParameter("questionDescription");
        String category = request.getParameter("category");
        String difficulty = request.getParameter("difficulty");
        String correctAnswer = request.getParameter("correctAnswer");
        String incorrectAnswer1 = request.getParameter("incorrectAnswer1");
        String incorrectAnswer2 = request.getParameter("incorrectAnswer2");
        String incorrectAnswer3 = request.getParameter("incorrectAnswer3");

     try{
        QuestionRepository repository = new QuestionRepository();
        Question question = new Question(questionDescription,category,difficulty, correctAnswer,incorrectAnswer1,incorrectAnswer2,incorrectAnswer3);
        repository.addQuestion(question);

        String successMessage = "Question was added.";
        request.setAttribute("successMessage", successMessage);
        request.getRequestDispatcher("successQuestionAdd.jsp").forward(request, response);

        } catch (BusinessException e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("errorQuestionAdd.jsp").forward(request, response);
        }

    %>
