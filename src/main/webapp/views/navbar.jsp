<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav
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
</nav>
