<%@page import="com.app.model.User"%> <%@page
import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="com.app.security.MyUserDetails"%> <%@ page language="java"
contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> <%@
taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Home</title>
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
    <div id="successMsg"></div>

    <c:url value="/user/logout" var="logoutUrl" />
    <form id="logout" action="${logoutUrl}" method="post">
      <input
        type="hidden"
        name="${_csrf.parameterName}"
        value="${_csrf.token}"
      />
    </form>

    <% Object obj =
    SecurityContextHolder.getContext().getAuthentication().getPrincipal(); User
    user = null; if (obj instanceof MyUserDetails) { user = ((MyUserDetails)
    obj).getUser(); } if (user != null) { out.println(user); } %>

    <c:choose>
      <c:when test="${pageContext.request.userPrincipal.name != null}">
        <a href="javascript:document.getElementById('logout').submit()">
          Logout
        </a>
      </c:when>
      <c:otherwise>
        <a href="/user/login">Sign In</a>
        <a href="/user/register">Sign Up</a>
      </c:otherwise>
    </c:choose>
    <a href="/user/events">My Events</a>

    <c:set var="logout" value="${logout}" />
    <c:if test="${logout!=null}">
      <script>
        showSuccessMsg("${logout}");
      </script>
    </c:if>
    <c:set var="login" value="${login}" />
    <c:if test="${login!=null}">
      <script>
        showSuccessMsg("${login}");
      </script>
    </c:if>
  </body>
</html>
