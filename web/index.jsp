<%@page import="java.util.ArrayList"%>
<%@page import="murach.business.Product"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@page import="murach.data.ProductDB"%>
<%@page import="murach.Servlet.ProductServlet"%>
<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
    <title>Homework 5 </title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
</head>
<body>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>Book list</h1>
<%= ProductDB.getHtmlTable() %>
        
</body>
</html>