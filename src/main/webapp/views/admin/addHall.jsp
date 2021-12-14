<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@ taglib prefix="spring"
uri="http://www.springframework.org/tags/form" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <title>Add Hall</title>
    <meta charset="ISO-8859-1" />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />
    <script src="/assets/scripts.js"></script>
    <link rel="stylesheet" href="/assets/styles.css" />
  </head>
  <body>
    <div id="successMsg"></div>
    <div style="position: absolute; top: 10px; left: 20px">
      <a href="/admin/hall" class="btn btn-secondary">Back</a>
    </div>
    <h2 style="text-align: center">Add Hall</h2>
    <spring:form
      method="post"
      action="/admin/hall/add"
      modelAttribute="hallBean"
      class="m-5"
      enctype="multipart/form-data"
    >
      <div class="form-group">
        <label for="name">Hall Name</label>
        <spring:input
          type="text"
          class="form-control border border-dark"
          name="name"
          path="name"
          required="true"
        />
      </div>
      <div class="form-group">
        <label for="address">Address</label>
        <spring:input
          type="text"
          class="form-control border border-dark"
          name="address"
          path="address"
          required="true"
        />
      </div>
      <div class="form-group">
        <label for="capacity">Capacity</label>
        <spring:input
          type="number"
          class="form-control border border-dark"
          name="capacity"
          path="capacity"
          required="true"
        />
      </div>
      <div class="form-group">
        <label for="price">Price</label>
        <spring:input
          type="number"
          class="form-control border border-dark"
          name="price"
          path="price"
          required="true"
        />
      </div>
      <div class="form-group">
        <label for="phone">Phone</label>
        <spring:input
          type="number"
          class="form-control border border-dark"
          name="phone"
          path="phone"
          required="true"
        />
      </div>
      <div class="form-group">
        <label for="file">Image</label>
        <input
          type="file"
          class="form-control border border-dark"
          name="file"
          required="true"
        />
      </div>

      <div style="text-align: center">
        <input type="submit" value="Add" />
      </div>
    </spring:form>
    <c:set var="added" value="${added}" />
    <c:if test="${added!=null}">
      <script>
        showSuccessMsg("Added Successfully");
      </script>
    </c:if>
  </body>
</html>
