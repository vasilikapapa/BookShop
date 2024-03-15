<%-- 
    Document   : register
    Created on : May 1, 2023, 8:35:35 AM
    Author     : VasilikaPapa
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>New User Registration</title>
    </head>
    <body>
        <h1>New User Registration</h1>
         <p><i>${message}</i></p>
    <form action="emailList" method="post">
        <input type="hidden" name="action" value="add">        
        <label class="pad_top">Email:</label>
        <input type="email" name="email" value="${user.email}" 
               required><br>
         <label class="pad_top">Password:</label>
        <input type="password" name="password" value="${user.password}" 
               required><br>
        <label class="pad_top">First Name:</label>
        <input type="text" name="firstName" value="${user.firstName}" 
               required><br>
        <label class="pad_top">Last Name:</label>
        <input type="text" name="lastName" value="${user.lastName}"  
               required><br>        
        <label>&nbsp;</label>
        <input type="submit" value="Join Now" class="margin_left">
    </form>
    </body>
</html>
