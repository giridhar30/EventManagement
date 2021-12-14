<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@ taglib prefix="spring"
uri="http://www.springframework.org/tags/form" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <title>Admin Home</title>
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />
  </head>
  <body>
    <h2 style="text-align: center; margin: 20px">Admin Home</h2>
    <div style="position: absolute; top: 10px; right: 20px">
      <a class="btn btn-secondary" href="/user/logout">Logout</a>
    </div>
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
          <td><a href="/admin/event-type" class="btn btn-primary">View</a></td>
          <td>
            <a href="/admin/event-type/add" class="btn btn-success">Add</a>
          </td>
        </tr>
        <tr>
          <td>Event</td>
          <td><a href="/admin/event" class="btn btn-primary">View</a></td>
          <td><button disabled="true" class="btn btn-success">Add</button></td>
        </tr>
      </table>
    </div>
  </body>
</html>
