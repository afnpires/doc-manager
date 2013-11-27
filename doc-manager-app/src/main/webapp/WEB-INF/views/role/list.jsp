<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
    <title><spring:message code="role.title.list" /></title>
</head>
<body>
    <h2><spring:message code="role.header.list" /></h2>

    <div class="btn-toolbar">
        <div class="btn-group">
            <a class="btn" href="/roles/add"><i class="icon-plus"></i> <spring:message code="roles.menu.add" /></a>
        </div>
    </div>
    <br>
    <table class="table table-hover">
        <thead>
        <tr>
            <th><spring:message code="role.table.id" /></th>
            <th><spring:message code="role.table.name" /></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="role" items="${list}">
            <tr>
                <td>${role.id}</td>
                <td>${role.name}</td>
                <td>
                    <form:form id="remove-form" method="post" action="/roles/remove/${role.id}">
                        <button class="btn btn-link" type="submit" value=""><spring:message code="table.button.remove" /></button>
                    </form:form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</body>
</html>