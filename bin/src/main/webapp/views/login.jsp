<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Login</title>
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
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  </head>
  <body>
    <%@include file="navbar.jsp" %>
    <form method="post" class="m-5" modelAttribute="userData">
      <p class="h2 text-black text-center">User Login</p>

      <div class="form-group m-4">
        <label style="margin-left: 25%" for="mailId">Email</label>
        <input
          type="email"
          class="form-control border border-primary"
          style="margin-left: 25%; width: 50%"
          name="mailId"
          required
        />
      </div>

      <div class="form-group m-4">
        <label style="margin-left: 25%" for="password">Password</label>
        <input
          type="password"
          class="form-control border border-primary"
          style="margin-left: 25%; width: 50%"
          name="password"
          required
        />
      </div>

      <input
        type="hidden"
        name="${_csrf.parameterName}"
        value="${_csrf.token}"
      />

      <div class="text-center">
        <input
          type="submit"
          class="btn btn-primary"
          style="width: 20%"
          value="LOGIN"
        />
      </div>
    </form>

    <div class="text-center">
      Not a user? <a href="/user/register">Register Now</a>
    </div>

    <c:set var="error" value="${error}" />
    <c:if test="${error!=null}">
      <script>
        swal("Login failed!", "${error}", "error");
      </script>
    </c:if>
  </body>
</html>
