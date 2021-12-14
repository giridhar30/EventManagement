<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- <nav
  class="navbar navbar-expand-lg navbar-light shadow"
  style="background-color: rgba(255, 255, 255, 0.5)"
>
  <a class="navbar-brand" href="#"
    ><img
      src="/images/logo.jpg"
      width="auto"
      height="50px"
      style="object-fit: contain"
  /></a>
  <button
    class="navbar-toggler"
    type="button"
    data-toggle="collapse"
    data-target="#navbarSupportedContent"
    aria-controls="navbarSupportedContent"
    aria-expanded="false"
    aria-label="Toggle navigation"
  >
    <span class="navbar-toggler-icon"></span>
  </button>

  <div
    class="collapse navbar-collapse"
    id="navbarSupportedContent"
    style="margin-left: 65px"
  >
    <ul class="navbar-nav mr-auto">
      <li class="nav-item" style="margin-right: 50px">
        <a class="nav-link" href="#">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Book hall</a>
      </li>
    </ul>
    <div style="float: inline-end">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item" style="margin-right: 50px">
          <a class="nav-link" href="#">My Events</a>
        </li>
        <li class="nav-item">
          <c:choose>
            <c:when test="${user == null}">
              <a href="#">
                <button type="button" class="btn btn-primary">Login</button>
              </a>
            </c:when>
            <c:otherwise>
              <p>${user.name}</p>
            </c:otherwise>
          </c:choose>
        </li>
      </ul>
    </div>
  </div>
</nav> -->

<c:url value="/user/logout" var="logoutUrl" />
    <form id="logout" action="${logoutUrl}" method="post">
      <input
        type="hidden"
        name="${_csrf.parameterName}"
        value="${_csrf.token}"
      />
    </form>

<nav class="navbar navbar-light bg-primary navbar-expand-lg" id="mainNav">
  <div class="container"><b class="fa fa-diamond text-white"></b>&nbsp;&nbsp;<a class="navbar-brand text-white href="#page-top">GRANDEUR EVENT MANAGERS</a><button data-bs-toggle="collapse" data-bs-target="#navbarResponsive" class="navbar-toggler navbar-toggler-right" type="button" aria-controls="navbarResponsive" aria-expanded="false"><i class="fa fa-align-justify"></i></button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ms-auto">      
            <li class="nav-item"><a class="nav-link text-white" href="/">Home</a></li>
            <li class="nav-item"><a class="nav-link text-white" href="/contact">Contact</a></li>
            <li class="nav-item"><a class="nav-link text-white" href="/user/events">My events</a></li>       
          <c:choose>
          <c:when test="${pageContext.request.userPrincipal.name != null}">
            <li class="nav-item"><a class="nav-link text-white" href="javascript:document.getElementById('logout').submit()">Log out</a></li>
          </c:when>
          <c:otherwise>
            <li class="nav-item"><a class="nav-link text-white" href="/user/register">Sign up</a></li>
            <li class="nav-item"><a class="nav-link text-white" href="/user/login">Login</a></li>
          </c:otherwise>
        </c:choose>
        </ul>
      </div>
  </div>
</nav>
