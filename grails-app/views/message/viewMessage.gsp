<%--
  Created by IntelliJ IDEA.
  User: resourcePool
  Date: 7/18/16
  Time: 9:26 AM
--%>

<%@ page import="resourcepool.Member" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Message- Resource Pool</title>
</head>

<body>

<div class="row">
    <div class="col-md-1"></div>
    <div class="col-lg-5 well">
        <span>Sender: ${Member.findByUser(messageInfo?.sender).firstName+" "+
                Member.findByUser(messageInfo?.sender).lastName}</span>
        <br>
        <span>Receiver: ${Member.findByUser(messageInfo?.receiver).firstName+" "+
                Member.findByUser(messageInfo?.receiver).lastName}</span>
        <br>

        <span>Subject: ${messageInfo?.subject}</span>
        <br>

        <span>Message: ${messageInfo?.message}</span>
    </div>
</div>

</body>
</html>