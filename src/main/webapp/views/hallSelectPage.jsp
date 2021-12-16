<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/customtags.tld" prefix="mytag" %>
 <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>Choose Hall</title>
      <link rel="icon"  href="/assets/logo.png"  type="image/icon type"> 
      <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css">
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800">
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic">
      <link rel="stylesheet" href="/assets/fonts/font-awesome.min.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.css">
      <link rel="stylesheet" href="/assets/styles.css" />
      <style>
        .header {
            margin: 10%;
            padding: 3%;
            padding-top: 0;
        }
        .header h1 {
            padding: 5%;
            padding-top: 1%;
        }
        .card-text {
            margin: -3px;
            margin-left: 0px;
         }
      </style>
      <script>
         function fetchHalls() {
            const from = document.getElementById("from").value;
            const toEle = document.getElementById("to");
            let to = null;
            if(!toEle) {
               to = from;
            } else {
               to = toEle.value;
            }

            if(from && to) {
               const request = new XMLHttpRequest();
               request.open("GET", 'http://localhost:8080/api/event/hall/' + from + "/" + to, true);
               request.onreadystatechange = () => {
                  if(request.readyState === request.DONE && request.status == 200) {
                     let json = JSON.parse(request.response)
                     displayHalls(json, from, to);
                  } 
               };
               request.send();
            }
         }

         function displayHalls(halls, from, to) {
            console.log(halls);
            const list = document.getElementById("halls");
            
            const row = document.createElement("div");
            row.setAttribute("class", "row");
            list.appendChild(row);

            list.removeChild(list.childNodes[0]);
            const addItems = (hall, available) => {
               let outerdiv = document.createElement("div");
               outerdiv.setAttribute("class", "col-sm-4");
               let div = document.createElement("div");
              
               div.setAttribute("class", "card");
               div.setAttribute("style", "width: 18rem;")
               
               let img = document.createElement('img');
               img.setAttribute("src", hall.imgUrl);
               img.setAttribute("class","card-img-top");
               img.setAttribute("style", "height: 220px; object-fit: cover;")
               let innerdiv = document.createElement("div");
               innerdiv.setAttribute("class", "card-body")
               // add class here for img
               let title = document.createElement("h5");
               title.setAttribute("class", "card-title");
               title.setAttribute("style", "margin-top: 7px");
               title.innerHTML = hall.name;
               
               let address = document.createElement("p");
               address.setAttribute("class", "card-text");
               address.innerHTML = hall.address;

               let capacity = document.createElement("p");
               capacity.setAttribute("class", "card-text");
               capacity.innerHTML = "Capacity: " + hall.capacity;

               let price = document.createElement("h6");
               price.setAttribute("class", "card-text");
               price.setAttribute("style", "position: absolute; bottom: 130px; right: 10px;");
               price.innerHTML = "&#x20b9;" + hall.price + "/day";
               
               let form = document.createElement("form");
               form.setAttribute("method", "post");
               form.setAttribute("action", "/event/hall");
               form.setAttribute("style", "margin-top: 15px; float: right")

               let input1 = document.createElement("input");
               input1.setAttribute("type", "hidden");
               input1.setAttribute("name", "from");
               input1.setAttribute("value", from);
               
               let input2 = document.createElement("input");
               input2.setAttribute("type", "hidden");
               input2.setAttribute("name", "to");
               input2.setAttribute("value", to);

               let input3 = document.createElement("input");
               input3.setAttribute("type", "hidden");
               input3.setAttribute("name", "hall_id");
               input3.setAttribute("value", hall.id);

               let input4 = document.createElement("input");
               input4.setAttribute("type", "hidden");
               input4.setAttribute("name", "${_csrf.parameterName}");
               input4.setAttribute("value", "${_csrf.token}");
               
               
               let button = document.createElement("button");
               button.setAttribute("class", "btn btn-outline-primary");
               button.setAttribute("type", "submit");

               if(available) {
                  button.innerHTML = "SELECT";
               } else {
                  button.innerHTML = "BOOKED";
                  button.setAttribute("disabled", "")
               }


               form.appendChild(input1);
               form.appendChild(input2);
               form.appendChild(input3);
               form.appendChild(input4);
               form.appendChild(button);

               div.appendChild(img);
               innerdiv.appendChild(title)
               innerdiv.appendChild(address);
               innerdiv.appendChild(capacity);
               innerdiv.appendChild(price);
               innerdiv.appendChild(form);
               
               div.appendChild(innerdiv);
               outerdiv.appendChild(div);
               row.appendChild(outerdiv);
            }
            halls.available.forEach((hall) => {
              addItems(hall, true);
            });
            halls.unavailable.forEach((hall) => {
              addItems(hall, false);
            })
         }
         function computeDate() {
            var today = new Date();
            var dd = today.getDate();
            var mm = today.getMonth() + 1;
            var yyyy = today.getFullYear();
            if (dd < 10) {
               dd = '0' + dd;
            }
            if (mm < 10) {
               mm = '0' + mm;
            } 
            today = yyyy + '-' + mm + '-' + dd;
            document.getElementById("from").setAttribute("min", today);

            var to = document.getElementById("to");
            if(to) {
               to.setAttribute("min", today);
            }
         }
         
         function handleFromChange() {
            var to = document.getElementById("to");
            if(to) {
               var min = document.getElementById("from").value;
               to.setAttribute("min", min);
            }
         }
      </script>
          
   </head>
   <body onload="computeDate()">
      <%@ include file="navbar.jsp" %>
      <div style="text-align: center; margin: 10px;">
         <p>When's the ${event.type}? </p>
         <form class="m-3">
            <input type="date" id="from" onchange="handleFromChange()"/>
            <c:if test="${event.type.toLowerCase().equals(\"wedding\") == true}">
               <label style="margin-left: 5px; margin-right: 5px;">  To  </label> <input type="date" id="to" value="2021-12-10"  />
            </c:if>
            <br/>
            <button style="margin-top: 5px;margin-bottom: 20px;" type="button" class="btn btn-primary m-3" onclick="fetchHalls()">Get Halls</button>
         </form>
      </div>
      <div class='container'  id="halls">
         
      </div>
   <body>
</html>