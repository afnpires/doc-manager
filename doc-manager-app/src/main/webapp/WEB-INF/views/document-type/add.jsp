<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title><spring:message code="document.type.title.add" /></title>
</head>
<body>
    <h1><spring:message code="document.type.header.add" /></h1>
    <form:form method="POST" action="/document-types/add">
        <table>
            <tr>
                <td><form:label path="name"><spring:message code="document.type.field.name" /></form:label></td>
                <td><form:input path="name" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="Submit"/>
                </td>
            </tr>
        </table>
    </form:form>
</body>
</html>