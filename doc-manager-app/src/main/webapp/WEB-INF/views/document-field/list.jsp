<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title><spring:message code="document.field.title" /></title>
</head>
<body>
    <h2><spring:message code="document.field.header" /></h2>
    <div class="btn-toolbar">
        <div class="btn-group">
            <a class="btn" href="/document-fields/add"><i class="icon-plus"></i> <spring:message code="document.field.menu.add" /></a>
        </div>
    </div>
    <br>
    <table class="table table-hover">
        <thead>
        <tr>
            <th><spring:message code="document.field.table.id" /></th>
            <th><spring:message code="document.field.table.document.type" /></th>
            <th><spring:message code="document.field.table.name" /></th>
            <th><spring:message code="document.field.table.field.type" /></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="documentField" items="${list}">
            <tr>
                <td>${documentField.id}</td>
                <td>${documentField.documentType.name}</td>
                <td>${documentField.name}</td>
                <td>${documentField.fieldType}</td>
                <td>
                    <form id="remove-form" action="/document-field/remove/${documentField.id}" method="post">
                        <button class="btn btn-link" type="submit" value=""><spring:message code="table.button.remove" /></button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</body>
</html>