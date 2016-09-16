<%--
  Created by IntelliJ IDEA.
  User: resourcePool
  Date: 7/18/16
  Time: 9:07 AM
--%>

<%@ page import="resourcepool.Member" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Message- Resource Pool</title>
    <script type="text/javascript">
        $(function () {
            $("#inboxList").DataTable();
            $("#sentList").DataTable();
        })
    </script>
</head>

<body>
<div class="row">
    <div class="col-md-1"></div>
    <g:if test="${flash.message}">
        <h3 style="color:white">${flash.message}</h3>
    </g:if>
    <div id="inboxListDiv" style="width: 80%;background-color: white" class="col-md-6">
        <h1>Inbox: </h1>
        <table id="inboxList" >
            <thead>
            <tr>
                <th>Sender</th>
                <th>Subject</th>
                <th>Message</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${inboxList}" var="inbox" status="i">
                <tr style="background-color: <g:if test="${inbox?.isRead}">#dca7a7 </g:if>">
                    <td><g:link controller="user" action="memberProfile" params="[userId:inbox?.sender?.id]">
                        <%
                            def member = Member.findByUser(inbox?.sender)
                        %>
                        ${member?.firstName}&nbsp;${member?.lastName}</g:link></td>
                    <td>${inbox?.subject?.length()>15?inbox?.subject?.substring(0,14):inbox?.subject}</td>
                    <td>
                        <g:link controller="message" action="viewMessage" params="[messageId:inbox?.id]">
                            ${inbox?.message?.length()>15?inbox?.message?.substring(0,14):inbox?.message}
                        </g:link>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
</div>
<hr>
<div class="row">
    <div class="col-md-1"></div>
    <div id="sentListDiv" style="width: 80%;background-color: white" class="col-md-6">
        <h1>Sent: </h1>
        <table id="sentList" >
            <thead>
            <tr>
                <th>Receiver</th>
                <th>Subject</th>
                <th>Message</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${sendList}" var="sent" status="i">
                <tr>
                    <td><g:link controller="user" action="memberProfile" params="[userId:sent?.receiver?.id]">
                        <%
                            def receiverMember = Member.findByUser(sent?.receiver)
                        %>
                        ${receiverMember?.firstName}&nbsp;${receiverMember?.lastName}</g:link></td>
                    <td>${sent?.subject?.length()>25?sent?.subject?.substring(0,24)+"...":sent?.subject}</td>
                    <td>
                        <g:link controller="message" action="viewMessage" params="[messageId:sent?.id]">
                            ${sent?.message?.length()>25?sent?.message?.substring(0,24)+"...":sent?.message}
                        </g:link>
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