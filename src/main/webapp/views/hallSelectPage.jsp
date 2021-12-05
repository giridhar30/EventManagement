<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="/WEB-INF/customtags.tld" prefix="mytag" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>Choose Hall</title>
      <script>
         function fetchHalls() {
            const from = document.getElementById("from").value;
            const to = document.getElementById("to").value;
            console.log(from, to);
            if(from && to) {
               const request = new XMLHttpRequest();
               request.open("GET", 'http://localhost:8080/event/hall/' + from + "/" + to, true);
               request.onreadystatechange = () => {
                  if(request.readyState === request.DONE && request.status == 200) {
                     let json = JSON.parse(request.response)
                     displayHalls(json);
                  } 
               };
               request.send();
            }
         }

         function displayHalls(halls) {
            console.log(halls);
            const list = document.getElementById("halls");
            const addItems = (hall, available) => {
               let li = document.createElement("li");
               let div = document.createElement("div");
               
               if(available) {
                  let a = document.createElement("a");
                  a.setAttribute("href", 'http://localhost:8080/event/hall/' + hall.id);
                  div.appendChild(a);
                  div = a;
               }

               li.appendChild(div);
               let img = document.createElement('img');
               img.setAttribute("src", "http://localhost:8080/" + hall.imageUrl);
               // add class here for img
               let p1 = document.createElement("p");
               p1.innerHTML = hall.name;
               let p2 = document.createElement("p");
               p2.innerHTML = "Capacity: " + hall.capacity;
               let p3 = document.createElement("p");
               p3.innerHTML = "Price: &#x20b9;" + hall.price + "/day";
               div.appendChild(img);
               div.appendChild(p1);
               div.appendChild(p2);
               div.appendChild(p3);
               
               if(!available) {
                  let p4 = document.createElement("p");
                  p4.innerHTML = "Hall Booked" ;
                  div.appendChild(p4);
               }
               list.appendChild(li);
            }
            halls.available.forEach((hall) => {
              addItems(hall, true);
            });
            halls.unavailable.forEach((hall) => {
              addItems(hall, false);
            })
         }
      </script>
   </head>
   <body>
      Select event date
      <form>
         <label>From: </label> <input type="date" id="from" />
         <label>To: </label> <input type="date" id="to" />
         <button type="button" onclick="fetchHalls()">Find available Halls</button>
      </form>
      <div>
         <ul id="halls">

         </ul>
      </div>
   <body>
</html>