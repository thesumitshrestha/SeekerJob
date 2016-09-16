<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <script src="../js/jquery-1.11.0.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/bootstrap-select.min.js"></script>
    <link rel="stylesheet" href="../css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../css/bootstrap-theme.css"/>
    <link rel="stylesheet" href="../css/custom.css"/>
    <link rel="stylesheet" href="../css/font-awesome-min.css">
    <link rel="stylesheet" href="../css/jquery-ui.css"/>
    <script src="../js/jquery-ui.js"></script>
    <script src="../js/datatable-min.js"></script>
    <link href="../css/jquery-datatable-min.css" rel="stylesheet"/>
    <g:layoutHead/>
    <g:javascript library="application"/>
    <r:layoutResources />
    <style>
    body{
        border:0px;
        height:100%;
    }
    #show  ul {
        display:block;
        background:#003366;
        list-style:none;
        margin:0;
        padding:12px 10px;
        height:45px;
        border-radius: 5px;
    }
    #show ul li {
        float:left;
        font:16px helvetica;
        font-weight:bold;
        margin:3px 0;
    }
    #show  ul li a {
        color:#fff;
        text-decoration:none;
        padding:12px 10px;
        cursor:pointer;

    }
    #show ul li a:hover {
        background-color: #3573a3;
        text-decoration:none;
        cursor:pointer;
    }

    #noti_Container {
        position:relative;
    }

    /* A CIRCLE LIKE BUTTON IN THE TOP MENU. */
    #noti_Button {
        width:22px;
        height:22px;
        line-height:22px;
        border-radius:50%;
        -moz-border-radius:50%;
        -webkit-border-radius:50%;
        background:#FFF;
        margin:-3px 10px 0 10px;
        cursor:pointer;
    }

    /* THE POPULAR RED NOTIFICATIONS COUNTER. */
    #noti_Counter {
        display:block;
        position:absolute;
        background:#E1141E;
        color:#FFF;
        font-size:12px;
        font-weight:normal;
        padding:1px 3px;
        margin:-8px 0 0 25px;
        border-radius:2px;
        -moz-border-radius:2px;
        -webkit-border-radius:2px;
        z-index:1;
    }

    /* THE NOTIFICAIONS WINDOW. THIS REMAINS HIDDEN WHEN THE PAGE LOADS. */
    #notifications {
        display:none;
        width:430px;
        position:absolute;
        top:30px;
        left:0;
        background:#FFF;
        border:solid 1px rgba(100, 100, 100, .20);
        -webkit-box-shadow:0 3px 8px rgba(0, 0, 0, .20);
        z-index: 0;
    }
    /* AN ARROW LIKE STRUCTURE JUST OVER THE NOTIFICATIONS WINDOW */
    #notifications:before {
        content: '';
        display:block;
        width:0;
        height:0;
        color:transparent;
        border:10px solid #CCC;
        border-color:transparent transparent #FFF;
        margin-top:-20px;
        margin-left:10px;
    }

    h3 {
        display:block;
        color:#333;
        background:#FFF;
        font-weight:bold;
        font-size:13px;
        padding:8px;
        margin:0;
        border-bottom:solid 1px rgba(100, 100, 100, .30);
    }

    .seeAll {
        background:#F6F7F8;
        padding:8px;
        font-size:12px;
        font-weight:bold;
        border-top:solid 1px rgba(100, 100, 100, .30);
        text-align:center;
    }
    .seeAll a {
        color:#3b5998;
    }
    .seeAll a:hover {
        background:#F6F7F8;
        color:#3b5998;
        text-decoration:underline;
    }
    </style>
    <script>
        $(document).ready(function () {
            var mcount = <%=  session.getAttribute("messageCount") %>
                // ANIMATEDLY DISPLAY THE NOTIFICATION COUNTER.
                    $('#noti_Counter')
                            .css({ opacity: 0 })
                            .text(mcount)              // ADD DYNAMIC VALUE (YOU CAN EXTRACT DATA FROM DATABASE OR XML).
                            .css({ top: '-10px' })
                            .animate({ top: '-2px', opacity: 1 }, 500);

            $('#noti_Button').click(function () {

                // TOGGLE (SHOW OR HIDE) NOTIFICATION WINDOW.
                $('#notifications').fadeToggle('fast', 'linear', function () {
                    if ($('#notifications').is(':hidden')) {
                        $('#noti_Button').css('background-color', '#2E467C');
                    }
                    else $('#noti_Button').css('background-color', '#FFF');        // CHANGE BACKGROUND COLOR OF THE BUTTON.
                });

                $('#noti_Counter').fadeOut('slow');                 // HIDE THE COUNTER.

                return false;
            });

            // HIDE NOTIFICATIONS WHEN CLICKED ANYWHERE ON THE PAGE.
            $(document).click(function () {
                $('#notifications').hide();

                // CHECK IF NOTIFICATION COUNTER IS HIDDEN.
                if ($('#noti_Counter').is(':hidden')) {
                    // CHANGE BACKGROUND COLOR OF THE BUTTON.
                    $('#noti_Button').css('background-color', '#2E467C');
                }
            });

            $('#notifications').click(function () {
                return false;       // DO NOTHING WHEN CONTAINER IS CLICKED.
            });
        });
    </script>
</head>
<body>
<div class="header">

    <img src="${resource(dir: 'images',file: 'it.png')}" alt="Logo"/>


    <div class="dropdown" style="float: right; margin: 10px 10px 10px 10px" >
        <button class="btn btn-primary btn-lg dropdown-toggle" type="button" data-toggle="dropdown">

            <sec:ifLoggedIn>
                <img src="${resource(dir:"profilePicture",file: session?.user?.username+".jpg")}" width="20px"; height="20px"/>
            </sec:ifLoggedIn>
            <span class="caret"></span></button>

        <ul class="dropdown-menu">
            <li><sec:ifLoggedIn>
                <g:link controller="logout" action="index">Logout</g:link>
            </sec:ifLoggedIn></li>

        </ul>


    </div>


    <div id="show" class="dropdown" style= "float: right; margin:10px 10px 10px 10px ">

        <ul >

         %{--   <li id="noti_Container">
                <div id="noti_Counter"></div>   <!--SHOW NOTIFICATIONS COUNT.-->

            <!--A CIRCLE LIKE BUTTON TO DISPLAY NOTIFICATION DROPDOWN.-->
                <div id="noti_Button"></div>

                <!--THE NOTIFICAIONS DROPDOWN BOX.-->
                --}%%{--<div id="notifications">
                    <h3>Notifications</h3>
                    <div style="height:300px;"></div>
                    <div class="seeAll"><a href="#">See All</a></div>
                </div>--}%%{--
            </li>--}%
            <li><g:link controller="message" action="messageList">Message</g:link> </li>

            <li style="color:White"> | </li>
            <li></li>
            <li>
                <g:link controller="user" action="profile">
                    Welcome  ${session?.user?.username}
                </g:link>
            </li>
        </ul>


    </div>
</div>
<div class="customNavBr">
    <div style="height: 72%; margin: auto 8% auto 8%;">
        <div class="panel panel-default">
            <div class="panel-body">
                <ul class="nav navbar-nav">
                    <li><g:link controller="home" action="index">Home</g:link></li>
                    <g:if test="${session.userRole!='ROLE_ADMIN'}">
                        <li><g:link controller="user" action="profile">My Profile</g:link></li>
                    </g:if>
                    <g:if test="${session?.user}">
                        <g:if test="${session.userRole=='ROLE_ADMIN'}">
                            <li><g:link controller="skill" action="index">Skill</g:link> </li>
                            <li><g:link controller="user" action="userList"> User List</g:link></li>
                        </g:if>
                        <g:if test="${session.userRole=='ROLE_JOBSEEKER'}">
                            <li><g:link controller="job" action="offerList">Offer List</g:link></li>
                        </g:if>
                        <g:elseif test="${session.userRole=='ROLE_EMPLOYER'}">
                            <li><g:link controller="user" action="jobSeekerList">JobSeeker List</g:link> </li>
                            <li><g:link controller="job" action="hireList">Hired List</g:link> </li>
                            <li><g:link controller="job" action="searchPage">Search</g:link></li>
                        </g:elseif>
                    </g:if>
                %{--<li><a href="#">About US</a></li>--}%
                </ul>
            </div>
        </div>
    </div>

    <g:layoutBody/>
    <br><br><br><br>
    <div id="footer" style=" position:relative; width:100%; height:50px;  clear: both; text-align: center; bottom: 0 ;left:0; font-size: 20px;margin-bottom: 0px">
        <p>&copy; 2016, Deerwalk Institute of Technology. All rights reserved.</p>
    </div>
    %{--<div id="footer" style=" position:relative; width:100%; height:50px;  clear: both; text-align: center; color: whitesmoke; bottom: 0 ;left:0; font-size: 20px;margin-bottom: 0px">
        <p>&copy; 2016, Deerwalk Institute of Technology. All rights reserved.</p>
    </div>--}%
    <r:layoutResources />
</body>
</html>
