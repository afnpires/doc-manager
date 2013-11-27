<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title><spring:message code="main.brand" /></title>
</head>
<body>
	<h1><spring:message code="message.welcome" /></h1>
    <ul>
        <li><a href="companies/list"><spring:message code="companies.menu.list" /></a></li>
        <li><a href="companies/add"><spring:message code="companies.menu.add" /></a></li>
        <br />
        <li><a href="document-types/list"><spring:message code="document.type.menu.list" /></a></li>
        <li><a href="document-types/add"><spring:message code="document.type.menu.add" /></a></li>
        <br />
        <li><a href="documents/list"><spring:message code="document.menu.list" /></a></li>
        <li><a href="documents/add"><spring:message code="document.menu.add" /></a></li>
    </ul>
</body>
</html>