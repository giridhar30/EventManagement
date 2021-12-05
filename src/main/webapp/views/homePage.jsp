<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="/WEB-INF/customtags.tld" prefix="mytag" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="ISO-8859-1">
      <title>Welcome to Event Management</title>
   </head>
   <body>
      <h1>Welcome to Event Management</h1>
      <p>Select your desired event<p>
      <mytag:homeEventsDisplay eventList="<= request.getAttribute('eventTypes')>" />
   <body>
</html>