<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="/WEB-INF/customtags.tld" prefix="mytag" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>Welcome to Event Management</title>
   </head>
   <body>
      <h1>Welcome to Event Management</h1>
      <p>Select your desired event<p>
      <div style="display: flex;">
         <ul style="display: flex;">
         <mytag:homeEventsDisplay eventList="<%= (ArrayList)request.getAttribute(\"eventTypes\")%>" />
         </ul>
      </div>
   <body>
</html>