<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>Welcome to Event Management</title>
      <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />
   </head>
   <body style="background-image: url(/images/home-bg.jpg);width:vw;height:vh; background-repeat: no-repeat; background-size: cover;">
      <%@include file="navbar.jsp" %>
      <div style="margin-top: 150px;">
      <h1>
         <pre style="color:white;text-align: justify;margin-left: -100px;">
            Welcome to 
            Event Management
            <a href="/event" class="btn btn-outline-secondary" style="margin-top: 20px; padding: 10px 30px 10px 30px">Book Hall</a>
         </a>
         </pre>
      </h1>
   </div>
   <body>
</html>