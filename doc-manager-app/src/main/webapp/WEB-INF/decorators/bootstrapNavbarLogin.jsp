<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
                <ul class="nav">
                    <li><a href="#about"><spring:message code="main.nav.about" /></a></li>
                    <li><a href="#contact"><spring:message code="main.nav.contact" /></a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

</body>
</html>