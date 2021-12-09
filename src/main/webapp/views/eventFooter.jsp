<%@page import="com.app.model.Event"%>
<div>
   <% 
      Event event = (Event)session.getAttribute("event");
      out.println("<p>Total: " + event.getTotalPrice() +"</p>");
   %>
</div>