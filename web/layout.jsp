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

    <style type="text/css">
        <%@include file="resources/bootstrap/css/bootstrap.min.css" %>
        <%@include file="resources/bootstrap/css/bootstrap-theme.min.css" %>
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
          <li><a href="jsp/aboutPage.jsp">About</a></li>
          <li><a href="jsp/contactPage.jsp">Contact</a></li>
        </ul>
      </div><!--/.nav-collapse -->
    </div>
  </nav>

  <div class="container">

    <div class="starter-template">
      <h1>Bootstrap starter template</h1>
      <p class="lead">Use this document as a way to quickly start any new project.<br> All you get is this text and a mostly barebones HTML document.</p>
    </div>

  </div><!-- /.container -->

  <script type="text/javascript">
    <%@include file="resources/libs/js/jquery.min.js" %>
    <%@include file="resources/bootstrap/js/bootstrap.min.js" %>
  </script>
  </body>
</html>
