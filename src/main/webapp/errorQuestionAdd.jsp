<%@ page import="com.QuizApplication.repository.QuestionRepository" %>
<%@ page import="com.QuizApplication.model.Question" %>
<%@ page import="com.QuizApplication.exception.BusinessException" %>


<html>
<head>
    <title>Error Page</title>
</head>
<body>
    <h1>Error</h1>
    <p>${errorMessage}</p>
</body>
</html>