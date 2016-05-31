<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="header">
    <div class="logo">
        <a href="#"><img src="public/images/logo.jpg" alt="" width="241" height="104"/></a>
    </div>
    <div class="menu">
        <div id="navEZPagesTop">
            <ul>
                <li class="selected  first">
                    <a href="<s:url value="/" />">
                    <span class="corner"></span>
                    <span>
                        <span>Home</span>
                    </span>
                    </a>
                </li>
                <li class="">
                    <a href="<s:url action="product" />">
                    <span class="corner"></span>
                    <span>
                        <span>Products</span>
                    </span>
                    </a>
                </li>
                <li class="">
                    <a href="<s:url action="contact-us" />">
                    <span class="corner"></span>
                    <span>
                        <span>Contact Us</span>
                    </span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="lang navigation" style="left: inherit">
	<a href="#">Login</a>  
    </div>
    <div class="cart">
        <a class="st1" href="#"><span>Shopping cart:</span></a><a class="on"><span class="count">0</span> items</a>
        <div class="none"> Your cart is empty.</div>
    </div>
    <div id="head-search">
        <form name="quick_find_header" action="#" method="get">
            <div>
                <input type="hidden" name="main_page" value="advanced_search_result"/>
                <input type="hidden" name="search_in_description" value="1"/>
                <input type="hidden" name="zenid" value="80qi25kjf9b5ju95uuu1r9rhc1"/>
                <input type="text" name="keyword" size="18" class="input1" maxlength="100" style="width: -30px"/>
                <span class="input2">
                    <input class="cssButton search" onmouseover="this.className = 'cssButtonHover search searchHover'" onmouseout="this.className = 'cssButton search'" type="submit" value="Search" style="width: 80px;"/>
                </span>
            </div>
        </form>
    </div>
    <div class="hor-cat">
        <div id="dropMenuWrapper">
            <div id="dropMenu">
                <ul class="level1">
                    <c:forEach items="${sessionScope.menu}" var="item">
                        <li><a href="<s:url action="category?id=" />${item.id}">${item.title}</a></li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="clearBoth"></div>
    </div>
    <div id="bannerOne">
        <a href="#"><img src="public/images/banner1.jpg" alt="" width="241" height="104"/></a>
    </div>
</div>
<div class="slider">
    <script language="javascript" type="text/javascript">
        jQuery(window).load(function () {
            jQuery('#slider').nivoSlider({
                effect: 'fade',
                animSpeed: 500,
                pauseTime: 4000,
                directionNav: true,
                directionNavHide: false,
                controlNav: false,
                pauseOnHover: true,
                captionOpacity: 0.8
            });
        });
    </script>
    <div class="slider-wrapper theme-default">
        <div id="slider" class="nivoSlider">
            <c:forEach items="${sessionScope.slider}" var="item">
                <a href="#"><img src="public/upload/banner/${item.url}" alt="" width="1024" height="376"/></a>
            </c:forEach>
        </div>
    </div>
</div>