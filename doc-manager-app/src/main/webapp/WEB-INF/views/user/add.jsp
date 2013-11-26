<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title><spring:message code="user.title.add" /></title>
</head>
<body>
    <h1><spring:message code="user.header.add" /></h1>
    <form:form method="post" action="/users/add">
        <table>
            <tr>
                <td><label for="user-username"><spring:message code="user.field.username" /></label></td>
                <td><input id="user-username" type="text" name="username" /></td>

            </tr>
            <tr>
                <td><label for="user-password"><spring:message code="user.field.password" /></label></td>
                <td><input id="user-password" type="password" name="password" /></td>
            </tr>
            <tr>
                <td><label for="user-name"><spring:message code="user.field.name" /></label></td>
                <td><input id="user-name" type="text" name="name" /></td>
            </tr>
            <tr>
                <td><label for="user-email" ><spring:message code="user.field.email" /></label></td>
                <td><input id="user-email" type="text" name="email" /></td>
            </tr>
            <tr>
                <td><label for="user-enabled"><spring:message code="user.field.enabled" /></label></td>
                <td><input id="user-enabled" type="checkbox" name="enabled" /></td>
            </tr>
            <tr>
                <td><label for="user-role"><spring:message code="user.field.role" /> </label></td>
                <td>
                <select id="user-role" name="role">
                    <c:forEach items="${roles}" var="role">
                        <option value="${role.id}">${role.name}</option>
                    </c:forEach>
                </select>
                </td>
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