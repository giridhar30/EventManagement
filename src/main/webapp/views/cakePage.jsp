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
    <link
    rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
    crossorigin="anonymous"
  />
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
            <h4 style="text-align: center; padding-bottom: 10px">Add the type of cake you want</h4>
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
                  <h6 class="card-title">${cake.name}</h6>
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
                <input type="submit" value="Add" class="btn btn-outline-secondary" />
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
   <div style="position: fixed; bottom: 0px;">
    <a href="/event/addon" class="btn btn-success" style="width: 65vw;" >
      Continue
    </a>
  </div>
  </body>
</html>
