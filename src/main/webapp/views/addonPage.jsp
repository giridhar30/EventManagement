<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="ISO-8859-1"%> <%@ taglib uri="/WEB-INF/customtags.tld"
prefix="mytag" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Choose addons</title>
    <link rel="stylesheet" href="/assets/styles2.css" />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />
    <style>
      .disp-img {
        height: 160px;
        object-fit: contain;
      }
      .link:hover {
        text-decoration: none;
        color: black;
        box-shadow: 1px 1px 10px 1px grey;
      }

      .link {
        color: black;
        border-radius: 5px;
      }
    </style>
  </head>
  <body>
    <%@ include file="navbar.jsp" %>

    <div class="container" style="padding-bottom: 30px">
      <div class="row">
        <div class="col-sm-9">
          <h4 style="text-align: center">Addons you might like</h4>
        </div>
      </div>
      <div class="row" style="text-align: center; padding-top: 20px">
        <div class="col-sm-9">
          <div class="row">
            <div
              class="col-sm-6"
              style="display: flex; justify-content: center"
            >
              <div class="card" style="width: 18rem">
                <a href="/event/addon/decoration" class="link">
                  <img
                    src="/images/decor/decor3.jpg"
                    class="card-img-top disp-img"
                    alt="Decoration"
                  />
                  <div class="card-body">
                    <h5 class="card-title">Decoration</h5>
                    <p class="card-text">
                      Add decorations to the hall by selecting the decoration
                      you like
                    </p>
                    <!-- <a href="#" class="btn btn-primary"></a> -->
                  </div>
                </a>
              </div>
            </div>
            <div
              class="col-sm-6"
              style="display: flex; justify-content: center"
            >
              <div class="card" style="width: 18rem">
                <a href="/event/addon/cake" class="link">
                  <img
                    src="/images/cake/cake4.jpg"
                    class="card-img-top disp-img"
                    alt="Cake"
                  />
                  <div class="card-body">
                    <h5 class="card-title">Cake</h5>
                    <p class="card-text">
                      You can order cake for the ${event.type} here.
                    </p>
                    <!-- <a href="#" class="btn btn-primary">Go somewhere</a> -->
                  </div>
                </a>
              </div>
            </div>
            <div
              class="col-sm-12"
              style="display: flex; justify-content: center; margin-top: 20px"
            >
              <div class="card" style="width: 18rem">
                <a href="/event/addon/photography" class="link">
                  <img
                    src="/images/photo/photo1.jpeg"
                    class="card-img-top disp-img"
                    alt="Photography"
                  />
                  <div class="card-body">
                    <h5 class="card-title">Photography</h5>
                    <p class="card-text">
                      Select photography of your choice from our set of packages
                    </p>
                    <!-- <a href="#" class="btn btn-primary">Go somewhere</a> -->
                  </div>
                </a>
              </div>
            </div>
          </div>
        </div>
        <div class="col-sm-3"><%@ include file="cartPage.jsp" %></div>
      </div>
    </div>
  </body>
</html>