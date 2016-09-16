<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title></title>
</head>

<body>

<div class="container">

    <div class="jumbotron" style="width: 60%;margin: auto">
        <g:form controller="skill" action="save">
            <label for="skillName">Skill Name</label>
            <input type="text" name="skillName" id="skillName" class="form-control"/><br>

            <input type="submit" value="Add">
        </g:form>
    </div>

</div>
</body>
</html>