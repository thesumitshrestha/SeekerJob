<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 5/30/2016
  Time: 2:58 PM
--%>

<%@ page import="com.ResourcePool.auth.User; resourcepool.Job" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html" xmlns:width="http://www.w3.org/1999/xhtml">
<head>
    <meta name="layout" content="main"/>
    <title>Homepage - Resource Pool</title>

</head>
<body>

<div class="main">

    <g:if test="${Job.findByUser(User.findById(session?.user?.id as long))}">
        <div class="jumbotron" style="width: 84%;height:500px;margin: auto">

            <g:each in="${companyList}" var="company" status="i">
                <div class="col-lg-5" style="width: 50%;padding: 1%">

                    <div class="panel panel-primary" style="width: 80%;margin: auto">
                        <div class="panel-heading">${company?.companyName}
                        </div>
                        <div class="panel-body">
                            ${company?.description}
                        </div>
                    </div>

                </div>

                <g:if test="${i%2!=0}" >

                </g:if>
            </g:each>
        </div>
    </g:if>

    <g:else>
        <div class="well" style="width: 47%; margin-left:23%;">
            <h3> Create Your Profile</h3><br>
            <p> Creating the profile makes you the part of the Resource Pool Team Resource Pool is a platform where both job seeker and employer are benefitted.<br> <br>Job seeker post their skills to be hired for the job.<br> <br> Employer hires the job seeker by looking their skills.</p>
           <br> <g:link controller="home" action="createProfile"><button type="button" class="btn btn-primary">Create My Profile</button></g:link>
        </div>
    </g:else>

</div>
<br>

</div>

</body>
</html>

