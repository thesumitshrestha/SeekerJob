<%--
  Created by IntelliJ IDEA.
  User: resourcePool
  Date: 7/17/16
  Time: 12:47 AM
--%>

<%@ page import="resourcepool.Job; com.ResourcePool.auth.User" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <link rel="stylesheet" type="text/css" href="../css/profile.css">
    <title>My Profile</title>
</head>

<body>
<g:if test="${flash.message}">
    <h2 style="color:white">${flash.message}</h2>
</g:if>
<g:if test="${Job.findByUser(User.findById(session?.user?.id as long))}">
    <div class="container">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <div class="well well-sm" style="height: auto">
                    <div class="row">
                        <div class="col-md-4">
                            <img src="${resource(dir:'profilePicture',file: session?.user?.username+".jpg")}" alt="" class="img-rounded img-responsive" />
                            <g:uploadForm action="changeProfilePicture" controller="user">
                                <br> <input type="file" id="newProfilePic" name="newProfilePic">
                                <br> <input type="submit"  value="Change"/>
                                <br>
                            </g:uploadForm>
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-6">
                            <h4>
                                ${memberInfo?.firstName}&nbsp;${memberInfo?.lastName} </h4>
                            <i class="glyphicon glyphicon-map-marker">
                            </i>

                            <cite title="${memberInfo?.address}">${memberInfo?.address} </cite><br><br>
                            <p>
                                <i class="glyphicon glyphicon-envelope"></i>&nbsp;${memberInfo?.email}<br>
                                <br />
                                <i class="glyphicon glyphicon-user"></i>&nbsp;${memberInfo?.gender}<br>
                                <br />
                                <i class="glyphicon glyphicon-calendar"></i>${memberInfo?.dob?.toString()?.split(" ")[0]}</p>

                            <g:if test="${session.userRole=='ROLE_JOBSEEKER'}">
                                <i class="glyphicon glyphicon-education"></i>&nbsp;<span>Skills: ${jobInfo?.skills}</span><br><br>
                                <i class="glyphicon glyphicon-cog"></i>&nbsp;<span>Experience: ${jobInfo?.experience}</span><br><br>
                                <i class="fa fa-dollar"></i>&nbsp;<span>Expected Salary: ${jobInfo?.expectedSalary}</span><br><br>
                                <i class="glyphicon glyphicon-cutlery"></i>&nbsp;<span>Expected Facilities: ${jobInfo?.expectedFacilities}</span><br><br>
                                <i class="glyphicon glyphicon-briefcase"></i>&nbsp;<span>Job Type: ${jobInfo?.jobType}</span><br>
                            </g:if>
                            <g:else><br>
                                <i class="fa fa-building-o">&nbsp;</i><span>Company Name: ${jobInfo?.companyName}</span><br><br>
                                <i class="glyphicon glyphicon-map-marker"></i>&nbsp;<span>Company Address: ${jobInfo?.companyAddress}</span><br><br>
                            </g:else>
                            <br>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#edit">Edit</button>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</g:if>
<g:else>
    <div class="well" style="width: 47%; margin-left:23%; margin-top:5%">
        <h3> Create Your Profile</h3>
        <p> Creating the profile makes you the part of the Resource Pool Team Resource Pool is a platform where both job seeker and employer are benefitted. Job seeker post their skills to be hired for the job. Employer hires the job seeker by looking their skills.</p>
    </div>

    <g:link controller="home" action="createProfile"><button type="button" class="btn btn-primary btn-lg" style= margin-left:53%;>Create My Profile</button></g:link>

</g:else>
<div id="edit" class="modal fade" role=" dialog">
    <div class="modal-dialog">
        <div class="modal-content" style="width:1152px;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Edit Profile</h4>
            </div>
            <div class="row form-group">
                <div class="modal-body">

                <div class="container">

                    <g:form controller="user" action="update" enctype="multipart/form-data" class="horizontal" role="form">
                        <div class="col-sm-6">

                            <label for="firstName">First Name</label>
                            <input type="text" name="firstName" id="firstName" class="form-control" value=${memberInfo.firstName} /><br>

                            <label for="lastName">Last Name</label>
                            <input type="text" name="lastName" id="lastName" class="form-control" value=${memberInfo.lastName} /><br>

                            <label for="email">Email</label>
                            <input type="text" name="email" id="email" class="form-control" value=${memberInfo.email} /><br>

                            <label for="address">Address</label>
                            <input type="text" name="address" id="address" class="form-control" value=${memberInfo.address} /><br>
                            <g:if test="${memberInfo.gender=='Male'}">
                                <label for="gender">Gender:</label>
                                Male: <input type="radio" name="gender" id="gender" value="Male" checked/>
                                Female: <input type="radio" name="gender" id="gender" value="female"/><br><br>
                            </g:if>
                            <g:else>
                                <label for="gender">Gender:</label><br>
                                Male: <input type="radio" name="gender" id="gender" value="Male"/>
                                Female: <input type="radio" name="gender" id="gender" value="female" checked /><br><br>
                            </g:else>
                            <label for="dob">DOB</label>
                            <input type="date" id="dob" value=${memberInfo.dob} class="form-control" /><br><br>
                        </div>


                    %{--<label for="profilePicture">Profile Picture</label>--}%
                    %{--<input type="hidden" name="profilePicture" id="profilePicture" value="${memberInfo?.profilePicture}"/><br>--}%
                        <div class="col-sm-6">
                            <g:if test="${session.userRole=='ROLE_JOBSEEKER'}">


                                <input type="hidden" name="userType" value="jobSeeker"/>

                                <label for="skills">Skills</label>
                                <input type="text" name="skills" id="skills" value="${jobInfo.skills}" class="form-control"/><br>

                                <label for="experience">Experience</label>
                                <input type="text" name="experience" id="experience" value="${jobInfo.experience}" class="form-control"/><br>


                                <label for="expectedSalary">Expected Salary</label>
                                <input type="text" name="expectedSalary" value="${jobInfo.expectedSalary}" id="expectedSalary" class="form-control"/><br>

                                <label for="expectedFacilities">Expected Facilities</label>
                                <input type="text" name="expectedFacilities" id="expectedFacilities" value="${jobInfo.expectedFacilities}" class="form-control"/><br>

                                <label for="expectedFacilities">Job Type:</label><br
                                <g:if test="${jobInfo?.jobType=='fullTime'}">
                                    <label for="fullTime">Full Time:</label>
                                    <input type="radio" name="jobType" value="fullTime" id="fullTime">
                                    <label for="partTime">Part Time:</label>
                                    <input type="radio" name="jobType" value="partTime" id="partTime"><br><br>
                                </g:if>
                                <g:else>
                                    Full Time: <input type="radio" name="jobType" value="fullTime">
                                    Part Time: <input type="radio" name="jobType" value="partTime" checked><br><br>
                                </g:else>


                            </g:if>
                            <g:else>

                                <input type="hidden" name="userType" value="employeer"/>

                                <label for="companyName">Company Name</label>
                                <input type="text" name="companyName" id="companyName" value="${jobInfo?.companyName}" class="form-control"/><br>

                                <label for="companyAddress">Company Address</label>
                                <input type="text" name="companyAddress" id="companyAddress" value="${jobInfo?.companyAddress}" class="form-control"/><br><br>



                            </g:else>
                            <input type="hidden" name="jobId" value="${jobInfo?.id}">
                            <input type="hidden" name="memberId" value="${memberInfo?.id}">
                            <button class="btn btn-primary pull-right" >Submit</button>
                        </div>

                        </div>

                    </g:form>
                </div>
            </div>


        </div>
    </div>
</div>

</body>
</html>