<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title><spring:message code="main.brand" /></title>
</head>
<body>
	<h1><spring:message code="message.welcome" /></h1>
    <ul>
        <li><a href="users/list"><spring:message code="users.menu.list" /></a></li>
        <li><a href="users/add"><spring:message code="users.menu.add" /></a></li>
    </ul>
</body>
</html>