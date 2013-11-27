<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title><spring:message code="document.type.title" /></title>
</head>
<body>
    <h2><spring:message code="document.type.header" /></h2>
    <div class="btn-toolbar">
        <div class="btn-group">
            <a class="btn" href="/document-types/add"><i class="icon-plus"></i> <spring:message code="document.type.menu.add" /></a>
        </div>
    </div>
    <br>
    <table class="table table-hover">
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
                        <button class="btn btn-link" type="submit" value=""><spring:message code="table.button.remove" /></button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</body>
</html>