<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@ taglib prefix="spring"
uri="http://www.springframework.org/tags/form" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <title>Admin Home</title>
    <link rel="icon" href="/assets/logo.png" type="image/icon type" />
    <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css" />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic"
    />
    <link rel="stylesheet" href="/assets/fonts/font-awesome.min.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.css"
    />
    <link rel="stylesheet" href="/assets/styles.css" />
    <style>
      .btn {
        border-radius: 5px;
      }
    </style>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  </head>
  <body>
    <%@include file="navbar.jsp" %>
    <h2 style="text-align: center; margin: 20px">Admin Home</h2>
    <div style="display: flex; justify-content: center">
      <table class="table table-striped" style="width: 80vw; margin-top: 30px">
        <tr>
          <th>Model</th>
          <th>View</th>
          <th>Add</th>
        </tr>
        <tr>
          <td>User</td>
          <td><a href="/admin/user" class="btn btn-primary">View</a></td>
          <td><button disabled="true" class="btn btn-success">Add</button></td>
        </tr>
        <tr>
          <td>Hall</td>
          <td><a href="/admin/hall" class="btn btn-primary">View</a></td>
          <td><a href="/admin/hall/add" class="btn btn-success">Add</a></td>
        </tr>
        <tr>
          <td>Decoration</td>
          <td><a href="/admin/decoration" class="btn btn-primary">View</a></td>
          <td>
            <a href="/admin/decoration/add" class="btn btn-success">Add</a>
          </td>
        </tr>
        <tr>
          <td>Cake</td>
          <td><a href="/admin/cake" class="btn btn-primary">View</a></td>
          <td><a href="/admin/cake/add" class="btn btn-success">Add</a></td>
        </tr>
        <tr>
          <td>Photography</td>
          <td><a href="/admin/photography" class="btn btn-primary">View</a></td>
          <td>
            <a href="/admin/photography/add" class="btn btn-success">Add</a>
          </td>
        </tr>
        <tr>
          <td>Event Type</td>
          <td><a href="/admin/eventtype" class="btn btn-primary">View</a></td>
          <td>
            <a href="/admin/eventtype/add" class="btn btn-success">Add</a>
          </td>
        </tr>
        <tr>
          <td>Event</td>
          <td><a href="/admin/event" class="btn btn-primary">View</a></td>
          <td><button disabled="true" class="btn btn-success">Add</button></td>
        </tr>
      </table>
    </div>
    <c:set var="login" value="${login}" />
    <c:if test="${login!=null}">
      <script>
        swal("Login Success!", "You have logged in successfully!", "success");
      </script>
    </c:if>
  </body>
</html>
