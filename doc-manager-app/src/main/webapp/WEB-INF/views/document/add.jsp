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
    <form:form method="POST" action="/documents/add" enctype="multipart/form-data">
        <table>
            <tr>
                <td><form:label path="name"><spring:message code="document.field.name" /></form:label></td>
                <td><form:input path="name" /></td>
            </tr>
            <tr>
                <td><form:label path="documentType"><spring:message code="document.field.document.type" /></form:label></td>
                <td>
                    <form:select path="documentType">
                        <form:options items="${types}" itemValue="id" itemLabel="name" />
                    </form:select>
                </td>
            </tr>
            <tr>
                <td><form:label path="content"><spring:message code="document.field.file" /></form:label></td>
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