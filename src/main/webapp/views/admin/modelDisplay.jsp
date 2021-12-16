<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@ taglib prefix="spring"
uri="http://www.springframework.org/tags/form" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ taglib
uri="/WEB-INF/customtags.tld" prefix="mytag" %>
<%@ page import="java.util.List" %>
<html>
  <head>
    <title>Admin Home</title>
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
    <%@include file="navbar.jsp" %>
    <h2 style="text-align: center; margin: 20px">${modelName}</h2>
    <div style="position: absolute; top: 15%; ;left: 20px">
      <a href="/admin" class="btn btn-secondary" style="color: white">Back</a>
    </div>
    <div>
      <c:if test="${(!modelName.equals(\"User\") && !modelName.equals(\"Event\")) == true}"> 
    <div style="text-align: right; margin: 20px;">
      <a href="/admin/${modelName.toLowerCase()}/add" class="btn btn-primary">Add</a>
    </div>
  </c:if>
  </div>
    <div style="display: flex;justify-content: center;">
    <table class="table table-striped" style="width: 90vw; margin: 20px">
      <mytag:modelDisplay list="<%= (List)request.getAttribute(\"list\")%>" modelName="<%= (String)request.getAttribute(\"modelName\") %>" modelClass="<%=(Class<Object>)request.getAttribute(\"modelClass\") %>" />
    </table>
  </div>
  </body>
</html>
