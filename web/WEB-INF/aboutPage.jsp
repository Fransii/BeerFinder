<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: franciszekdanes
  Date: 13.11.2016
  Time: 19:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BeerFinder About</title>
    <script src="http://code.jquery.com/jquery-1.10.2.js"
            type="text/javascript"></script>

    <%

        response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0");
        response.addHeader("Pragma", "no-cache");
        response.addDateHeader ("Expires", 0);
    %>

    <script src="http://maps.google.com/maps/api/js?key=AIzaSyBa3bPy64RClM1XkqBmx5-amTMqwd1B3ic" type="text/javascript"></script>
    <style type="text/css">
        <%@include file="../resources/bootstrap/css/bootstrap.min.css" %>
        <%@include file="../resources/bootstrap/css/bootstrap-theme.min.css" %>

    </style>
    <script>
        var myCenter = new google.maps.LatLng(50.062279, 19.937902);
        var marker;

        function initialize() {
            var mapProp = {
                center: myCenter,
                zoom: 13,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };

            var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);

            var marker = new google.maps.Marker({
                position: myCenter,
                animation: google.maps.Animation.BOUNCE
            });

            marker.setMap(map);
        }

        google.maps.event.addDomListener(window, 'load', initialize);

    </script>

    <style>
        body {
            padding-top: 50px;
        }

        .starter-template {
            padding: 40px 15px;
            text-align: center;
        }

    </style>
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">BeerFinder</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="/">Home</a></li>
                <li class="active"><a href="AboutPageServlet">About</a></li>
                <li><a href="ContactPageServlet">Contact</a></li>

                <c:if test="${sessionScope.email == null}">
                    <li><a href="LoginPageServlet">Login</a></li>
                    <li><a href="RegistrationPageServlet">Registration</a></li>
                </c:if>
                <c:if test="${sessionScope.email != null }">
                    <li><a href="LogoutServlet">Logout</a></li>
                </c:if>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>

<div class="container">



    <div class="container">
        <div class="jumbotron" style="background-color:#2a75c8;margin-top:2%;color:white;">
            <div class="row">
                <div class="col-sm-12 col-lg-12" style="text-align: center">
                    <h2 class="h2" style="margin-top:-2%"><b>About Beer Finder</b></h2>
                    <h4>Become a master of finding beer promotion</h4>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row" style="text-align: center">
            <div class="col-sm-12">
                <div class="well">
                    <h3 style="line-height:20%;"><i class="fa fa-home fa-1x" style="line-height:6%;color:#339966"></i>What you will find here:</h3>
                    <p >
                        The best promotions of alcohol in your area!
                    </p><br>
                    <h3 style="line-height:20%;"><i class="fa fa-home fa-1x" style="line-height:6%;color:#339966"></i>You can also:</h3>
                    <p >
                        Adding places where is an opportunity to buy cheap alcohol!
                    </p>
                    <p>
                        Rate and comment promotions found by others people!
                    </p>
                </div>
            </div>
            <div class="col-sm-6">

            </div>
        </div>
    </div>



</div><!-- /.container -->

<script type="text/javascript">

    <%@include file="../resources/bootstrap/js/bootstrap.min.js" %>
</script>
</body>
</html>
