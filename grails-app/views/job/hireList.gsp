<%--
  Created by IntelliJ IDEA.
  User: resourcePool
  Date: 7/17/16
  Time: 8:44 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Hire List- Resource Pool</title>
    <script type="text/javascript">
        $(function () {
            $("#hireList").DataTable();
        })
    </script>
</head>

<body>
<div class="row">
    <div class="col-md-1"></div>
    <div id="hireListDiv" style="width: 80%;background-color: white" class="col-md-8">
        <h1>Hire List: </h1>
        <table id="hireList" >
            <thead>
            <tr>
                <th>Name</th>
                <th>Address</th>
                <th>Hire Status</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${memberList}" var="member" status="i">
                <tr>
                    <td><g:link controller="user" action="memberProfile" params="[userId:member?.userId]">
                        ${member?.firstName}&nbsp;${member?.lastName}</g:link></td>
                    <td>${member?.address}</td>
                    <td>${hireList[i]?.status}</td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
</div>
<br>
</body>
</html>