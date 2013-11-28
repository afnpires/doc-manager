<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title><spring:message code="document.type.title.add" /></title>

    <style>
        tr.field-hidden {
            display: none;
        }
    </style>

    <script type="text/javascript">

        $(function(){
            $('form.form-horizontal').submit(function(e){
                $(this).find('.field-tr').each(function(index, elem){
                    var fieldName = "documentFields[" + index + "]";
                    $(elem).find('td input').prop('name', fieldName + '.name');
                    $(elem).find('td select').prop('name', fieldName + '.fieldType');
                });
            });
        });

        function newField(){
            var field = $('.field-hidden').clone();
            field.removeClass('field-hidden');
            field.addClass('field-tr');

            $('table tbody .field-hidden').before(field);
        };

        function removeField(e){
            $(e).parents('tr').remove();
        };
    </script>

</head>
<body>
    <h2><spring:message code="document.type.header.add" /></h2>
    <br>
    <form:form method="POST" action="/document-types/add">

        <div class="row-fluid">
            <div class="span2">
                <form:label class="control-label" path="name"><spring:message code="document.type.field.name" /></form:label>
            </div>
            <div class="span2">
                <form:input path="name" />
            </div>
        </div>

        <div class="row-fluid">
            <table class="table">
                <thead>
                <tr>
                    <th>Status</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th><input type="text" /></th>
                </tr>
                </tbody>
            </table>
        </div>

        <div class="row-fluid">
            <table class="table">
                <thead>
                <tr>
                    <th>Fields</th>
                    <th></th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="field" items="${documentType.documentFields}">
                    <tr class="field-tr">
                        <td><input type="text" value="${field.name}" /></td>
                        <td>
                            <form:select path="" items="${fieldTypes}"></form:select>
                        </td>
                        <td><a href="javascript:" onclick="removeField(this);">Remove</a></td>
                    </tr>
                </c:forEach>
                <tr class="field-hidden">
                    <td><input type="text" /></td>
                    <td>
                        <form:select path="" items="${fieldTypes}"></form:select>
                    </td>
                    <td><a href="javascript:" onclick="removeField(this);">Remove</a></td>
                </tr>
                <tr>
                    <td colspan="3"><a href="javascript:" onclick="newField();">New Field</a></td>
                </tr>
                </tbody>
            </table>
        </div>

        <div class="control-group">
            <div class="controls">
                <button class="btn btn-primary" type="submit"><spring:message code="save.lbl" /></button>
            </div>
        </div>

    </form:form>
</body>
</html>