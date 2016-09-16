<html>

<head>

    <link rel="stylesheet" type="text/css" href="styl.css">
    <script src="../js/jquery-1.11.0.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="../css/custom.css">
</head>


<body style="background-color: #f5f5f5;">
<br><br>
<sec:ifLoggedIn>
    <g:link controller="logout" action="index"><button>Logout</button></g:link>
</sec:ifLoggedIn>
<sec:ifNotLoggedIn>
    <g:link class="center-block" controller="logout" action="index"><button class="btn-danger btn center-block" style="height: auto;width:70px;">Login</button></g:link>
</sec:ifNotLoggedIn>
<br><br><br>
<div class="row no-pad no-margin">
<div class="well" style= "width:40%; height: 60%; margin: 0 auto; border:black;border-radius: 15px;">
    <img src="${resource(dir: 'images',file: 'it.png')}" alt="Logo">



    <br>
    <br><br>


    <div class="col-md-5">


        <h4> Are you a job seeker?</h4> <br>
        <g:link controller="home" action="signup" params="[userType:'jobSeeker']" class="btn btn-success btn-lg center-block">Job Seeker</g:link>

    </div>


    <div class="col-md-2">
        <p class="text-center"> | </p>
        <p class="text-center"> | </p>
        <p class="text-center"> | </p>
        <p class="text-center"> | </p>
        <p class="text-center"> | </p>
    </div>


    <div class="col-md-5">

        <h4> Are you a Employer? </h4><br>
        <g:link controller="home" action="signup" params="[userType:'employer']" class="btn btn-success btn-lg center-block">Employer</g:link>
    </div>
</div>
</div>





</body>

</html>

