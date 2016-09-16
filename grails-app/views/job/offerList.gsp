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
    <title>Offer List- Resource Pool</title>
    <script type="text/javascript">
        $(function () {
            $("#offerList").DataTable();
        })
    </script>
</head>

<body>
<div class="row">
    <div class="col-md-1"></div>
    <div id="offerListDiv" style="width: 80%;background-color: white" class="col-md-8">
        <g:if test="${flash.message}">
            <h3 style="color:white">${flash.message}</h3>
        </g:if>
        <h1>Offer List: </h1>
        <table id="offerList" >
            <thead>
            <tr>
                <th>Name</th>
                <th>Company Name</th>
                <th>Company Address</th>
                <th>Action/Status</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${employerList}" var="employer" status="i">
                <tr>
                    <td><g:link controller="user" action="memberProfile" params="[userId:employer?.userId]">
                        ${employer?.firstName}&nbsp;${employer?.lastName}</g:link></td>
                    <td>${employerCompanyList[i]?.companyName}</td>
                    <td>${employerCompanyList[i]?.companyAddress}</td>
                    <td>
                        <g:if test="${offerList[i]?.status=='PENDING'}">
                            <g:link controller="job" action="acceptOffer" params="[hireId:offerList[i]?.id]">Accept</g:link>&nbsp;|&nbsp;
                            <g:link controller="job" action="rejectOffer" params="[hireId:offerList[i]?.id]">Reject</g:link>
                        </g:if>
                        <g:else>
                            ${offerList[i]?.status}
                        </g:else>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
</div>
<br>
</body>
</html>