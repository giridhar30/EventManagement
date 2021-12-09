<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="ISO-8859-1"%> <%@ taglib prefix="spring"
uri="http://www.springframework.org/tags/form" %> <%@ taglib
uri="/WEB-INF/customtags.tld" prefix="mytag" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Welcome to Event Management</title>
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />
  </head>
  <body>
    <%@ include file="navbar.jsp" %>
    <h3 style="text-align: center; margin-bottom: 30px;">Tell us the type of your event</h3>
    <div class="container">
      <div class="row">
        <c:forEach items="${eventTypes}" var="event">
          <div class="col-sm-4">
            <div class="card" style="width: 18rem;">
               <img src="${event.imgUrl}" class="card-img-top" alt="Event Image"  style="height: 300px; object-fit: contain;">
               <div class="card-body" style="display: flex; justify-content: space-between; align-content: center;">
                  <h5 class="card-title">${event.eventName}</h5>
                  <!-- <p class="card-text"></p> -->
                  <form method="post" action="/event">
                     <input type="hidden" name="event" value=${event.getEventName().toLowerCase()} />
                     <button class="btn btn-primary">Select</button>
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
      </ul>
    </div>
  </body>
</html>
