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
    <title>BeerFinder Register</title>
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
                    <li><a href="LoginPageServlet">Login</a></li>
                    <li class="active"><a href="RegistrationPageServlet">Registration</a></li>
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
                        <h2 class="h2" style="margin-top:-2%"><b>Create new account</b></h2>
                        <h4>to join to the community of Beer Finder</h4>
                    </div>
                </div>
            </div>
        </div>
    <div style="width: 300px;height: 300px;margin: auto;margin-top: 20px;">
        <form class="form-signin" action="RegistrationServlet" method="post">
            <label for="firstName" class="sr-only">Imie</label>
            <input type="text" id="firstName" name="firstName" value="${param.firstName}" class="form-control"
                   placeholder="Imie" required><br>
            <label for="lastName" class="sr-only">Nazwisko</label>
            <input type="text" id="lastName" name="lastName" value="${param.lastName}" class="form-control"
                   placeholder="Nazwisko" required><br>
            <label for="email" class="sr-only">Email address</label>
            <input type="email" id="email" name="email" value="${param.email}" class="form-control"
                   placeholder="Email address" required autofocus><br>
            <label for="password" class="sr-only">Password</label>
            <input type="password" id="password" name="password" class="form-control" placeholder="Password"
                   required><br><br>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
        </form>
        <span class="error">${errors.email}</span>
    </div>


</div><!-- /.container -->

<script type="text/javascript">

    <%@include file="../resources/bootstrap/js/bootstrap.min.js" %>
</script>
</body>
</html>
