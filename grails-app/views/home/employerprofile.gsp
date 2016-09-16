<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 5/30/2016
  Time: 3:29 PM
--%>

<%@ page import="resourcepool.Job" contentType="text/html;charset=UTF-8" %>
<html>

<head>
    <meta name="layout" content="main"/>
    <title>Employer</title>


    <script>
        $( function() {
            <%


            def skillList = Job.createCriteria().list {
                projections {
                    distinct("skills")
                }
            }
            %>
            var availableTags = [];
            <g:each in="${skillList}" var="skill">
                availableTags.push("${skill}");
            </g:each>
            $( "#srch-term" ).autocomplete({
                source: availableTags
            });
        } );
    </script>


</head>

<body>

<div class="well" style="width: 60%; margin-left:23%; margin-top:5%">
    <g:form class="navbar-form" role="search" controller="job" action="searchBySkillOnly">
        <div class="input-group add-on">
            <label for="srch-term">Search by Skills:</label>
            <input class="form-control" placeholder="EXAMPLE: PHP" name="skillName" id="srch-term" type="text" size="200" width="300px">
            <div class="input-group-btn">
                <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
            </div>
        </div>
    </g:form>
</div>
<br>
<br><br><br><br><br>
</body>
</html>