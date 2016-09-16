
<%@ page import="resourcepool.Job" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Search</title>
</head>

<body>
        <div class="well" style="width: 40%; margin-left:30%; margin-top:1%">
            <g:form class="navbar-form" role="search" controller="job" action="searchBySkill">
                <label for="skills">Skills:</label><br>
                <input type="text" id="skills" name="skills" class="form-control"><br><br>


                <label for="experience">Experience:</label><br>
                <input type="text" id="experience" name="experience" class="form-control"><br>
                   <br>

                <label for="jobType">Job Type: </label><br>
                Full Time:<input type="radio" name="jobType" id="jobType" value="fullTime" class="form-control">
                Part Time:<input type="radio" name="jobType" id="jobType" value="partTime" class="form-control"><br><br>


                <label for="expectedSalary">Expected Salary:</label><br>
                <select class="expectedSalary" id="expectedSalary" name="expectedSalary" class="form-control">
                    <option value="">Select Salary</option>
                    <g:each var="amount" in="${1..50}">
                        <option class="form-control">${amount*5000}</option>
                    </g:each>
                </select><br><br>


                <button class="btn btn-primary">Search</button>


            </g:form>
        </div>

</body>
</html>