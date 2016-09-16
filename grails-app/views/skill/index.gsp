<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title></title>
</head>

<body>
<div class="container" style="background-color: bisque;height: 300px">

    <button><g:link controller="skill" action="addForm">Add Skill</g:link></button>


    <table class="table table-striped" >
        <thead>
        <tr>
            <th>Skill</th>
            <th>Actions</th>
        </tr>
        </thead>

        <tbody>
        <g:each in="${skillList}" var="s">
            <tr>
                <td>${s.skillName}</td>
                <td>
                    <g:link controller="skill" action="edit" params="[skill_id:s.id]"><i class="glyphicon glyphicon-edit"></i></g:link>
                    <g:link controller="skill" action="delete" params="[skill_id:s.id]"><i class="glyphicon glyphicon-trash"></i></g:link>
                </td>
            </tr>
        </g:each>

        </tbody>
    </table>
</div>
</body>
</html>