<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title><spring:message code="company.title.list" /></title>
</head>
<body>
    <h1><spring:message code="company.header.list" /></h1>
    <table>
        <thead>
        <tr>
            <th><spring:message code="company.table.header.id" /></th>
            <th><spring:message code="company.table.short.name" /></th>
            <th><spring:message code="company.table.full.name" /></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="role" items="${list}">
            <tr>
                <td>${role.id}</td>
                <td>${role.shortName}</td>
                <td>${role.fullName}</td>
                <td>
                    <form id="remove-form" action="/companies/remove/${role.id}" method="post">
                        <a href="javascript:" onclick="document.getElementById('remove-form').submit();"><spring:message code="table.button.remove" /></a>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</body>
</html>