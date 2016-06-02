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
                                        <h2 class="centerBoxHeading">Category: ${name}</h2>
                                        <s:iterator value="list">
                                            <div class="centerBoxContentsFeatured centeredContent back" style="width:33%;">
                                                <div class="product-col">
                                                    <div class="img">
                                                        <a href="<s:url action="product-detail?id="/><s:property value="id"/>"><img src="public/upload/product/<s:property value="image"/>" width="201" height="201"/></a>
                                                    </div>
                                                    <div class="prod-info">
                                                        <a class="name" href="#"><s:property value="title"/></a>
                                                        <div class="wrapper">
                                                            <div class="price">
                                                                <strong>$<s:property value="price"/></strong>
                                                            </div>
                                                            <div class="button"><a href="<s:url action="add-cart?id="/><s:property value="id"/>"><span class="cssButton button_add_to_cart" onmouseover="this.className = 'cssButtonHover button_add_to_cart button_add_to_cartHover'" onmouseout="this.className = 'cssButton button_add_to_cart'" style="width: 80px;">&nbsp;Add to Cart&nbsp;</span></a></div>
                                                            <div class="button1"><a href="<s:url action="product-detail?id="/><s:property value="id"/>"><span class="cssButton button_goto_prod_details" onmouseover="this.className = 'cssButtonHover button_goto_prod_details button_goto_prod_detailsHover'" onmouseout="this.className = 'cssButton button_goto_prod_details'" style="width: 80px;">&nbsp;Details&nbsp;</span></a></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </s:iterator>
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
