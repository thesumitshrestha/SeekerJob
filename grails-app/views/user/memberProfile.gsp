<%--
  Created by IntelliJ IDEA.
  User: resourcePool
  Date: 7/17/16
  Time: 12:47 AM
--%>

<%@ page import="resourcepool.Hire; com.ResourcePool.auth.UserRole; resourcepool.Job; com.ResourcePool.auth.User" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Member Profile-Resource Pool</title>

    <script type="text/javascript">
        function sendMessage(){
            var message = $("#messageText").val();
            var jobSeekerId = $("#jobSeekerId").val();
            var messageSubject = $("#messageSubject").val();

            $("#messageText").val("");
            $("#messageSubject").val("");

            $("#sendMessage").modal("hide");
            $.ajax({
                url:"<g:createLink controller="job" action="sendMessage"/>",
                type:"POST",
                data:{message:message,receiverId:jobSeekerId,messageSubject:messageSubject},
                success:function(data){
                    alert(data.message)
                },error:function (err) {
                    alert("Message Not Sent.")
                }
            })
        }
    </script>

</head>

<body>
<g:if test="${Job.findByUser(User.findById(session?.user?.id as long))}">
    <div class="container">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-xs-12 col-sm-6 col-md-6">
                <div class="well well-sm">
                    <div class="row">
                        <%
                            def user = User.findById(memberInfo?.userId)
                            def memberROle = UserRole.findByUser(user)?.role?.authority
                        %>
                        <div class="col-sm-6 col-md-4">
                            <img src="${resource(dir:'profilePicture',file: session?.user?.username+".jpg")}" alt="" class="img-rounded img-responsive" />
                            <br><br>
                            <g:if test="${memberROle=='ROLE_JOBSEEKER'}">
                                <g:if test="${!Hire.findByJobSeekerAndEmployer(memberInfo?.user,session?.user)}">
                                    <g:link class="btn btn-primary" controller="job" action="hireRequest"
                                            params="[jobSeekerId:memberInfo?.user?.id]">Hire</g:link>
                                </g:if>
                            </g:if>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#sendMessage">Send Message</button>
                        </div>
                        <div class="col-sm-6 col-md-8">
                            <h4>
                                ${memberInfo?.firstName}&nbsp;${memberInfo?.lastName} </h4>
                            <i class="glyphicon glyphicon-map-marker">
                            </i><cite title="${memberInfo?.address}">${memberInfo?.address}</cite><br><br>
                            <p>
                                <i class="glyphicon glyphicon-envelope"></i>&nbsp;${memberInfo?.email}<br><br>
                                <i class="glyphicon glyphicon-user"></i>&nbsp;${memberInfo?.gender}<br><br>
                                <i class="glyphicon glyphicon-calendar"></i>${memberInfo?.dob?.toString()?.split(" ")[0]}</p>

                            <g:if test="${memberROle=='ROLE_JOBSEEKER'}">
                                <i class="glyphicon glyphicon-education"></i>&nbsp;<span>Skills: ${jobInfo?.skills}</span><br><br>
                                <i class="glyphicon glyphicon-cog"></i>&nbsp;<span>Experience: ${jobInfo?.experience}</span><br><br>
                                <i class="fa fa-dollar"></i>&nbsp;<span>Expected Salary: ${jobInfo?.expectedSalary}</span><br><br>
                                <i class="glyphicon glyphicon-cutlery"></i>&nbsp;<span>Expected Facilities: ${jobInfo?.expectedFacilities}</span><br><br>
                                <i class="glyphicon glyphicon-briefcase"></i>&nbsp;<span>Job Type: ${jobInfo?.jobType}</span><br><br>
                            </g:if>
                            <g:else>
                                <i class="fa fa-building-o">&nbsp;</i><span>Company Name: ${jobInfo?.companyName}</span><br><br>
                                <i class="glyphicon glyphicon-map-marker"></i>&nbsp;<span>Company Address: ${jobInfo?.companyAddress}</span><br>
                            </g:else>
                            <br>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div id="sendMessage" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Send Message</h4>
                    </div>
                    <div class="modal-body">
                        <label for="messageSubject">Subject:</label>
                        <input type="text" name="messageSubject" id="messageSubject" class="form-control"/><br>
                        <label for="messageText">Message:</label>
                        <g:textArea name="messageText" id="messageText" class="form-control"></g:textArea>
                        <input type="hidden" name="jobSeekerId" id="jobSeekerId" value="${memberInfo?.userId}"/><br>
                        <button class="btn btn-primary" onclick="sendMessage()">Send Message</button>
                    </div>
                </div>

            </div>
        </div>

    </div>
</g:if>
</body>
</html>