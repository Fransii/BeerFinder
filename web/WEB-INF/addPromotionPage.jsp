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
    <title>BeerFinder Add</title>
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

        function myMap() {
            var mapCanvas = document.getElementById("map");
            var myCenter = new google.maps.LatLng(50.06222197114333, 19.936991035938263);
            var mapOptions = {center: myCenter, zoom: 12};
            var map = new google.maps.Map(mapCanvas, mapOptions);
            google.maps.event.addListener(map, 'click', function (event) {
                placeMarker(map, event.latLng);
            });
        }
        var marker1;
        function placeMarker(map, location) {
            if (marker1) {
                marker1.setPosition(location);
            } else {
                marker1 = new google.maps.Marker({
                    position: location,
                    map: map
                });
            }

            var lat = marker1.getPosition().lat();
            var lng = marker1.getPosition().lng();

            document.getElementById("coordX").value = lat;
            document.getElementById("coordY").value = lng;
            //
            var geocoder;
            geocoder = new google.maps.Geocoder();
            var latlng = new google.maps.LatLng(lat, lng);

            /*   geocoder.geocode(
             {'latLng': latlng},
             function(results, status) {
             if (status == google.maps.GeocoderStatus.OK) {
             if (results[0]) {
             var add= results[0].formatted_address ;
             var  value=add.split(",");

             count=value.length;
             country=value[count-1];
             state=value[count-2];
             city=value[count-3];
             alert("city name is: " + add);
             }
             else  {
             alert("address not found");
             }
             }
             else {
             alert("Geocoder failed due to: " + status);
             }
             }
             );*/
            var GEOCODING = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=' + lat + '%2C' + lng + '&language=en';

            $.getJSON(GEOCODING).done(function (location) {

                document.getElementById("city").value = location.results[0].address_components[4].long_name;
                document.getElementById("street").value = location.results[0].address_components[1].long_name;
                document.getElementById("postCode").value = location.results[0].address_components[6].long_name;
                document.getElementById("buildNumber").value = location.results[0].address_components[0].long_name;

            })
            //
            var infowindow = new google.maps.InfoWindow({
                content: 'Latitude: ' + location.lat() + '<br>Longitude: ' + location.lng()
            });
            infowindow.open(map, marker);
        }
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

<div class="container panel-default col-lg-12" >

    <div class="panel-body col-lg-12">
        <form class="form-signin" method="post" action="AddPromotionServlet">
            <div class="panel panel-primary">
                <div style="text-align:center;" class="panel-heading">
                    <h2 style="margin-top:10px;">Add Promotion</h2>
                </div>

                <div class="panel-body" style="text-align:center;">
                    <h4>Mark the place location on map</h4>
                    <div id="map" style="width:100%;height:350px;margin-bottom:20px;"></div>
                    <label for="city" class="sr-only">City</label>
                    <input type="text" id="city" class="form-control" value="${param.city}" name="city"
                           placeholder="City"
                           required>
                    <br>
                    <label for="street" class="sr-only">Street</label>
                    <input type="text" id="street" class="form-control" value="${param.street}" name="street"
                           placeholder="Street" required>
                    <br>
                    <label for="buildNumber" class="sr-only">Build Number</label>
                    <input type="text" id="buildNumber" class="form-control" value="${param.buildNumber}"
                           name="buildNumber"
                           placeholder="Build Number" required>
                    <hr>
                    <label for="coordX" class="sr-only">CoordX</label>
                    <input type="hidden" id="coordX" class="form-control" value="${param.coordX}" name="coordX"
                           placeholder="CoordX" required>
                    <label for="coordY" class="sr-only">CoordY</label>
                    <input type="hidden" id="coordY" class="form-control" value="${param.coordY}" name="coordY"
                           placeholder="CoordY" required>
                    <label for="postCode" class="sr-only">Post Code</label>
                    <input type="hidden" id="postCode" class="form-control" value="${param.street}" name="postCode"
                           placeholder="Post Code" required>

                    <label for="startDate" class="sr-only">Promotion start Date</label>
                    <input type="date" id="startDate" class="form-control" value="${param.startDate}" name="startDate"
                           placeholder="Promotion start date" required autofocus>
                    <br>
                    <label for="endDate" class="sr-only">Promotion end Date</label>
                    <input type="date" id="endDate" class="form-control" value="${param.endDate}" name="endDate"
                           placeholder="Promotion end date" required>
                    <br>
                    <label for="storeName" class="sr-only">StoreName</label>
                    <input type="text" id="storeName" class="form-control" value="${param.storeName}" name="storeName"
                           placeholder="Store Name" required>
                    <br>
                    <label for="beerName" class="sr-only">Beer Name</label>
                    <input type="text" id="beerName" class="form-control" value="${param.beerName}" name="beerName"
                           placeholder="Beer Name" required>
                    <br>
                    <label for="beerCapacity" class="sr-only">Beer Capacity</label>
                    <input type="text" id="beerCapacity" class="form-control" value="${param.beerCapacity}"
                           name="beerCapacity"
                           placeholder="Beer Capacity" required>
                    <br>
                    <label for="beerPackage" class="sr-only">Beer Package</label>
                    <input type="text" id="beerPackage" class="form-control" value="${param.beerPackage}"
                           name="beerPackage"
                           placeholder="Beer Package" required>
                    <br>
                    <label for="beerPrice" class="sr-only">Beer Price</label>
                    <input type="text" id="beerPrice" class="form-control" value="${param.beerPrice}" name="beerPrice"
                           placeholder="Beer Price" required>
                    <br>
                    <button class="btn btn-lg btn-primary btn-block" type="submit">Add!</button>
                    <span class="error">${errors.blad}</span>

                </div>
            </div>
        </form>
    </div>


</div><!-- /.container -->
<script src="http://maps.google.com/maps/api/js?key=AIzaSyBa3bPy64RClM1XkqBmx5-amTMqwd1B3ic&callback=myMap"
        type="text/javascript"></script>
<script type="text/javascript">

    <%@include file="../resources/bootstrap/js/bootstrap.min.js" %>
</script>
</body>
</html>
