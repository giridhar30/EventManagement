<%@page import="java.util.List"%> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="ISO-8859-1"%> <%@ taglib
uri="/WEB-INF/customtags.tld" prefix="mytag" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Select tyope of Decoration</title>
  </head>
  <body>
    <ul>
      <c:forEach items="${addon}" var="photo">
        <li>
          <div>
            <p>${photo.name}</p>
            <p>Price: &#x20b9;${photo.price}</p>
            <p>Type: ${photo.type}</p>
            <form method="post" action="/event/addon/photography/add">
              <input type="hidden" name="id" value="${photo.id}" />
              <input
                type="hidden"
                name="${_csrf.parameterName}"
                value="${_csrf.token}"
              />
              <input type="submit" value="Add" />
            </form>
          </div>
        </li>
      </c:forEach>
    </ul>
    <div>
      <a href="/event/addon">
        <button>Continue</button>
      </a>
    </div>
    <%@include file="cartPage.jsp" %>
  </body>
</html>
