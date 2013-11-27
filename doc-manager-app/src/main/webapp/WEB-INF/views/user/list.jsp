<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
    <title><spring:message code="user.title.list" /></title>
</head>
<body>
    <h2>${name}</h2>

    <div class="btn-toolbar">
        <div class="btn-group">
            <a class="btn" href="/users/add"><i class="icon-plus"></i> <spring:message code="users.menu.add" /></a>
        </div>
    </div>

    <br>

    <table class="table table-hover">
        <thead>
        <tr>
            <th><spring:message code="user.table.id" /></th>
            <th><spring:message code="user.table.username" /></th>
            <th><spring:message code="user.table.name" /></th>
            <th><spring:message code="user.table.email" /></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${list}">
            <tr>
                <td>${user.id}</td>
                <td>${user.username}</td>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>
                    <form:form id="remove-form" method="post" action="/users/remove/${user.id}">
                        <a href="javascript:" onclick="document.getElementById('remove-form').submit();"><spring:message code="table.button.remove" /></a>
                    </form:form>
                        <%--<form id="remove-form" action="/roles/remove/${role.id}" method="post">--%>
                        <%--<a href="javascript:" onclick="document.getElementById('remove-form').submit();"><spring:message code="table.button.remove" /></a>--%>
                        <%--</form>--%>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</body>
</html>