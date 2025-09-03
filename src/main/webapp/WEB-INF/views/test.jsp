<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSP Test Page</title>
</head>
<body>
    <h1>JSP Test Page</h1>
    <p>Message from Controller: ${testMessage}</p>
    <p>Current Time: <%= new java.util.Date() %></p>
    <a href="/">Go to Index</a>
</body>
</html>
