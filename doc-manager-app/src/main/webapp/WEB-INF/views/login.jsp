<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
    <title><spring:message code="main.brand" /></title>
</head>
<body>
<c:url value="/login" var="loginUrl"/>
<form:form name="f" action="${loginUrl}" method="post">
    <fieldset>
        <legend><spring:message code="login.header" /></legend>
        <c:if test="${param.error != null}">
            <div class="alert alert-error">
                <spring:message code="login.error.invalid" />
            </div>
        </c:if>
        <c:if test="${param.logout != null}">
            <div class="alert alert-success">
                <spring:message code="login.success.logged_out" />
            </div>
        </c:if>
        <label for="username"><spring:message code="login.field.username" /></label>
        <input type="text" id="username" name="username"/>
        <label for="password"><spring:message code="login.field.password" /></label>
        <input type="password" id="password" name="password"/>
        <div class="form-actions">
            <button type="submit" class="btn"><spring:message code="login.button.login" /></button>
        </div>
    </fieldset>
</form:form>
</body>
</html>
