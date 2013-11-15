<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
    <title>Doc Manager</title>
</head>
<body>
    <h1>Add Company</h1>
    <form:form method="POST" action="/companies/add">
        <table>
            <tr>
                <td><form:label path="shortName">Short Name</form:label></td>
                <td><form:input path="shortName" /></td>
            </tr>
            <tr>
                <td><form:label path="fullName">Full Name</form:label></td>
                <td><form:input path="fullName" /></td>
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