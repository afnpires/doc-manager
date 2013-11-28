<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title><spring:message code="document.field.title.add" /></title>
</head>
<body>
    <h2><spring:message code="document.field.header.add" /></h2>
    <form:form method="POST" action="/document-fields/add">
        <table>
            <tr>
                <td><label path="docTypes"><spring:message code="document.field.field.document.type" /></label></td>
                <td>
                    <select name="docType">
                        <c:forEach items="${docTypes}" var="docType">
                            <option value="${docType.id}">${docType.name}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label path="name"><spring:message code="document.field.field.name" /></label></td>
                <td><input name="name" /></td>
            </tr>
            <tr>
                <td><label path="fieldType"><spring:message code="document.field.field.field.type" /></label></td>
                <td>
                    <select name="fieldType">
                        <c:forEach items="${fieldTypes}" var="fieldType">
                            <option value="${fieldType}">${fieldType}</option>
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