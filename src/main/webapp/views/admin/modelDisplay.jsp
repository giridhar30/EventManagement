<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@ taglib prefix="spring"
uri="http://www.springframework.org/tags/form" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ taglib
uri="/WEB-INF/customtags.tld" prefix="mytag" %>
<%@ page import="java.util.List" %>
<html>
  <head>
    <title>Admin Home</title>
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />
    <script>
      function confirmDelete() {
        console.log("in confirm delete");
        return confirm("Do you weant to delete the item?");
      }
    </script>
    <style>
       td {
         min-width: 30px;
          max-width: 100px;
          overflow-wrap: break-word;
       }
   </style>
  </head>
  <body>
    <h2 style="text-align: center; margin: 20px">${modelName}</h2>
    <div style="position: absolute; top: 10px; ;left: 20px">
      <a href="/admin" class="btn btn-secondary">Back</a>
    </div>
    <div>
    <div style="text-align: right; margin: 20px;">
      <a href="/admin/${modelName.toLowerCase()}/add" class="btn btn-primary">Add</a>
    </div>
  </div>
    <div style="display: flex;justify-content: center;">
    <table class="table table-striped" style="width: 90vw; margin: 20px">
      <mytag:modelDisplay list="<%= (List)request.getAttribute(\"list\")%>" modelName="<%= (String)request.getAttribute(\"modelName\") %>" modelClass="<%=(Class<Object>)request.getAttribute(\"modelClass\") %>" />
    </table>
  </div>
  </body>
</html>
