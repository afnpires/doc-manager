<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="j" %>
<html>
<head>
    <title>DocManager</title>
</head>
<body>
    <h1>List of ${name}</h1>
    <ul>
        <j:forEach var="user" items="${list}">
            <li>${user.id} - ${user.username} - ${user.name} - ${user.email}</li>
        </j:forEach>
    </ul>
</body>
</html>