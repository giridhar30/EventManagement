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
    <div id="errorMsg"></div>

    <form method="post" class="m-5" modelAttribute="userData">
      <p class="h1 text-muted text-center">User Login</p>

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
          name="password"
          required
        />
      </div>

      <input
        type="hidden"
        name="${_csrf.parameterName}"
        value="${_csrf.token}"
      />

      <input type="submit" class="form-control" value="LOGIN" />
    </form>

    <div class="text-center">
      Not a user? <a href="/user/register">Register Now</a>
    </div>

    <c:set var="error" value="${error}" />
    <c:if test="${error!=null}">
      <script>
        showErrorMsg("${error}");
      </script>
    </c:if>
  </body>
</html>
