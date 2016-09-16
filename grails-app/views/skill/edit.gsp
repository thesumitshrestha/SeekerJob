<%--
  Created by IntelliJ IDEA.
  User: Anil
  Date: 8/21/2016
  Time: 12:46 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Edit Skills</title>
</head>

<body>
<div class="container">

    <div class="jumbotron" style="width: 60%;margin: auto">
        <g:form controller="skill" action="update">
            <label for="skillName">Skill Name</label>
            <input type="text" name="skillName" id="skillName" value="${skillName}" class="form-control"/><br>
            <input type="hidden" name="skill_id" value="${id}"/>
            <input type="submit" value="Update">
        </g:form>
    </div>

</div>
</body>
</html>