<%@ page import="com.QuizApplication.repository.UserRepository" %>
<%@ page import="com.QuizApplication.exception.BusinessException" %>
<%@ page import="com.QuizApplication.model.User" %>
<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII" isErrorPage="true"%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">

    <title>Error Page</title>
</head>
<body>

<% if (response.getStatus() == 200) { %>
    <font color="red">Error: <%= request.getAttribute("errorMessage") %></font><br>
    <% String redirectTo = session.getAttribute("redirectTo").toString(); %>
          <%if (redirectTo != null && redirectTo.equals("editUserInformation")) { %>
                    <%@ include file="editUserInformation.jsp" %>
          <% } else  if (redirectTo!= null && redirectTo.equals("index")){ %>
                    <%@ include file="index.jsp" %>
          <% } else if(redirectTo != null && redirectTo.equals("signup")) {%>
                    <%@ include file="signup.jsp"%>
          <% } %>
<% } else { %>
    Hi there, error code is <%= response.getStatus() %><br>
    Please go to <a href="/index.jsp">home page</a>
<% } %>
</body>
</html>