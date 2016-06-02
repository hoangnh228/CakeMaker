<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
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
                                        <form>
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
                                                        <s:iterator value="list">
                                                            <tr class="rowEven">
                                                                <td class="cartQuantity">
                                                                    <input type="text" name="cart_quantity[]" value="<s:property value="quantity"/>">" size="4" /><br /><span class="alert bold"></span><br /><br />       
                                                                </td>
                                                                <td class="cartProductDisplay">
                                                                    <a href="#">
                                                                        <span id="cartProdTitle"><s:property value="title"/>"></span>
                                                                        <span id="cartImage" class="back"><img src="images/01.jpg" width="201" height="201" /></span></a>
                                                                    <br class="clearBoth" />
                                                                </td>
                                                                <td class="cartUnitDisplay price"><s:property value="price"/></td>
                                                                <td class="cartTotalDisplay">$550.00</td>
                                                                <td class="cartRemoveItemDisplay">
                                                                    <input type="checkbox" name="cart_delete[]" value="1" />
                                                                </td>
                                                            </tr>
                                                        </s:iterator>
                                                    </table>
                                                </div>
                                            </div>
                                            <div id="cartSubTotal">Total: <span class="price">$761.00</span></div>
                                            <div class="buttonRow forward"><input type="image" src="public/images/button_update_cart.gif" /></div>
                                            <div class="wrapper">
                                                <div class="shcart_btn">
                                                    <div class="btn1"><a href="<s:url action="checkout" />"><span class="cssButton button_checkout" onmouseover="this.className='cssButtonHover button_checkout button_checkoutHover'" onmouseout="this.className='cssButton button_checkout'" style="width: 80px;" >&nbsp;Checkout&nbsp;</span></a></div>
                                                    <div class="btn1"><a href="<s:url action="index" />"><span class="cssButton button_continue_shopping" onmouseover="this.className='cssButtonHover button_continue_shopping button_continue_shoppingHover'" onmouseout="this.className='cssButton button_continue_shopping'" style="width: 110px;" >&nbsp;Continue Shopping&nbsp;</span></a></div>
                                                </div>
                                            </div>
                                        </form>
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
