<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>

<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container-fluid">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <a class="brand" href="#"><spring:message code="main.brand" /></a>
            <div class="nav-collapse collapse">
                    <c:if test="${pageContext.request.remoteUser != null}">
                        <c:url var="logoutUrl" value="/logout"/>
                        <form:form class="navbar-form pull-right" action="${logoutUrl}" method="post">
                            <input type="submit" value="<spring:message code="main.button.logout" />" />
                        </form:form>
                        <p class="navbar-text pull-right">
                            <spring:message code="main.nav.logged_in_as" /><a href="#" class="navbar-link"><c:out value="${pageContext.request.remoteUser}"/></a>
                        </p>
                    </c:if>
                <ul class="nav">
                    <li class="active"><a href="/"><spring:message code="main.nav.home" /></a></li>
                    <li><a href="#about"><spring:message code="main.nav.about" /></a></li>
                    <li><a href="#contact"><spring:message code="main.nav.contact" /></a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

</body>
</html>