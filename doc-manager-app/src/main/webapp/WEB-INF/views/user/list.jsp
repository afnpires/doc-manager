<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title><spring:message code="user.title.list" /></title>
</head>
<body>
    <h1><spring:message code="user.header.list" /> ${name}</h1>
    <ul>
        <c:forEach var="user" items="${list}">
            <li>${user.id} - ${user.username} - ${user.name} - ${user.email}</li>
        </c:forEach>
    </ul>
</body>
</html>