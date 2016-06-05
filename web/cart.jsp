<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en">
    <s:include value="header.jsp">
        <s:param name="titlePage">Cake Maker</s:param>
    </s:include>
    <body id="indexHomeBody">
        <div class="extra">
            <div class="main-width">
                <s:include value="toppage.jsp" />
                <table border="0" cellspacing="0" cellpadding="0" width="100%" id="contentMainWrapper">
                    <tr>
                        <td id="column-center" valign="top">
                            <div class="column-center-padding">
                                <div class="centerColumn" id="indexDefault">
                                    <div class="centerBoxWrapper" id="featuredProducts">
                                        <h2 class="centerBoxHeading">Shopping Cart</h2>
                                        <s:if test="hasActionErrors()">
                                            <h2><s:actionerror /></h2>
                                        </s:if>
                                        <s:if test="hasActionMessages()">
                                            <h2><s:actionmessage/></h2>
                                        </s:if>
                                        <div class="tie text2">
                                            <div class="tie-indent">
                                                <br class="clearBoth" />
                                                <table  border="0" width="100%" cellspacing="0" cellpadding="0" id="cartContentsDisplay">
                                                    <tr class="tableHeading">
                                                        <th scope="col" id="scQuantityHeading">Quantity</th>
                                                        <th scope="col" id="scProductsHeading">Item Name</th>
                                                        <th scope="col" id="scTotalHeading">Price</th>
                                                        <th scope="col" id="scTotalHeading">Total</th>
                                                        <th scope="col" id="scRemoveHeading">Delete</th>
                                                    </tr>
                                                    <c:set var="s" value="0"></c:set>
                                                    <c:forEach var="it" items="${sessionScope.cart}">
                                                        <c:set var="s" value="${s + it.product.price * it.quantity}"></c:set>
                                                        <tr class="rowEven">
                                                            <td class="cartQuantity">
                                                                ${it.quantity}
                                                            </td>
                                                            <td class="cartProductDisplay">
                                                                <a href="<s:url action="product-detail?id=" />${it.product.id}">
                                                                    <span id="cartProdTitle">${it.product.title}</span>
                                                                    <span id="cartImage" class="back"><img src="public/upload/product/${it.product.image}" width="201" height="201" /></span></a>
                                                                <br class="clearBoth" />
                                                            </td>
                                                            <td class="cartUnitDisplay price"><fmt:formatNumber value="${it.product.price}" minFractionDigits="2" maxFractionDigits="2"/></td>
                                                            <td class="cartTotalDisplay">$<fmt:formatNumber value="${it.product.price * it.quantity}" minFractionDigits="2" maxFractionDigits="2"/></td>
                                                            <td class="cartRemoveItemDisplay">
                                                                <a href="<s:url action="delete-cart?id=" />${it.product.id}">[X]</a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </table>
                                            </div>
                                        </div>
                                        <div id="cartSubTotal">Total: <span class="price">$<fmt:formatNumber value="${s}" minFractionDigits="2" maxFractionDigits="2"/></span></div>
                                        <div class="wrapper">
                                            <div class="shcart_btn">
                                                <s:if test="!#session.userId">
                                                    <div class="btn1"><a href="<s:url action="login" />"><span class="cssButton button_checkout" onmouseover="this.className='cssButtonHover button_checkout button_checkoutHover'" onmouseout="this.className='cssButton button_checkout'" style="width: 80px;" >&nbsp;Please login to Checkout&nbsp;</span></a></div>
                                                </s:if>
                                                
                                                <div class="btn1"><a href="<s:url action="index" />"><span class="cssButton button_continue_shopping" onmouseover="this.className='cssButtonHover button_continue_shopping button_continue_shoppingHover'" onmouseout="this.className='cssButton button_continue_shopping'" style="width: 110px;" >&nbsp;Continue Shopping&nbsp;</span></a></div>
                                            </div>
                                        </div>
                                        <s:set var="sess">${s}</s:set>
                                        <s:if test="#session.userId && #sess > 0">
                                            <div class="tie text2" style="margin-top: 20px">
                                                <div class="tie-indent">
                                                    <form name="feedback" action="<s:url action="checkout" />" method="post">
                                                        <fieldset id="contactUsForm">
                                                            <legend>Checkout</legend>
                                                            <div class="alert alignright" style="margin-right: 300px;">* Required information</div>
                                                            <label class="inputLabel" for="name">Name:<span class="alert">*</span></label>
                                                            <input required type="text" name="order.name"  size="40" id="name" /><br class="clearBoth" />
                                                            <label class="inputLabel" for="email">Email:<span class="alert">*</span></label>
                                                            <input required type="text" name="order.email"  size="40" id="email" /><br class="clearBoth" />
                                                            <label class="inputLabel" for="email">Address:<span class="alert">*</span></label>
                                                            <input required type="text" name="order.address"  size="40" id="email" /><br class="clearBoth" />
                                                            <label class="inputLabel" for="phone">Phone:<span class="alert">*</span></label>
                                                            <input required type="text" name="order.phone"  size="40" id="phone" /><br class="clearBoth" />
                                                            <label  class="inputLabel" for="enquiry">Message:<span class="alert">*</span></label>
                                                            <textarea required name="order.note" cols="20" rows="7" id="enquiry"></textarea>
                                                        </fieldset>
                                                        <div class="buttonRow forward"><input class="cssButton button_send" onmouseover="this.className='cssButtonHover button_send button_sendHover'" onmouseout="this.className='cssButton button_send'" type="submit" value="Checkout Now" style="width: 80px;" /></div>
                                                    </form>
                                                    <div class="clear"></div>
                                                </div>
                                            </div>
                                        </s:if>
                                    </div>
                                </div>
                                <div class="clear"></div>
                            </div>
                        </td>
                        <s:include value="sidebar.jsp" />
                    </tr>
                </table>
                <s:include value="footer.jsp" />
            </div>
        </div>
    </body>
</html>
