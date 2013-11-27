<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title><spring:message code="company.title.add" /></title>
</head>
<body>
    <h2><spring:message code="company.header.add" /></h2>
    <form:form method="POST" action="/companies/add">
        <table>
            <tr>
                <td><form:label path="shortName"><spring:message code="company.field.short.name" /></form:label></td>
                <td><form:input path="shortName" /></td>
            </tr>
            <tr>
                <td><form:label path="fullName"><spring:message code="company.field.full.name" /></form:label></td>
                <td><form:input path="fullName" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="Submit" />
                </td>
            </tr>
        </table>
    </form:form>
</body>
</html>