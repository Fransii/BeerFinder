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
        response.addDateHeader("Expires", 0);
    %>

    <script src="http://maps.google.com/maps/api/js?key=AIzaSyBa3bPy64RClM1XkqBmx5-amTMqwd1B3ic"
            type="text/javascript"></script>
    <style type="text/css">
        <%@include file="../resources/bootstrap/css/bootstrap.min.css" %>
        <%@include file="../resources/bootstrap/css/bootstrap-theme.min.css" %>


    </style>
    <script>
        var myCenter = new google.maps.LatLng(Number(${promotion.store.coordX}), Number(${promotion.store.coordY}));
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
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
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

<div class="container" style="width: 1000px;height: 700px;margin: auto;margin-top: 100px;">

    <div style="text-align:center;width: 900px;height: 400px;margin: auto;margin-top: 50px;">



        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr>
                    <th>Promotion Id</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>City</th>
                    <th>Store Name</th>
                    <th>Store Adres</th>
                    <th>Store Build Numer</th>
                    <th>Beer Name</th>
                    <th>Beer Price</th>
                </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>${promotion.promotionId}</td>
                        <td>${promotion.startDate}</td>
                        <td>${promotion.endDate}</td>
                        <td>${promotion.store.adress.city}</td>
                        <td>${promotion.store.adress.street}</td>
                        <td>${promotion.store.adress.buildNumber}</td>
                        <td>${promotion.store.name}</td>
                        <td>${promotion.beer.name}</td>
                        <td>${promotion.beer.price}</td>
                    </tr>
                </tbody>
            </table>

            <div id="googleMap" style="width:500px;height:380px;margin: auto"></div>
        </div>
    </div>
</div>


</div><!-- /.container -->

<script type="text/javascript">

    <%@include file="../resources/bootstrap/js/bootstrap.min.js" %>
</script>
</body>
</html>