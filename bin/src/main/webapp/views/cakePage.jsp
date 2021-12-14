<%@page import="java.util.List"%> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="ISO-8859-1"%> <%@ taglib
uri="/WEB-INF/customtags.tld" prefix="mytag" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Select Cake</title>
    <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css">
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800">
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic">
      <link rel="stylesheet" href="/assets/fonts/font-awesome.min.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.css">
      <link rel="stylesheet" href="/assets/styles.css" />
  <style>
     .disp-img {
        height: 250px;
        object-fit: contain;
     }
     .my-card {
        margin: 10px;
     }
    </style>
  </head>
  <body>
    <%@ include file="navbar.jsp" %>
    <div class="container">
      <div class="row">
         <div class="col-sm-9">
            <h4 style="text-align: center; padding-bottom: 10px" class="mt-4">Add the type of cake you want</h4>
         </div>
       </div>
      <div class="row" style="padding-bottom: 30px">
         <div class="col-sm-9">
            <div class="row">
      <c:forEach items="${addon}" var="cake">
        <div class="col-sm-6" style="display: flex; align-items: center; justify-content: center;">
          <div class="card my-card" style="width: 18rem;">
             <img class="card-img-top disp-img" src="${cake.imgUrl}"
             alt="${cake.name}">
             <div class="card-body">
                <div style="display: flex; justify-content: space-between; align-items: baseline;">
                  <h5 class="card-title"><b>${cake.name}</b></h5>
                  <h5 class="card-text" style="color: grey">&#x20b9;${cake.price}</h5>
              </div>
              <p>Min: ${cake.minQuantity}kg</p>
              
             <form action="/event/addon/cake/add" method="post" >
              <div class="row" style="align-items: center;">
                <div class="col-sm-8">
              <label>Kg:   </label><input
              name="weight"
              type="number"
              step="0.5"
              min="${cake.minQuantity}"
              value="${cake.minQuantity}"
              style="width: 70px; margin-left: 20px;"
            />
          </div>
          <div class="col-sm-4">
            <c:choose>
              <c:when test="${fn:contains(addonSet, cake)}">
                <input type="submit" value="Added" disabled="true" class="btn btn-outline-secondary" />
              </c:when>
              <c:otherwise>
                <input type="submit" value="Add" class="btn btn-outline-primary" />
              </c:otherwise>
            </c:choose>
          </div>
            </div>
            <input type="hidden" name="qty" value="1" />
            <input type="hidden" name="id" value="${cake.id}" />
            <input
              type="hidden"
              name="${_csrf.parameterName}"
              value="${_csrf.token}"
            />
                
              </form>
             </div>
           </div>
       </div>
      </c:forEach>
    </div>
  </div>
     <div class="col-sm-3">
        <%@include file="cartPage.jsp" %>
     </div>
  
   </div>
   
  <div style="position: fixed; bottom: 20px;">
    <a href="/event/addon" class="btn btn-primary" style="width: 65vw;" >
      Continue
    </a>
  </div>
  </body>
</html>
