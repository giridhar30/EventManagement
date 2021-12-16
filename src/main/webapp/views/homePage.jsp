<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>Welcome to Event Management</title>
      <link rel="icon"  href="/assets/logo.png"  type="image/icon type"> 
      <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css">
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800">
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic">
      <link rel="stylesheet" href="/assets/fonts/font-awesome.min.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.css">
      <link rel="stylesheet" href="/assets/styles.css" />
      <style>
          body {
              background-image: url('/images/Background.png');
              background-repeat: no-repeat;
              background-size: 100% 100%;
          }
      </style>
      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   </head>
   <body>
  
   <%@include file="navbar.jsp" %>
      
   <div class="text-center text-white d-flex masthead header" >
    <div class="container my-auto">
        <div class="row">
            <div class="col-lg-10 mx-auto">
                <h1 class="text-uppercase text-black"><strong>BE a guest at your own event! we plan, you party!<br></strong></h1>
                <hr>
            </div>
        </div>
        <div class="col-lg-8 mx-auto">
            <a class="btn btn-primary btn-xl" role="button" href="/event">PLAN YOUR EVENT</a>
        </div>
    </div>
</div>

   <c:set var="error" value="${error}" />
    <c:if test="${error!=null}">
      <script>
        swal("Error!", "${error}", "error");
      </script>
    </c:if>

    <c:set var="logout" value="${logout}" />
    <c:if test="${logout!=null}">
      <script>
        swal("Logged Out!", "You have been logged out successfully!", "success");
      </script>
    </c:if>

    <c:set var="login" value="${login}" />
    <c:if test="${login!=null}">
      <script>
        swal("Login Success!", "You have logged in successfully!", "success");
      </script>
    </c:if>

   <body>
</html>