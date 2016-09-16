<%--
  Created by IntelliJ IDEA.
  User: Anil
  Date: 8/22/2016
  Time: 8:11 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main"/>
</head>

<body>

<div class="row" style="width: 84%;margin: auto;background-color: whitesmoke">
    <g:link controller="user" action="create">Create Admin</g:link>   <br>


    <h2>User List:</h2>
    <g:each in="${users}" var="user" status="i">
        ${i+1}. <g:link controller="user" action="show" params="[userId:user?.id]"> ${user?.username}</g:link><br>
    </g:each>
</div>
</body>
</html>