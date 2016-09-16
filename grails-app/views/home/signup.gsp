<%--
  Created by IntelliJ IDEA.
  User: resourcePool
  Date: 7/16/16
  Time: 10:11 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>SignUp</title>
    <script src="../js/jquery-1.11.0.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <link href="../css/bootstrap.min.css" rel="stylesheet"/>

    <script type="text/javascript">
        $(function () {
            $("#submitform").validate({


                rules: {
                    firstname: {
                        required: true,
                        minlength:3
                    },
                    lastname: {
                        required: true,
                        minlength:3
                    },
                    email:{
                        required:true,
                        email:true
                    },
                    username:{
                        required:true,
                        minlength:3
                    },
                    password:{
                        required:true,
                        minlength:8
                    },
                    gender : {required :true}
                },
                messages: {
                    firstname: {
                        required: "Enter the first name",
                        minlength:"Less than 3 word"

                    },
                    lastname: {
                        required: "Enter the last name",
                        minlength:"less than 3 word"
                    },
                    email:{
                        required:"Enter the email address",
                        email:"Enter valid email address"
                    },
                    username:{
                        required:"Enter the user name",
                        minlength:"less than 3 word"
                    },
                    password:{
                        required:"Enter the password",
                        minlength:"Your password strength is weak"
                    },
                    gender : {required :"Select the gender"}
                },
                highlight: function (element) {
                    $(element).parent().addClass('error1')
                },
                unhighlight: function (element) {
                    $(element).parent().removeClass('error1')
                }
            });
        })
    </script>

</head>

<body style="background-color: #f5f5f5;">
<br>
<div class="well" style="width: 40%;margin: auto;border:3px solid #3573a3;">

    <img src="${resource(dir: 'images',file: 'it.png')}" alt="Logo" style="width: 100%">
    <br> <br>
    <g:form controller="user" action="newUser" enctype="multipart/form-data" class="horizontal" role="form" id="submitform">

        <input type="hidden" name="userType" value="${userType}"/>

        <label for="firstName">First Name</label>
        <input type="text" name="firstName" id="firstName" class="form-control"/><br>

        <label for="lastName">Last Name</label>
        <input type="text" name="lastName" id="lastName" class="form-control"/><br>

        <label for="username">Username</label>
        <input type="text" name="username" id="username" class="form-control"/><br>

        <label for="lastName">Password</label>
        <input type="password" name="password" id="password" class="form-control"/><br>

        <label for="email">Email</label>
        <input type="text" name="email" id="email" class="form-control"/><br>

        <label for="address">Address</label>
        <input type="text" name="address" id="address" class="form-control"/><br>

        <label for="gender">Gender:</label><br>
        Male: <input type="radio" name="gender" id="gender" value="Male" checked/>
        Female: <input type="radio" name="gender" id="gender" value="female"/><br><br>

        <label for="dob">DOB</label>
        <g:datePicker name="dob" id="dob" precision="day" class="form-control"/><br><br>

        <label for="profilePicture">Profile Picture</label>
        <input type="file" name="profilePicture" id="profilePicture"/><br>

        <button class="btn btn-primary">Signup</button>
    </g:form>

</div>
<br>
</body>
</html>
