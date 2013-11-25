<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title><spring:message code="document.title.add" /></title>
</head>
<body>
    <h1><spring:message code="document.header.add" /></h1>
    <form:form method="post" action="/documents/add?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
        <table>
            <tr>
                <td><label path="name"><spring:message code="document.field.name" /></label></td>
                <td><input type="text" name="name" /></td>
            </tr>
            <tr>
                <td><label path="documentType"><spring:message code="document.field.document.type" /></label></td>
                <td>
                    <select name="documentType">
                        <c:forEach items="${types}" var="type">
                            <option value="${type.id}">${type.name}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label path="file"><spring:message code="document.field.file" /></label></td>
                <td><input type="file" name="file" id="file" /></td>
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