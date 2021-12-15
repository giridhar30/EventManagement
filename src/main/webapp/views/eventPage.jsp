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
    <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css">
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800">
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic">
      <link rel="stylesheet" href="/assets/fonts/font-awesome.min.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.css">
      <link rel="stylesheet" href="/assets/styles.css" />
      <script src="/assets/scripts.js"></script>
      <style>
        .header {
            margin: 10%;
            padding: 3%;
            padding-top: 0;
        }
        .header h1 {
            padding: 5%;
            padding-top: 1%;
        }
      </style>
  </head>
  <body>
    <div id="errorMsg"></div>
    <%@ include file="navbar.jsp" %>
    <h3 style="text-align: center; margin: 30px;">Tell us the type of your event</h3>
    <div class="container">
      <div class="row">
        <c:forEach items="${eventTypes}" var="event">
          <div class="col-sm-4">
            <div class="card" style="width: 18rem;">
               <img src="/images/event_type_wedding.jpg" class="card-img-top" alt="Event Image"  style="height: 300px; object-fit: contain;">
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
    <c:set var="error" value="${error}" />
    <c:if test="${error!=null}">
      <script>
        showErrorMsg("${error}");
      </script>
    </c:if>
  </body>
</html>
