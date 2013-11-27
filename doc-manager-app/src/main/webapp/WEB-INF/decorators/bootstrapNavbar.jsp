<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>

<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container-fluid">

            <a class="brand" href="/"><spring:message code="main.brand" /></a>
            <div class="nav-collapse collapse">
                <c:if test="${pageContext.request.remoteUser != null}">
                    <c:url var="logoutUrl" value="/logout" />
                    <c:url var="configUrl" value="/config" />

                    <ul class="nav">
                        <li><a href="/companies/list"><spring:message code="companies.menu.lbl" /></a></li>
                        <li><a href="/documents/list"><spring:message code="documents.menu.lbl" /></a></li>
                    </ul>

                    <form:form class="navbar-form pull-right" action="${logoutUrl}" method="post">
                        <button class="btn btn-link" type="submit" title="Logout">
                            <i class="icon-off icon-white" ></i>
                        </button>
                    </form:form>

                    <ul class="nav pull-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="icon-cog icon-white"></i>
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="disabled"><a>Profile</a></li>
                                <li class="divider"></li>
                                <li><a href="/document-types/list"><spring:message code="document.type.menu.lbl" /></a></li>
                                <li class="divider"></li>
                                <li><a href="/users/list"><spring:message code="users.menu.lbl" /></a></li>
                                <li><a href="/roles/list"><spring:message code="roles.menu.lbl" /></a></li>
                            </ul>
                        </li>
                    </ul>

                    <p class="navbar-text pull-right">
                        <spring:message code="main.nav.logged_in_as" />
                        <a href="#" class="navbar-link"><c:out value=" ${pageContext.request.remoteUser}"/></a>
                    </p>
                </c:if>
                <ul class="nav">
                    <%--<li class="active"><a href="/"><spring:message code="main.nav.home" /></a></li>--%>
                    <%--<li><a href="#about"><spring:message code="main.nav.about" /></a></li>--%>
                    <%--<li><a href="#contact"><spring:message code="main.nav.contact" /></a></li>--%>
                </ul>
                <ul class="dropdown-menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

</body>
</html>