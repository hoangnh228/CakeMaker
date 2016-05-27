<%@taglib prefix="s" uri="/struts-tags" %>
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
                    <a href="<s:url value="product" />">
                    <span class="corner"></span>
                    <span>
                        <span>Products</span>
                    </span>
                    </a>
                </li>
                <li class="">
                    <a href="<s:url value="/contact-us" />">
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
                    <li class="submenu">
                        <a href="#">MEAT</a>
                        <ul class="level2">
                            <li>
                                <a href="#">Lorem ipsum</a>
                            </li>
                        </ul>
                    </li>
                    <li><a href="#">SEAFOOD</a></li>
                    <li><a href="#">ENTREES</a></li>
                    <li><a href="#">PIZZA &amp; PASTA</a></li>
                    <li><a href="#">SIDE DISHES</a></li>
                    <li><a href="#">APPETIZERS</a></li>
                    <li><a href="#">SNACKS</a></li>
                    <li><a href="#">ICE CREAM</a></li>
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
            <a href="#"><img src="public/images/banner2.jpg" alt="" width="1024" height="376"/></a>
            <a href="#"><img src="public/images/banner3.jpg" alt="" width="1024" height="376"/></a>
            <a href="#"><img src="public/images/banner4.jpg" alt="" width="1024" height="376"/></a> 
        </div>
    </div>
</div>