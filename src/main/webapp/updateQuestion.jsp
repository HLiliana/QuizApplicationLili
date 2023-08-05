<%@ page import="com.QuizApplication.model.Quiz, com.QuizApplication.repository.QuizRepository" %>
<%@ page import="com.QuizApplication.model.Question, com.QuizApplication.repository.QuestionRepository" %>
<%@ page import="java.util.List" %>
<%@ page import="com.QuizApplication.exception.BusinessException" %>
<%@ page contentType="text/html; charset=UTF-8" %>

       <%
                            String id = request.getParameter("id");
                            String newQuestionDescription = request.getParameter("questionDescription");
                            String newCategory = request.getParameter("category");
                            String newDifficulty = request.getParameter("difficulty");
                            String newCorrectAnswer = request.getParameter("correctAnswer");
                            String newIncorrectAnswer1 = request.getParameter("incorrectAnswer1");
                            String newIncorrectAnswer2 = request.getParameter("incorrectAnswer2");
                            String newIncorrectAnswer3 = request.getParameter("incorrectAnswer3");
                            QuestionRepository repository = new QuestionRepository();
                            Question question = repository.findQuestionById(id);
                            question.setCategory(newCategory);
                            question.setDifficulty(newDifficulty);
                            question.setCorrectAnswer(newCorrectAnswer);
                            question.setIncorrectAnswer1(newIncorrectAnswer1);
                            question.setIncorrectAnswer2(newIncorrectAnswer2);
                            question.setIncorrectAnswer3(newIncorrectAnswer3);
                            question.setQuestionDescription(newQuestionDescription);
                            try{
                            repository.updateQuestion(question);
                                    String confirmationMessageUpdateQuestion = "Your question has been updated.";
                                    request.getSession().invalidate();
                                    request.getSession().setAttribute("confirmationMessageUpdateQuestion", confirmationMessageUpdateQuestion);
                                    response.sendRedirect("mainQuestion.jsp");

                                } catch(BusinessException e){

                                    request.setAttribute("errorMessage", e.getMessage());
                                    request.getRequestDispatcher("errorQuizAdd.jsp").forward(request, response);
                                        }
               %>
