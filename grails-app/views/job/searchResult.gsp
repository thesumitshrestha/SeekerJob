<%--
  Created by IntelliJ IDEA.
  User: resourcePool
  Date: 7/17/16
  Time: 5:17 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Search Result- Resource Pool</title>
    <script type="text/javascript">
        $(function () {
            $("#searchResult").DataTable();
            $("#selectall").change(function(){
                    var status=this.checked;
                $('.checkbox').each(function(){
                    this.checked=status;
                })
            });
            $('.checkbox').change(function(){
                if(this.checked==false){
                    $("#selectall")[0].checked=false;
                }
            })
        });


    </script>
</head>

<body>
<div class="row">
    <div class="col-md-1"></div>
    <div id="searchResultDiv" style="width: 80%;background-color: white" class="col-lg-8">

        <h1>Search Result: </h1>
        <g:form controller="job" action="groupMessage">
    <table id="searchResult" style="margin: 0 auto" class="display table-bordered">
        <thead>
        <tr>
            <th><input type="checkbox" id="selectall"> <label for="selectall">Select All</label> </th>
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
                        <td><input type="checkbox" class="checkbox" name="check${i}" value="${member?.user?.id}"> </td>
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
                    %{--<div id="sendMessage" class="modal fade" role="dialog">--}%
                        %{--<div class="modal-dialog">--}%

                            %{--<!-- Modal content-->--}%
                            %{--<div class="modal-content">--}%
                                %{--<div class="modal-header">--}%
                                    %{--<button type="button" class="close" data-dismiss="modal">&times;</button>--}%
                                    %{--<h4 class="modal-title">Send Message</h4>--}%
                                %{--</div>--}%
                                %{--<div class="modal-body">--}%
                                    %{--<label for="messageSubject">Subject:</label>--}%
                                    %{--<input type="text" name="messageSubject" id="messageSubject" value="Call for interview" class="form-control"/><br>--}%
                                    %{--<label for="messageText">Message:</label>--}%
                                    %{--<g:textArea name="messageText" id="messageText" class="form-control"  value="Hello ${member?.firstName}--}%
                                    %{--We would like to call you for interview"></g:textArea>--}%
                                    %{--<input type="hidden" name="jobSeekerId" id="jobSeekerId" value="${member?.userId}"/><br>--}%
                                    %{--<button class="btn btn-primary" onclick="sendMessage()">Send Message</button>--}%
                                %{--</div>--}%
                            %{--</div>--}%

                        %{--</div>--}%
                    %{--</div>--}%
                </g:if>
            </g:each>
            </tbody>
            </table>
            <input type="submit" class="btn btn-primary" value="Send Message">
        </g:form>
        %{--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#sendMessage">Send Message</button>--}%


    </div>
</div>
<br>
<br>
</body>
</html>