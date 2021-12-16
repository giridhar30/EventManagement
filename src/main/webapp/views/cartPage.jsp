<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
   #cart-div {
      box-shadow: 1px 1px 15px 2px grey;
      border-radius: 5px;
      background-color: white;;
      height: 80vh;
      padding: 10px;
      width: 310px;
      position: fixed;
      right: 30px;
      bottom: 40px;
     
   }
   #cart-div-inner {
      height: 75vh;
      overflow-y: scroll;
      overflow-x: hidden;
   }
   .my-img {
      object-fit: contain;
   }

   .my-txt {
      margin: 0px;
   }

   #cart-div-inner::-webkit-scrollbar {
      display: none;
   }

/* Hide scrollbar for IE, Edge and Firefox */
   #cart-div-inner {
      -ms-overflow-style: none;  /* IE and Edge */
      scrollbar-width: none;  /* Firefox */
   }
</style>

<div id="cart-div">
   <div id="cart-div-inner">
      <div style="position: sticky; top: 0px; background-color: white; padding: 5px">
         <h5 style="text-align: center;">Your Picks</h5>
      </div>
      <div style="margin-bottom: -5px;">
         <div style="display: flex; align-items: center;">
            <div>
               <img src="${event.hall.imgUrl}"  alt="Hall" width="80px" height="80px" class="my-img" />
            </div>
            <div style="margin: 0px 10px 0px 10px; width: 250px">
               <div style="display: flex; justify-content: space-between;">
                  <p class="my-txt" style="flex-wrap: wrap;font-weight: bold;">${event.hall.name} </p>
                  <div style="float: right; margin-left: 10px;">
                     <p class="my-txt">&#x20b9;${event.hall.price}/day</p>
                  </div>
               </div>
               <c:set var="isWed" value="${event.type.toLowerCase().equals(\"wedding\") == true}" scope="session" />
               <p style="font-size: 13px; color: grey" class="my-txt">${event.fromDate} 
                  <c:if test="${isWed}" >
                     To ${event.toDate}
                  </c:if>
               </p>
               <c:if test="${isWed}">
                  <div style="float: right">
                     <p style="font-weight: bold;">&#x20b9;${event.hall.price * event.noOfDays}</p>
                  </div>
               </c:if>
            </div>
         </div>
      </div>
      <hr />
  <c:forEach items="${event.addons}" var="addon" varStatus="loop">
     
     <div style="display: flex; align-items: center;">
      <div>
         <c:choose>
            <c:when test="${addon.getClass().getName().contains(\"Photography\")}">
               <img src="/images/photo/photo1.jpeg"  alt="Hall" width="80px" height="80px" class="my-img" />
            </c:when>
            <c:when test="${addon.getClass().getName().contains(\"CakeTrans\")}">
               <img src="${addon.cake.imgUrl}"  alt="Hall" width="80px" height="80px" class="my-img" />
            </c:when>
            <c:otherwise>
               <img src="${addon.imgUrl}"  alt="Addon" width="80px" height="80px" class="my-img" />
            </c:otherwise>
         </c:choose>
      </div>
      <div style="margin: 0px 10px 0px 10px; width: 250px">
               <c:choose>
                  <c:when test="${addon.getClass().getName().contains(\"CakeTrans\")}">
                     <div style="display: flex; justify-content: space-between;">
                        <div style="display: flex; justify-content: space-between;">
                        <p class="my-txt" style="flex-wrap: wrap;font-weight: bold;">${addon.cake.name} </p>
                        <div style="float: right; margin-left: 10px;">
                           <p class="my-txt">&#x20b9;${addon.cake.price}/kg</p>
                        </div>
                     </div>
                     </div>
                     <p style="font-size: 13px; color: grey">Kg: ${addon.weight}</p>
                     <div style="float: right">
                        <p style="font-weight: bold;">&#x20b9;${addon.cake.price * addon.weight}</p>
                     </div>
                  </c:when>
                  <c:when test="${addon.getClass().getName().contains(\"Decoration\")}">
                     <div style="display: flex; justify-content: space-between;">
                        <p class="my-txt" style="flex-wrap: wrap;font-weight: bold;">${addon.name} </p>
                        <div style="float: right; margin-left: 10px;">
                           <p class="my-txt" style="font-weight: bold;">&#x20b9;${addon.price}</p>
                        </div>
                     </div>
                  </c:when>
                  <c:otherwise>
                     <div style="display: flex; justify-content: space-between;">
                        <p class="my-txt" style="flex-wrap: wrap;font-weight: bold;">${addon.name} </p>
                        <div style="float: right; margin-left: 10px;">
                           <p class="my-txt" style="font-weight: bold;">&#x20b9;${addon.price}</p>
                        </div>
                     </div>
                     <p style="font-size: 13px; color: grey">Type: ${addon.type}</p>
                  </c:otherwise>
               </c:choose>
              
            
      </div>
   </div>
   <div style="text-align: center;padding: 5px;">
      <form method="post" action="/event/addon/delete" id="deleteForm${loop.index}">
         <input type="hidden" name="index" value="${loop.index}" />
         <input
         type="hidden"
         name="${_csrf.parameterName}"
         value="${_csrf.token}"
       />
       <input type="hidden" name="currentUrl" value="${requestScope['javax.servlet.forward.request_uri']}" /> 
      <button type="submit" form="deleteForm${loop.index}" class="btn btn-outline-danger" style="font-size: 12px;margin-top: -10px;">REMOVE</button>
      </form>
   </div>
     <hr />
  </c:forEach>
</div>
<c:if test="${event != null}">
   <div style="position: absolute; bottom: 0; left: 0;">  
      <form action="/payment" method="post" id="paymentForm">
      </form>
      <button class="btn btn-primary p-3" type="submit" form="paymentForm" style="border-radius: 0; width: 310px; ">Continue to Payment: &#x20b9;${event.totalPrice}</button>
   </div>
</c:if>
</div>
