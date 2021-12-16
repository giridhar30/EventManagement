<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Login</title>
    <link rel="icon"  href="/assets/logo.png"  type="image/icon type"> 
    <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css">
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800">
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic">
      <link rel="stylesheet" href="/assets/fonts/font-awesome.min.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.css">
      <link rel="stylesheet" href="/assets/styles.css" />
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  </head>
  <body>

    <%@include file="navbar.jsp" %> 

    <p class="h2 text-muted text-center mt-3">My Events</p>

    <table class="table table-striped mt-5">
      <tr>
        <th>Event</th>
        <th>From</th>
        <th>To</th>
        <th>Hall</th>
        <th>Add-Ons</th>
      </tr>
      <c:forEach items="${events}" var="event">
        <tr>
          <td>${event.type}</td>
          <td>${event.fromDate}</td>
          <td>${event.toDate}</td>
          <td>${event.hall.name}</td>
          <td>
            <c:forEach items="${event.addons}" var="addon">
              ${addon.name} <br>
            </c:forEach>
          </td>
        </tr>
      </c:forEach>
    </table>

    <c:set var="paymentSuccess" value="${paymentSuccess}" />

    <c:if test="${paymentSuccess}">
      <script>
        swal("Transaction Success!", "Event booked successfully!", "success");
      </script>
    </c:if>

  </body>
</html>
