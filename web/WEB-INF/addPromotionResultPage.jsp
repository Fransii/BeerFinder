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
    <title>BeerFinder Succes</title>
    <script src="http://code.jquery.com/jquery-1.10.2.js"
            type="text/javascript"></script>

    <%

        response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0");
        response.addHeader("Pragma", "no-cache");
        response.addDateHeader("Expires", 0);
    %>

    <style type="text/css">
        <%@include file="../resources/bootstrap/css/bootstrap.min.css" %>
        <%@include file="../resources/bootstrap/css/bootstrap-theme.min.css" %>

    </style>
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
                <li><a href="/">Home</a></li>
                <li><a href="AboutPageServlet">About</a></li>
                <li><a href="ContactPageServlet">Contact</a></li>

                <c:if test="${sessionScope.email == null}">
                    <li class="active"><a href="LoginPageServlet">Login</a></li>
                    <li><a href="RegistrationPageServlet">Registration</a></li>
                </c:if>
                <c:if test="${sessionScope.email != null }">
                    <li><a href="LogoutServlet">Logout</a></li>
                </c:if>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>

<div class="container" style="text-align:center;">

    <div class="container" style="width: 300px;height: 700px;margin: auto;margin-top: 100px;">
        <h1 style="color:#2a75c8">Succes!</h1>
        <hr>
        <h4>Adding a new promotion was completed successfully</h4>
        <a href="MainPageServlet" class="btn btn-lg btn-primary btn-block" role="button">OK</a>
    </div>

</div><!-- /.container -->

<script type="text/javascript">

    <%@include file="../resources/bootstrap/js/bootstrap.min.js" %>
</script>
</body>
</html>
