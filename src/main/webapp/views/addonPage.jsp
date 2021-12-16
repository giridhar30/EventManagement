<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="ISO-8859-1"%> <%@ taglib uri="/WEB-INF/customtags.tld"
prefix="mytag" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Choose addons</title>
    <link rel="icon" href="/assets/logo.png" type="image/icon type" />
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
    <script src="/assets/scripts.js"></script>
    <style>
      .disp-img {
        height: 160px;
        object-fit: contain;
      }
      .card:hover {
        text-decoration: none;
        color: black;
        box-shadow: 1px 1px 10px 1px grey;
      }

      .link {
        color: black;
        border-radius: 5px;
        text-decoration: none;
      }
    </style>
  </head>
  <body>
    <%@ include file="navbar.jsp" %>

    <div class="container" style="padding-bottom: 30px">
      <div class="row">
        <div class="col-sm-9">
          <h4 style="text-align: center" class="mt-4">Addons you might like</h4>
        </div>
      </div>
      <div class="row" style="padding-top: 20px">
        <div class="col-sm-9">
          <div class="row">
            <div
              class="col-sm-6"
              style="display: flex; justify-content: center"
            >
              <div class="card" style="width: 18rem">
                <a href="/event/addon/decoration" class="link">
                  <img
                    src="/images/decor/decor.jpg"
                    class="card-img-top disp-img"
                    alt="Decoration"
                  />
                  <div class="card-body">
                    <h5 class="card-title"><b>Decoration</b></h5>
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
                    src="/images/cake/cake.jpg"
                    class="card-img-top disp-img"
                    alt="Cake"
                  />
                  <div class="card-body">
                    <h5 class="card-title"><b>Cake</b></h5>
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
                    <h5 class="card-title"><b>Photography</b></h5>
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
