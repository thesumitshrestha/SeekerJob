<%--

  Created by IntelliJ IDEA.
  User: acer
  Date: 5/30/2016
  Time: 3:27 PM
--%>
<%@ page import="resourcepool.Member; com.ResourcePool.auth.UserRole; com.ResourcePool.auth.Role"%>

<html>
<head>
    <meta name="layout" content="main"/>
    <title></title>

</head>

<body>

<div class="row" style="width: 84%;margin: auto">
    %{--<g:form action="save" method="POST">--}%
        %{--<g:select class="form-control" from="${com.ResourcePool.auth.Role.all.authority}" name="role"--}%
                  %{--value="${com.ResourcePool.auth.UserRole.findByUser(resourcepool.Member.findById(params.id)?.user)?.role?.authority}">--}%

        %{--</g:select>--}%
        %{--<g:hiddenField name="memberId" value="${params.id}"/>--}%
        %{--<g:submitButton name="Submit" value="Submit"/>--}%
    %{--</g:form>--}%

    <table class="table table-striped" id="user-table" style="background-color: whitesmoke">
        <thead>
        <tr>
            <th style="width: 20%">Photo</th>
            <th>Name</th>
            <th>Action</th>
            <th>User Role</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${userList}" var="s">
            <tr>
                <td>
                    <g:if test="${s.profilePicture}">

                        <img class="user-photo img-circle" width="60" src="${createLink(controller:'user', action:'getImage', params: [fileName:s.profilePicture])}"/>
                    </g:if>
                </td>
                <td style="vertical-align: middle;">${s.firstName} ${s.lastName}</td>
                <td style="vertical-align: middle;">
                   <g:link controller="user" action="delete" params="[user_id:s.user.id]"><i class="glyphicon glyphicon-trash"></i></g:link>
                </td>
                <td><g:form controller ="user" action="roleUpdate" method="POST">
                    <g:select class="form-control" from="${Role.all}" name="role" optionKey="id" optionValue="authority"
                              value="${UserRole.findByUser(Member.findById(s.id)?.user)?.role?.id}">

                    </g:select>
                    <g:hiddenField name="memberId" value="${s.id}"/>
                    <g:submitButton name="Submit" value="Submit"/>
                </g:form>

                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
</div>


</body>
</html>