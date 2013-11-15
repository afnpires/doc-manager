<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title><spring:message code="user.title.add" /></title>
</head>
<body>
    <h1><spring:message code="user.header.add" /></h1>
    <form:form method="POST" action="/users/add">
        <table>
            <tr>
                <td><form:label path="username"><spring:message code="user.field.username" /></form:label></td>
                <td><form:input path="username" /></td>
            </tr>
            <tr>
                <td><form:label path="password"><spring:message code="user.field.password" /></form:label></td>
                <td><form:password path="password" /></td>
            </tr>
            <tr>
                <td><form:label path="name"><spring:message code="user.field.name" /></form:label></td>
                <td><form:input path="name" /></td>
            </tr>
            <tr>
                <td><form:label path="email"><spring:message code="user.field.email" /></form:label></td>
                <td><form:input path="email" /></td>
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