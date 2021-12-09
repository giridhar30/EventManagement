<%@page import="java.util.List"%> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="ISO-8859-1"%> <%@ taglib
uri="/WEB-INF/customtags.tld" prefix="mytag" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Select tyope of Decoration</title>
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
          padding: 10px;
       }
    </style>
  </head>
  <body>
    <%@ include file="navbar.jsp" %>
    
    <div class="container">
      <div class="row">
         <div class="col-sm-9">
            <h4 style="text-align: center; padding-bottom: 10px">Add your desired decoration(s)</h4>
         </div>
       </div>
      <div class="row">
         <div class="col-sm-9">
            <div class="row">
         <c:forEach items="${addon}" var="decor">
            <div class="col-sm-6" style="display: flex; align-items: center; justify-content: center;">
               <div class="card my-card" style="width: 18rem;">
                  <img class="card-img-top disp-img" src="http://localhost:8080/${decor.imgUrl}"
                  alt="${decor.name}">
                  <div class="card-body">
                     <div style="display: flex; justify-content: space-between; align-items: baseline;">
                    <h6 class="card-title">${decor.name}</h6>
                    <h5 class="card-text" style="color: grey">&#x20b9;${decor.price}</h5>
                  </div>
                  <form method="post" action="/event/addon/decoration/add" style="float: right;">
                     <input type="hidden" name="id" value="${decor.id}" />
                     <input
                       type="hidden"
                       name="${_csrf.parameterName}"
                       value="${_csrf.token}"
                     />
                     <input type="submit" value="Add" class="btn btn-outline-secondary" />
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
