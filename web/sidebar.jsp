<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<td id="column_right" style="width:241px">
    <div style="width:241px;">
        <div class="box " id="specials" style="width:241px;">
            <div class="box-head">
                <a href="#">Specials</a> 
            </div>
            <div class="box-body">
                <div class="sideBoxContent centeredContent">
                    <div class="img"><a href="#"><img src="public/images/14.jpg" alt="Cocktai Sausages Wrapped In Streaky Bacon" title=" Cocktai Sausages Wrapped In Streaky Bacon " width="201" height="201"/></a><br/></div>
                    <div class="desc">
                        <a class="name" href="#">Cocktai Sausages Wrapped In Streaky Bacon</a>
                        <div class="price"><span class="normalprice">$9.00 </span>&nbsp;<span class="productSpecialPrice">$743.25</span></div>
                        <a class="button1" href="#"><span class="cssButton button_goto_prod_details" onmouseover="this.className = 'cssButtonHover button_goto_prod_details button_goto_prod_detailsHover'" onmouseout="this.className = 'cssButton button_goto_prod_details'" style="width: 80px;">&nbsp;Details&nbsp;</span></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="box " id="bestsellers" style="width:241px;">
            <div class="box-head">
                Bestsellers											
            </div>
            <div class="box-body">
                <div id="bestsellersContent" class="sideBoxContent">
                    <div class="wrapper">
                        <ol>
                            <c:forEach items="${pro}" var="item">
                                <li><a class="screenshot" href="<s:url action="product-detail?id=" />${item.id}">${item.title}</a></li>
                            </c:forEach>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </div>
</td>