<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 6/16/2016
  Time: 3:20 PM
--%>

<%@ page import="com.ResourcePool.auth.User; resourcepool.Job" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Create Profile</title>
</head>

<body>


<g:if test="${message}">
    <span style="color: white">${message}</span>
</g:if>


<div class="well" style="width: 35%;margin: auto;border:4px solid #3573a3;">

    <img src="${resource(dir: 'images',file: 'it.png')}" alt="Logo" style="width: 100%">
    <br> <br>

    <g:if test="${session.userRole=='ROLE_JOBSEEKER'}">

        <g:form controller="user" action="userProfile" enctype="multipart/form-data" class="horizontal" role="form">

            <input type="hidden" name="userType" value="jobSeeker"/>

            <label for="sel1">Skills</label>
            <select class="form-control" id="sel1">
                <option value="#">--Select Skill--</option>
                <g:each in="${resourcepool.Skill.list()}" var="s">
                    <option value="${s.id}">${s.skillName}</option>
                </g:each>
            </select>
            <br>
            <label for="experience">Experience</label>
            <input type="text" name="experience" id="experience" class="form-control"/><br>


            <label for="expectedSalary">Expected Salary</label>
            <input type="text" name="expectedSalary" id="expectedSalary" class="form-control"/><br>

            <label for="expectedFacilities">Expected Facilities</label>
            <input type="text" name="expectedFacilities" id="expectedFacilities" class="form-control"/><br>

            <label for="expectedFacilities">Job Type:</label><br>
            Full Time: <input type="radio" name="jobType" value="Full Time">
            Part Time: <input type="radio" name="jobType" value="Part Time"><br><br>

            <button class="btn btn-primary">Submit</button>
        </g:form>
    </g:if>
    <g:else>
        <g:form controller="user" action="userProfile" enctype="multipart/form-data" class="horizontal" role="form">

            <input type="hidden" name="userType" value="employeer"/>

            <label for="companyName">Company Name</label>
            <input type="text" name="companyName" id="companyName" class="form-control"/><br>

            <label for="companyAddress">Company Address</label>
            <input type="text" name="companyAddress" id="companyAddress" class="form-control"/><br><br>

            <button class="btn btn-primary">Submit</button>
        </g:form>
    </g:else>

</div>

</body>
</html>