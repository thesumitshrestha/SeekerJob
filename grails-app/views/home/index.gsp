%{--<html>--}%

%{--<head>--}%


	%{--<!--<script src="js/login.js"></script>-->--}%
	%{--<script src="../js/jquery-1.11.0.min.js"></script>--}%
	%{--<script src="../js/jquery.validate.min.js"></script>--}%
	%{--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">--}%
	%{--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">--}%
	%{--<script>--}%
		%{--$(document).ready(function(){--}%
			%{--alert("ready ");--}%

			%{--$("#submitform").validate({--}%


				%{--rules: {--}%

					%{--username:{--}%
						%{--required:true,--}%
						%{--minlength:8--}%
					%{--},--}%
					%{--password:{--}%
						%{--required:true,--}%
						%{--minlength:8--}%
					%{--}--}%
				%{--},--}%
				%{--messages: {--}%

					%{--username:{--}%
						%{--required:"Enter the username ",--}%
						%{--username:"Enter valid username "--}%
					%{--},--}%

					%{--password:{--}%
						%{--required:"Enter the password",--}%
						%{--minlength:"Your password strength is weak"--}%
					%{--}--}%

				%{--},--}%
				%{--highlight: function (element) {--}%
					%{--$(element).parent().addClass('error0')--}%
				%{--},--}%
				%{--unhighlight: function (element) {--}%
					%{--$(element).parent().removeClass('error0')--}%
				%{--},--}%
				%{--submitHandler: function(form) {--}%
					%{--form.submit();--}%
				%{--}--}%
			%{--});--}%
		%{--});--}%
	%{--</script>--}%
	%{--<style>--}%
	%{--#submitform .error{--}%
		%{--color:darkred;--}%
		%{--font-weight: lighter;--}%
		%{--/*font-family: cursiveewr;*/--}%
	%{--}--}%
	%{--</style>--}%

%{--</head>--}%

%{--<body style="background-color:#003366">--}%


%{--<div class="well" style="width: 35%;margin:8% auto;border:solid blue; ">--}%
    %{--<img src="${resource(dir: 'images',file: 'it.png')}" alt="Logo" style="width: 100%">--}%
    %{--<br><br>--}%



	%{--<form action='${postUrl}' method='POST' id='loginForm' class='cssform' id="submitform" autocomplete='off'>--}%

		%{--<div class="form-group" style="position:relative;">--}%
		%{--<div>--}%
			%{--<label for="username">User Name:</label>--}%
			%{--<input class="form-control input-lg"  id="username"  name="username" type="text" >--}%
			%{--<p class="error"></p>--}%
		%{--</div>--}%
			%{--<div>--}%
			%{--<label for="password">Password:</label>--}%
			%{--<input type="password" class="form-control input-lg"  id="password" >--}%
				%{--<p class="error"></p>--}%
			%{--<label><input type="checkbox"> Remember me</label>--}%
		%{--</div>--}%
			%{--<br>--}%
			%{--<g:link controller="user" action="jobSeekerProfile"><button type="submit" class="btn btn-primary btn-lg" id="login" name="login">Login</button></g:link>--}%
		%{--</div>--}%
	%{--</form>--}%
	%{--<g:link controller="user" action="interfaceAction"> <button class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-user"></span> Sign up </button></g:link>--}%


%{--</div>--}%
%{--<div id="footer" style=" width:100%; height:50px; position:absolute; clear: both; text-align: center; color: whitesmoke; bottom: 0 ;left:0; font-size: 20px">--}%
	%{--<p>@2016, Deerwalk Institute of Technology. All rights reserved.</p>--}%
%{--</div>--}%



%{--</body>--}%

%{--</html>--}%