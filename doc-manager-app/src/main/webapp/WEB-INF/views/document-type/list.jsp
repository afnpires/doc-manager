<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title><spring:message code="document.type.title.list" /></title>
</head>
<body>
    <h1><spring:message code="document.type.header.list" /></h1>
    <table>
        <thead>
        <tr>
            <th><spring:message code="document.type.table.id" /></th>
            <th><spring:message code="document.type.table.name" /></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="documentType" items="${list}">
            <tr>
                <td>${documentType.id}</td>
                <td>${documentType.name}</td>
                <td>
                    <form id="remove-form" action="/document-types/remove/${role.id}" method="post">
                        <a href="javascript:" onclick="document.getElementById('remove-form').submit();"><spring:message code="table.button.remove" /></a>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</body>
</html>