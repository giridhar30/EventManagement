<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
