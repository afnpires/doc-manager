<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Document Manager</title>
</head>
<body>
    <h1>Documents</h1>
    <c:if test="{!empty list}">
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Content Type</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="document" items="${list}">
            <tr>
                <td>${document.id}</td>
                <td>${document.name}</td>
                <td>${document.contentType}</td>
                <td><a href="/documents/get/${document.id}">Download</a></td>
                <td>
                    <form id="remove-form" action="/documents/remove/${role.id}" method="post">
                        <a href="javascript:" onclick="document.getElementById('remove-form').submit();">Remove</a>
                    </form>
                </td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
    </c:if>
</body>
</html>