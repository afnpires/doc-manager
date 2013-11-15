<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>DocManager</title>
</head>
<body>
    <h1>Users</h1>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Short Name</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="role" items="${list}">
            <tr>
                <td>${role.id}</td>
                <td>${role.shortName}</td>
                <td>${role.fullName}</td>
                <td>
                    <form id="remove-form" action="/companies/remove/${role.id}" method="post">
                        <a href="javascript:" onclick="document.getElementById('remove-form').submit();">Remove</a>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</body>
</html>