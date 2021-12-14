<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@ taglib prefix="spring"
uri="http://www.springframework.org/tags/form" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <title>Add Hall</title>
    <meta charset="ISO-8859-1" />
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
    <div style="position: absolute; top: 15%; left: 20px">
      <a href="/admin/cake" class="btn btn-secondary">Back</a>
    </div>
    <h2 style="text-align: center; margin-top: 20px">Add Cake</h2>
    <spring:form
      method="post"
      action="/admin/cake/add"
      modelAttribute="cakeBean"
      class="m-5"
      enctype="multipart/form-data"
    >
      <div class="form-group m-4">
        <label style="margin-left: 25%" for="name">Cake Name</label>
        <spring:input
          type="text"
          class="form-control border border-primary"
          style="margin-left: 25%; width: 50%"
          name="name"
          path="name"
          required="true"
        />
      </div>
      <div class="form-group m-4">
        <label style="margin-left: 25%" for="price">Price</label>
        <spring:input
          type="number"
          class="form-control border border-primary"
          style="margin-left: 25%; width: 50%"
          name="price"
          path="price"
          required="true"
        />
      </div>
      <div class="form-group m-4">
        <label style="margin-left: 25%" for="phone">Phone</label>
        <spring:input
          type="number"
          class="form-control border border-primary"
          style="margin-left: 25%; width: 50%"
          name="phone"
          path="phone"
          required="true"
        />
      </div>
      <div class="form-group m-4">
        <label style="margin-left: 25%" for="minQuantity">Min Quantity</label>
        <spring:input
          type="number"
          class="form-control border border-primary"
          style="margin-left: 25%; width: 50%"
          name="minQuantity"
          path="minQuantity"
          required="true"
        />
      </div>
      <div class="form-group m-4">
        <label style="margin-left: 25%" for="file">Image</label>
        <input
          type="file"
          class="form-control border border-primary"
          style="margin-left: 25%; width: 50%"
          name="file"
          required="true"
        />
      </div>

      <div class="text-center pb-3">
        <input
          type="submit"
          class="btn btn-primary"
          style="width: 20%"
          value="ADD"
        />
      </div>
    </spring:form>
    <c:set var="added" value="${added}" />
    <c:if test="${added!=null}">
      <script>
        swal("Added!", "Cake added successfully!", "success");
      </script>
    </c:if>
  </body>
</html>
