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
    <title>$Title$</title>
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
                <li class="active"><a href="/">Home</a></li>
                <li><a href="AboutPageServlet">About</a></li>
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

<div class="container" style="width: 600px;height: 700px;margin: auto;margin-top: 100px;">

    <div style="width: 300px;height: 200px;margin: auto;margin-top: 100px;">
        <form class="form-signin" method="post" action="AddPromotionServlet">
            <h2 class="form-signin-heading">Add promotion ... </h2>

            <label for="startDate" class="sr-only">Promotion start Date</label>
            <input type="text" id="startDate" class="form-control" value="${param.startDate}" name="startDate" placeholder="Promotion start date" required autofocus>

            <label for="endDate" class="sr-only">Promotion end Date</label>
            <input type="text" id="endDate" class="form-control" value="${param.endDate}" name="endDate" placeholder="Promotion end date" required>

            <label for="coordX" class="sr-only">CoordX</label>
            <input type="text" id="coordX" class="form-control" value="${param.coordX}" name="coordX" placeholder="CoordX" required>

            <label for="coordY" class="sr-only">CoordY</label>
            <input type="text" id="coordY" class="form-control" value="${param.coordY}" name="coordY" placeholder="CoordY" required>

            <label for="storeName" class="sr-only">StoreName</label>
            <input type="text" id="storeName" class="form-control" value="${param.storeName}" name="storeName" placeholder="Store Name" required>

            <label for="beerName" class="sr-only">Beer Name</label>
            <input type="text" id="beerName" class="form-control" value="${param.beerName}" name="beerName" placeholder="Beer Name" required>

            <label for="beerCapacity" class="sr-only">Beer Capacity</label>
            <input type="text" id="beerCapacity" class="form-control" value="${param.beerCapacity}" name="beerCapacity" placeholder="Beer Capacity" required>

            <label for="beerPackage" class="sr-only">Beer Package</label>
            <input type="text" id="beerPackage" class="form-control" value="${param.beerPackage}" name="beerPackage" placeholder="Beer Package" required>

            <label for="beerPrice" class="sr-only">Beer Price</label>
            <input type="text" id="beerPrice" class="form-control" value="${param.beerPrice}" name="beerPrice" placeholder="Beer Price" required>

            <label for="city" class="sr-only">City</label>
            <input type="text" id="city" class="form-control" value="${param.city}" name="city" placeholder="City" required>

            <label for="postCode" class="sr-only">Post Code</label>
            <input type="text" id="postCode" class="form-control" value="${param.street}" name="postCode" placeholder="Post Code" required>

            <label for="street" class="sr-only">Street</label>
            <input type="text" id="street" class="form-control" value="${param.street}" name="street" placeholder="Street" required>

            <label for="buildNumber" class="sr-only">Build Number</label>
            <input type="text" id="buildNumber" class="form-control" value="${param.buildNumber}" name="buildNumber" placeholder="Build Number" required>

            <button class="btn btn-lg btn-primary btn-block" type="submit">Add!</button>
            <span class="error">${errors.blad}</span>
        </form>
    </div>


</div><!-- /.container -->

<script type="text/javascript">

    <%@include file="../resources/bootstrap/js/bootstrap.min.js" %>
</script>
</body>
</html>
