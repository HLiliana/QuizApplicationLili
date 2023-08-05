<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page import="java.util.List" %>
<%@ page import="com.QuizApplication.model.User" %>
<%@ page import="com.QuizApplication.repository.UserRepository" %>
<%@ page import="com.QuizApplication.exception.BusinessException" %>

<%
    UserRepository userRepository = new UserRepository();
    String loggedInEmail = session.getAttribute("loggedInEmail").toString();
    String username = session.getAttribute("username").toString();

    session.setAttribute("loggedInEmail", loggedInEmail);

    User user = userRepository.getUserByEmail(loggedInEmail);
%>

<html>
    <head><meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
    <link rel="stylesheet" href="style2.css">
    <title>Update Account Information</title>
    </head>
<body>
    <h1>Account Information for <%=username%></h1>

    <form action="updateUser.jsp">
         <div class="form-outline mb-4">
             <input type="text" name="username" value="<%= user.getUsername() %>"  required/><br/>
         </div>
         <div class="form-outline mb-4">
             <input type="text" name="password"  value="<%= user.getPassword() %>" required/><br/>
         </div>
         <div class="form-outline mb-4">
             <input type="text" name="phone" value="<%= user.getPhone() %>" required/><br/>
         </div>
         <div class="form-outline mb-4">
             <input type="text" name="email" value="<%=user.getEmail() %>"  required/><br/>
         </div>
           <br>
           <br>

        <h1>Update Your account information</h1>
         <div class="form-outline mb-4">
             <input type="text" name="newUsername" value="New username..." onclick="this.value=''" required/><br/>
         </div>
         <div class="form-outline mb-4">
             <input type="text" name="newPassword"  value="New password..." onclick="this.value=''" required/><br/>
         </div>
         <div class="form-outline mb-4">
             <input type="text" name="confirmPassword" value="Confirm password..." onclick="this.value=''" required/><br/>
         </div>
         <div class="form-outline mb-4">
             <input type="text" name="newPhone" value="New phone number..." onclick="this.value=''" required/><br/>
         </div>
         <br>
         <input type="submit" value="Update">
    </form>

    <h1>Delete Account Information</h1>
    <form action="deleteUser.jsp">
             <div class="form-outline mb-4">
                 <input type="text" name="email" value="Email..." onclick="this.value=''"/><br/>
             </div>
             <div class="form-outline mb-4">
                 <input type="text" name="password"  value="Password..." onclick="this.value=''"/><br/>
             </div>
             <div class="form-outline mb-4">
                 <input type="text" name="confirmPassword" value="Confirm password..." onclick="this.value=''"/><br/>
             </div>
             <br>
              <input type ="submit" value="Delete user">



</body>
</html>