<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Login</title>
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="/assets/styles.css" />
    <script src="/assets/scripts.js"></script>
  </head>
  <body>

    <c:url value="/user/logout" var="logoutUrl" />
    <form id="logout" action="${logoutUrl}" method="post">
      <input
        type="hidden"
        name="${_csrf.parameterName}"
        value="${_csrf.token}"
      />
    </form>

    <div class="nav-bar">
      <div class="left">
        <h5>GRANDEUR EVENT MANAGERS</h5>
      </div>
      <div class="right">
        <a class="m-4" href="/home">Home</a>
            <a
              class="m-4"
              href="javascript:document.getElementById('logout').submit()"
            >
              Logout
            </a>
      </div>
    </div>    

    <p class="h2 text-muted text-center mt-3">My Events</p>

    <table class="table table-striped mt-5">
      <tr class="table">
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
  </body>
</html>
