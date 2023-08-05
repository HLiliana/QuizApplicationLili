<%@ page import="com.QuizApplication.model.Quiz, com.QuizApplication.repository.QuizRepository" %>
<%@ page import="com.QuizApplication.model.Question" %>
<%@ page import="com.QuizApplication.model.User, com.QuizApplication.repository.UserRepository" %>
<%@ page import="com.QuizApplication.exception.BusinessException" %>

<html>

<body>
<%
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String difficulty = request.getParameter("difficulty");

        User authenticatedUser = (User) session.getAttribute("authenticatedUser");

    try{
        Quiz quiz = new Quiz(name,category,difficulty);

        UserRepository repository = new UserRepository();
        repository.addQuizToUserToDatabase(authenticatedUser,quiz);

        String successMessageAddQuiz = "Quiz was added.";

        request.getSession().setAttribute("successMessageAddQuiz", successMessageAddQuiz);
        response.sendRedirect("mainQuiz.jsp");

        } catch (BusinessException e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("errorQuizAdd.jsp").forward(request, response);
        }
    %>

</body>

</html>
