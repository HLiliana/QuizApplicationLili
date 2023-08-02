<%@ page import="com.QuizApplication.model.Quiz, com.QuizApplication.repository.QuizRepository" %>
<%@ page import="com.QuizApplication.model.Question, com.QuizApplication.repository.QuestionRepository" %>
<%@ page import="com.QuizApplication.exception.BusinessException" %>
<%@ page import="java.util.List" %>

<%
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String difficulty = request.getParameter("difficulty");
        String numberOfQuestions = request.getParameter("numberOfQuestions");
    try{
        QuestionRepository questionRepo = new QuestionRepository();
        List<Question> questionList = questionRepo.getAllQuestions();
        List<Question> aSortedList = questionRepo.groupByCategoryAndDifficulty(category, difficulty, questionList);
        List<Question> randomList = questionRepo.completeRandomQuestionList(numberOfQuestions, aSortedList);
        QuizRepository repository = new QuizRepository();
        Quiz quiz = repository.createQuiz(name, category, difficulty, randomList);
        repository.addQuiz(quiz);

        String successMessage = "Quiz was added.";
        request.setAttribute("successMessage", successMessage);
        request.getRequestDispatcher("successQuizAdd.jsp").forward(request, response);

        } catch (BusinessException e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("errorQuizAdd.jsp").forward(request, response);
        }
    %>

