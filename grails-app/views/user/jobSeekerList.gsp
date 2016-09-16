<%--
  Created by IntelliJ IDEA.
  User: resourcePool
  Date: 7/17/16
  Time: 6:55 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>JobSeeker List- Resource Pool</title>
    <script type="text/javascript">
        $(function () {
            $("#jobSeekerList").DataTable();
        })
    </script>
</head>

<body>


<div class="row">
    <div class="col-md-1"></div>
    <div id="jobSeekerListDiv" style="width: 80%;background-color: white" class="col-lg-8">
        <h1>JobSeeker List: </h1>
        <table id="jobSeekerList" style="margin: 0 auto" class="display table-bordered">
            <thead>
            <tr>
                <th>Full Name</th>
                <th>Address</th>
                <th>Skills</th>
                <th>Experience</th>
                <th>Expected Salary</th>
                <th>Job Type</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${memberList}" var="member" status="i">
                <g:if test="${member!=null}">

                    <tr>
                        <td><g:link controller="user" action="memberProfile" params="[userId:member?.userId]">
                            ${member?.firstName}&nbsp;${member?.lastName}</g:link></td>
                        <td>${member?.address}</td>
                        <td>
                            <%
                                String skills = jobList[i]?.skills
                                if(skills?.length()>20){
                                    skills = skills.substring(0,19)+"..."
                                }
                            %>
                            ${skills}
                        </td>
                        <td>${jobList[i]?.experience}</td>
                        <td>${jobList[i]?.expectedSalary}</td>
                        <td>${jobList[i]?.jobType}</td>
                    </tr>
                </g:if>
            </g:each>
            </tbody>
        </table>
    </div>
</div>
<br>
<br>

</body>
</html>