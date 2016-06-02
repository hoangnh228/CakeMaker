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
                                        <h2 class="centerBoxHeading">Product detail</h2>
                                        <div class="tie">
                                            <div class="tie-indent">
                                                <div class="page-content">
                                                    <div class="wrapper">
                                                        <div class="fleft">
                                                            <div id="productMainImage" class="centeredContent back">
                                                                <span class="image"><img src="public/upload/product/${product.image}" width="201" height="201" /></span>
                                                            </div>
                                                        </div>
                                                        <div class="fleft desc2">
                                                            <div class="name-type bot-border">${product.title}</div>
                                                            <div style="margin-bottom: 10px;">
                                                                ${product.short_description}
                                                            </div>
                                                            <h2 class="productGeneral">
                                                                <span class="price-text">Price: &nbsp;</span>
                                                                <span class="productSpecialPrice">$${product.price}</span>
                                                            </h2>
                                                            <div id="cartAdd">
                                                                <span class="buttonRow">
                                                                    <a href="<s:url action="add-cart?id="/>${product.id}" class="cssButton button_in_cart" onmouseover="this.className='cssButtonHover button_in_cart button_in_cartHover'" onmouseout="this.className='cssButton button_in_cart'" style="width: 80px;">Add to Cart</a>
                                                                </span>		 
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div id="productDescription" class="description biggerText"><strong>Details: ${product.full_description}</strong> </div>
                                                </div>
                                            </div>
                                        </div>
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
