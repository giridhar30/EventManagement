<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
   #cart-div {
      /* background-color: ; */
      box-shadow: 1px 1px 15px 2px grey;
      border-radius: 20px;
      height: 80vh;
      padding: 10px;
      width: 20vw;
      position: fixed;
      right: 30px;
      bottom: 40px;
   }
</style>

<div id="cart-div">
   <div>
      <p>Your Selections</p>
      <div>
  <p>${event.hall.name}</p>
  <c:set var="isWed" value="${event.type.toLowerCase().equals(\"wedding\") == true}" scope="session" />
  <p>${event.fromDate} 
     <c:if test="${isWed}" >
        To ${event.toDate}
     </c:if>
  </p>
  <c:choose>
  <c:when test="${isWed}">
   <p>${event.hall.price} *  ${event.noOfDays}: ${event.noOfDays * event.hall.price}</p>
   </c:when>
   <c:otherwise>
      <p>Hall Price: ${event.hall.price}</p>
   </c:otherwise>
</c:choose>
</div>
  <c:forEach items="${event.addons}" var="addon">
       <c:choose>
        <c:when test="${addon.getClass().getName().contains(\"Decoration\")}">
            <p>${addon.name}: ${addon.price}</p>
        </c:when>
        <c:when test="${addon.getClass().getName().contains(\"CakeTrans\")}">
         <p>${addon.cake.name}: ${addon.cake.price}</p>
         <p>Kg: ${addon.weight}</p>
         <p>Cake Total: ${addon.cake.price * addon.weight * addon.quantity}</p>
      </c:when>
      <c:otherwise>
         <p>${addon.name}: ${addon.price}</p>
      </c:otherwise>
     </c:choose> 
  </c:forEach>
  <c:if test="${event != null}">
   <div style="position: absolute; bottom: 0px">  
  <p>Total Price: ${event.totalPrice}</p>
</div>
</c:if>
</div>
</div>
