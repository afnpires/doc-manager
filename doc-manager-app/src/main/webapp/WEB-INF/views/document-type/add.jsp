<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title><spring:message code="document.type.title.add" /></title>

    <style>
        tr.field-hidden, tr.status-hidden {
            display: none;
        }

        table.table input, table.table select {
            margin-bottom: 0px !important;
        }
    </style>

    <script type="text/javascript">

        $(function(){
            $('table.table').on('click', 'a.new-btn', newField);
            $('table.table').on('click', 'a.remove-btn', removeField);

            $('form').submit(function(e){
                $(this).find('.field-tr').each(function(index, elem){
                    var fieldName = "documentFields[" + index + "]";
                    $(elem).find('td input').prop('name', fieldName + '.name');
                    $(elem).find('td select').prop('name', fieldName + '.fieldType');
                });

                $(this).find('.status-tr').each(function(index, elem){
                    var fieldName = "documentStatuses[" + index + "]";
                    $(elem).find('td input').prop('name', fieldName + '.value');
                });
            });
        });

        function newField(e){
            var parentClss = $(e.target).parents('div.row-fluid')[0].className.replace('row-fluid ', '');
            var field = $('.' + parentClss + '-hidden').clone();
            field.removeClass(parentClss + '-hidden');
            field.addClass(parentClss + '-tr');

            $('table tbody .' + parentClss + '-hidden').before(field);
        };

        function removeField(e){
            $(e.target).parents('tr').remove();
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

        <div class="row-fluid status">
            <table class="table">
                <thead>
                <tr>
                    <th>Status</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach var="field" items="${documentType.documentFields}">
                        <tr class="status-tr">
                            <td><input type="text" value="${field.value}" /></td>
                            <td><a href="javascript:" class="remove-btn">Remove</a></td>
                        </tr>
                    </c:forEach>
                    <tr class="status-hidden">
                        <td><input type="text" /></td>
                        <td><a href="javascript:" class="remove-btn">Remove</a></td>
                    </tr>
                    <tr>
                        <td colspan="3"><a href="javascript:" class="new-btn">New Field</a></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="row-fluid field">
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
                            <td><a href="javascript:" class="remove-btn">Remove</a></td>
                        </tr>
                    </c:forEach>
                    <tr class="field-hidden">
                        <td><input type="text" /></td>
                        <td>
                            <form:select path="" items="${fieldTypes}"></form:select>
                        </td>
                        <td><a href="javascript:" class="remove-btn">Remove</a></td>
                    </tr>
                    <tr>
                        <td colspan="3"><a href="javascript:" class="new-btn">New Field</a></td>
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