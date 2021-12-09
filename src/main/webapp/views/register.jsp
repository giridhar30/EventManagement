<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Registration</title>
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
    <div id="errorMsg"></div>

    <div class="nav-bar">
      <div class="left">
        <h5>GRANDEUR EVENT MANAGERS</h5>
      </div>
      <div class="right">
        <a class="m-4" href="/user/login">Sign In</a>
      </div>
    </div>

    <form
      method="post"
      class="m-5"
      modelAttribute="userData"
      id="registerForm"
      onsubmit="return validateRegistration();"
    >
      <p class="h2 text-muted text-center">User Registration</p>

      <div class="form-group">
        <label for="name">Name</label>
        <input
          type="text"
          class="form-control border border-dark"
          name="name"
          id="name"
          autofocus
          required
        />
      </div>

      <div class="form-group">
        <label for="mailId">Email</label>
        <input
          type="email"
          class="form-control border border-dark"
          name="mailId"
          required
        />
      </div>

      <div class="form-group">
        <label for="password">Password</label>
        <input
          type="password"
          class="form-control border border-dark"
          id="pass"
          name="password"
          required
        />
      </div>

      <div class="form-group">
        <label for="ucpass">Confirm Password</label>
        <input
          type="password"
          class="form-control border border-dark"
          id="cpass"
          name="ucpass"
          required
        />
      </div>

      <div class="form-group">
        <label for="phone">Mobile Number</label>
        <input
          type="text"
          class="form-control border border-dark"
          id="phone"
          name="phone"
          required
        />
      </div>

      <input
        type="hidden"
        name="${_csrf.parameterName}"
        value="${_csrf.token}"
      />

      <input type="submit" class="form-control" value="REGISTER" />
    </form>

    <div class="text-center mb-5">
      Already User? <a href="/user/login">Login here</a>
    </div>

    <c:set var="error" value="${error}" />
    <c:if test="${error!=null}">
      <script>
        showErrorMsg("${error}");
      </script>
    </c:if>
  </body>
</html>
