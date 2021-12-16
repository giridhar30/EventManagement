<%@page import="java.util.List"%> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="ISO-8859-1"%> <%@ taglib
uri="/WEB-INF/customtags.tld" prefix="mytag" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Select type of Decoration</title>
      <link rel="icon"  href="/assets/logo.png"  type="image/icon type"> 
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
      <div class="row" style="padding-bottom: 30px">
         <div class="col-sm-9">
            <h4 style="text-align: center; padding-bottom: 10px" class="mt-4">Add your desired decoration(s)</h4>
         </div>
       </div>
      <div class="row">
         <div class="col-sm-9">
            <div class="row">
         <c:forEach items="${addon}" var="decor">
            <div class="col-sm-6" style="display: flex; align-items: center; justify-content: center;">
               <div class="card my-card" style="width: 18rem;">
                  <img class="card-img-top disp-img" src="${decor.imgUrl}"
                  alt="${decor.name}">
                  <div class="card-body">
                     <div style="display: flex; justify-content: space-between; align-items: baseline;">
                    <h6 class="card-title"><b>${decor.name}</b></h6>
                    <h5 class="card-text" style="color: grey">&#x20b9;${decor.price}</h5>
                  </div>
                  <form method="post" action="/event/addon/decoration/add" style="float: right;">
                     <input type="hidden" name="id" value="${decor.id}" />
                     <input
                       type="hidden"
                       name="${_csrf.parameterName}"
                       value="${_csrf.token}"
                     />
                      <c:choose>
                        <c:when test="${fn:contains(addonSet, decor)}">
                          <input type="submit" value="Added" disabled="true" class="btn btn-outline-secondary" />
                        </c:when>
                        <c:otherwise>
                          <input type="submit" value="Add" class="btn btn-outline-primary" />
                        </c:otherwise>
                      </c:choose>
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
