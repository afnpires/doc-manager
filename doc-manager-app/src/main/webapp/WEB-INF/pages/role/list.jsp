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
            <th>Username</th>
            <th>Name</th>
            <th>Email</th>
            <th>Enabled</th>
            <th>Registration Date</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${list}">
            <tr>
                <td>${user.id}</td>
                <td>${user.username}</td>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>${user.enabled}</td>
                <td>${user.registrationDate}</td>
                <td>
                    <form id="remove-user" action="/users/remove/${user.id}" method="post">
                        <a href="javascript:" onclick="document.getElementById('remove-user').submit();">Remove</a>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</body>
</html>