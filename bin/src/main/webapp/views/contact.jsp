<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Contact Us</title>
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
  </head>
  <body>
    <%@include file="navbar.jsp" %>
    <div class="container mt-5">
      <div class="row">
        <div class="col-lg-8 text-center mx-auto">
          <h2 class="section-heading mt-5">Let's Get In Touch!</h2>
          <hr class="my-4" />
          <p class="mb-5">
            Have any queries regarding our services? Don't Hesitate! Give us a
            call or send us an email and we will get back to you as soon as
            possible!
          </p>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-4 text-center ms-auto">
          <i
            class="fa fa-phone fa-3x mb-3 sr-contact text-primary"
            style="opacity: 1; font-size: 5rem"
            data-aos="zoom-in"
            data-aos-duration="300"
            data-aos-once="true"
          ></i>
          <p>0422-2401001</p>
        </div>
        <div class="col-lg-4 text-center me-auto">
          <i
            class="fa fa-envelope-o fa-3x mb-3 sr-contact text-primary"
            style="opacity: 1; font-size: 5rem"
            data-aos="zoom-in"
            data-aos-duration="300"
            data-aos-delay="300"
            data-aos-once="true"
          ></i>
          <p>queries@grandeurevents.com</p>
        </div>
        <div class="col-lg-4 text-center ms-auto">
          <i
            class="fa fa-whatsapp fa-3x mb-3 sr-contact text-primary"
            style="opacity: 1; font-size: 5rem"
            data-aos="zoom-in"
            data-aos-duration="300"
            data-aos-once="true"
          ></i>
          <p>+91 9876543210</p>
        </div>
      </div>
    </div>
  </body>
</html>
