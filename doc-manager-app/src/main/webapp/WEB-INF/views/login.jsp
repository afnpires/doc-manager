<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title><spring:message code="login.header" /> &middot; <spring:message code="main.brand" /></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link href="/resources/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
        body {
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #f5f5f5;
        }

        .form-signin {
            max-width: 300px;
            padding: 19px 29px 29px;
            margin: 0 auto 20px;
            background-color: #fff;
            border: 1px solid #e5e5e5;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
            -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
            box-shadow: 0 1px 2px rgba(0,0,0,.05);
        }
        .form-signin .form-signin-heading,
        .form-signin .checkbox {
            margin-bottom: 10px;
        }
        .form-signin input[type="text"],
        .form-signin input[type="password"] {
            font-size: 16px;
            height: auto;
            margin-bottom: 15px;
            padding: 7px 9px;
        }

    </style>
    <link href="/resources/css/bootstrap-responsive.css" rel="stylesheet">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="javascript"></script>
    <![endif]-->

    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/resources/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/resources/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/resources/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="/resources/ico/apple-touch-icon-57-precomposed.png">
    <link rel="shortcut icon" href="/resources/ico/favicon.png">
</head>

<body>

<div class="container">
    <c:url value="/login" var="loginUrl"/>
    <form:form name="f" action="${loginUrl}" method="post" class="form-signin">
        <h2 class="form-signin-heading"><spring:message code="login.header" /></h2>
        <fieldset>
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
            <input type="text" class="input-block-level" placeholder="<spring:message code="login.field.username" />" id="username" name="username">
            <input type="password" class="input-block-level" placeholder="<spring:message code="login.field.password" />" id="password" name="password">
            <label class="checkbox">
                <input type="checkbox" value="remember-me"><spring:message code="login.field.remember_me" />
            </label>
            <button class="btn btn-large btn-primary" type="submit"><spring:message code="login.button.login" /></button>
        </fieldset>
    </form:form>
</div>

<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script src="/resources/js/bootstrap-transition.js"></script>
<script src="/resources/js/bootstrap-alert.js"></script>
<script src="/resources/js/bootstrap-modal.js"></script>
<script src="/resources/js/bootstrap-dropdown.js"></script>
<script src="/resources/js/bootstrap-scrollspy.js"></script>
<script src="/resources/js/bootstrap-tab.js"></script>
<script src="/resources/js/bootstrap-tooltip.js"></script>
<script src="/resources/js/bootstrap-popover.js"></script>
<script src="/resources/js/bootstrap-button.js"></script>
<script src="/resources/js/bootstrap-collapse.js"></script>
<script src="/resources/js/bootstrap-carousel.js"></script>
<script src="/resources/js/bootstrap-typeahead.js"></script>

</body>
</html>
