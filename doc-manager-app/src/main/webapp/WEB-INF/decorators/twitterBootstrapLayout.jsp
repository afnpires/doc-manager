<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="dec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">

    <title><dec:title default="docmanager" /></title>

    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        body {
            padding-top: 60px;
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }
    </style>
    <!-- See http://twitter.github.com/bootstrap/scaffolding.html#responsive -->
    <link href="/resources/css/bootstrap-responsive.min.css" rel="stylesheet" />

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="javascript"></script>
    <![endif]-->

    <dec:head />
</head>
<body>

<%@include file="bootstrapNavbar.jsp"%>

<div class="container-fluid">
    <div class="row-fluid">

        <div class="span3">
            <%@include file="bootstrapMenu.jsp"%>
        </div>

        <div class="span9">
            <dec:body />
        </div>

    </div>

    <hr>
    <footer>
        <p><spring:message code="main.footer.copyright" /></p>
    </footer>

</div>

<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script src="/resources/js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>