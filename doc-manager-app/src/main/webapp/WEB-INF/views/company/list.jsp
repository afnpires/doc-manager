<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title><spring:message code="company.title.list" /></title>
</head>
<body>
    <h2><spring:message code="company.header.list" /></h2>
    <div class="btn-toolbar">
        <div class="btn-group">
            <a class="btn" href="/companies/add"><i class="icon-plus"></i> <spring:message code="companies.menu.add" /></a>
        </div>
    </div>
    <br>
    <table class="table table-hover">
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
                    <form class="remove-form" action="/companies/remove/${role.id}" method="post">
                        <button class="btn btn-link" type="submit" value=""><spring:message code="table.button.remove" /></button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</body>
</html>