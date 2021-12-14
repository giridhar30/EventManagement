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
      <a href="/admin/photography" class="btn btn-secondary">Back</a>
    </div>
    <h2 style="text-align: center">Add Photography</h2>
    <spring:form
      method="post"
      action="/admin/photography/add"
      modelAttribute="photoBean"
      class="m-5"
      enctype="multipart/form-data"
    >
      <div class="form-group">
        <label for="name">Photography Name</label>
        <spring:input
          type="text"
          class="form-control border border-dark"
          name="name"
          path="name"
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
        <label for="type">Type</label>
        <spring:select
          name="type"
          path="type"
          class="form-control border border-dark"
          required="true"
        >
          <spring:option value="Photo">Photo</spring:option>
          <spring:option value="Photo+Video ">Photo + Video</spring:option>
          <spring:option value="Photo+Video+Album"
            >Photo + Video + Album</spring:option
          >
          <spring:option value="Photo+Album">Photo + Album</spring:option>
        </spring:select>
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
